
import 'dart:async';
import 'dart:io';
import 'dart:convert' as convert;

import 'package:app/net/api.dart';
import 'package:app/tools/help.dart';
import 'package:app/tools/toast.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/waiting_dialog.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';


class ApplePurchase {

  String productId = "";
  String recordNumber = "";

  Completer<bool>? payResult;

  bool compensate;

  ///
  /// 苹果支付监听
  ///
  StreamSubscription? _skPaymentTransactionWrapper;

  ///
  /// 苹果支付监听
  ///
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  ApplePurchase({this.compensate = false}) {
    // 处理未支付订单
    if(Platform.isIOS) {
      _skPaymentTransactionWrapper = SKPaymentQueueWrapper().transactions().asStream().listen((event) {
        event.forEach((skPaymentTransactionWrapper) {
          SKPaymentQueueWrapper().finishTransaction(skPaymentTransactionWrapper);
        });
      });
    }

    // 补单自动添加
    if(compensate) {
      showToastQueue("开始补单444");
      addPurchaseCallBack();
    }
  }

  ///
  /// 添加购买回调
  ///
  void addPurchaseCallBack() {
    _subscription?.cancel();
    // 监听支付结果
    // https://www.jianshu.com/p/5eb553a0e0f0
    _subscription = InAppPurchase.instance.purchaseStream.listen((data) async {
      showToastQueue("recordNumber = ${recordNumber}, compensate = ${compensate}, "
          "萍果返回补单数据: ${data.length}");

      // 处理内购回调
      // recordNumber为空证明是补单，而compensate表明当前不补单
      if(recordNumber.isEmpty && !compensate) {
        return;
      }
      _listenToPurchaseUpdated(recordNumber, data);
      // 检查是否支持苹果支付
    }, onError: (error) {
      debugPrint("aaa");
      showToastQueue(error.toString());
    });
  }

  ///
  /// google和苹果内购
  /// https://pub.dev/packages/in_app_purchase
  /// transaction_id
  /// iap_product_id
  ///
  Future<bool?>? appPurchase(Map data, {bool consumable = true}) async {
    if(payResult != null) {
      return Future.value(false);
    }

    // 通知苹果支付结果
    payResult = Completer();

    // 查询商品
    WaitingCtrl.obj.show(text: "请勿关闭，正在支付中..");
    // 添加购买回调
    addPurchaseCallBack();
    // 获取支付套餐
    ProductDetailsResponse? response = await InAppPurchase.instance.queryProductDetails({data["iap_product_id"] ?? ""});
    if(response == null || response.productDetails.isEmpty == true) {
      showToast("获取套餐失败");

      riseCallBack(false);
      WaitingCtrl.obj.hidden();
      return payResult?.future;
    }
    // 判断返回商品是否正确
    if(response.error != null || response.productDetails.isEmpty == true) {
      // 显示错误
      if(response.error != null) {
        showToast("支付失败: ${response.error}");
      } else {
        showToast("支付失败");
      }
      WaitingCtrl.obj.hidden();
      riseCallBack(false);
      return payResult?.future;
    }
    // 等待2秒，防止单号错乱
    await Future.delayed(const Duration(seconds: 2));

    productId = data["iap_product_id"] ?? "";
    recordNumber = data["record_number"] ?? "";

    if(productId.isEmpty || recordNumber.isEmpty) {
      showToast("订单数错误错");
      riseCallBack(false);
      return payResult?.future;
    }

    // 调起支付
    if (consumable) {
      InAppPurchase.instance.buyConsumable(
          purchaseParam: PurchaseParam(productDetails: response.productDetails.first, applicationUserName:DateTime.now().millisecondsSinceEpoch.toString())
      );
    } else {
      InAppPurchase.instance.buyNonConsumable(
          purchaseParam: PurchaseParam(productDetails: response.productDetails.first, applicationUserName:DateTime.now().millisecondsSinceEpoch.toString())
      );
    }
    return payResult?.future;
  }

  ///
  /// 监听支付回调
  ///
  void _listenToPurchaseUpdated(String recordNumber, List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        return;
      }
      if (purchaseDetails.status == PurchaseStatus.error) {
        showToastQueue("萍果支付失败：status = ${purchaseDetails.status}");
        // todo 支付失败
        _handleError(purchaseDetails.error!);
        // 隐藏loading
        WaitingCtrl.obj.hidden();
        // 通知苹果支付结果
        await InAppPurchase.instance.completePurchase(purchaseDetails);
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        showToastQueue("萍果通知服务端订单状态：status = ${purchaseDetails.status}");
        // 验证订单是否成功
        bool valid = false;
        int totalValidateTime = 3;
        while(totalValidateTime > 0) {
          // 校验订单是否成功, 服务端进行验证，成功时会返回200
          valid = await _verifyPurchase(recordNumber, purchaseDetails);
          if (valid) {
            break;
          }
          // 延迟3秒
          if(totalValidateTime <= 0) {
            break;
          }

          await Future.delayed(const Duration(seconds: 3));
          totalValidateTime = totalValidateTime - 1;
        }
        // 支付成功，返回
        if(valid) {
          // 支付成功 显示toast
          showToast("支付成功");
          riseCallBack(true);
        } else {
          // todo 显示失败
          showToast("支付失败");
          riseCallBack(false);
        }
      } else if(purchaseDetails.status == PurchaseStatus.canceled) {
        // todo 取消支
        showToast("取消支付");
        riseCallBack(false);
      }
      WaitingCtrl.obj.hidden();
      // 通知苹果支付结果
      await InAppPurchase.instance.completePurchase(purchaseDetails);
    });
  }

  ///
  /// 验证支付结果
  /// [recordNumber] 如果为空，有可能是进行补单, 需要请求另外的接口
  ///
  Future<bool> _verifyPurchase(String recordNumber, PurchaseDetails details) async {
    if(details is AppStorePurchaseDetails) {
      try {
        var result = await Api.Wallet.checkAppPayStatus(recordNumber, details.purchaseID ?? "");

        if(result is Map == false || result["code"] != 0) {
          return Future.value(false);
        }
        return Future.value(true);
      } catch(e, s) {
      }
    }
    return Future.value(false);
  }

  void _handleError(IAPError error) {

  }

  void riseCallBack(bool successed) {
    payResult?.complete(successed);
    payResult = null;
  }

  void dispose() {
    recordNumber = "";
    compensate = false;
    _subscription?.cancel();
    _skPaymentTransactionWrapper?.cancel();
  }
}