
import 'dart:async';

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
  String transactionId = "";

  ///
  /// 苹果支付监听
  ///
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  Completer<bool>? payResult;

  ApplePurchase() {
    _subscription?.cancel();
    // 监听支付结果
    // https://www.jianshu.com/p/5eb553a0e0f0
    _subscription = InAppPurchase.instance.purchaseStream.listen((data) async {
      // 处理内购回调
      _listenToPurchaseUpdated(data);
      // 检查是否支持苹果支付
    }, onError: (error) {
      debugPrint("aaa");
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

    productId = data["iap_product_id"] ?? "";
    transactionId = data["transaction_id"] ?? "";
    if(productId.isEmpty || transactionId.isEmpty) {
      showToast("订单数错误错");
      riseCallBack(false);
      return payResult?.future;
    }
    // 查询商品
    WaitingCtrl.obj.show();
    ProductDetailsResponse? response = await InAppPurchase.instance.queryProductDetails({productId});
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
  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        return;
      }
      if (purchaseDetails.status == PurchaseStatus.error) {
        // todo 支付失败
        _handleError(purchaseDetails.error!);
        // 隐藏loading
        WaitingCtrl.obj.hidden();
        // 通知苹果支付结果
        await InAppPurchase.instance.completePurchase(purchaseDetails);
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        // 验证订单是否成功
        bool valid = false;
        int totalValidateTime = 3;
        while(totalValidateTime > 0) {
          // 校验订单是否成功, 服务端进行验证，成功时会返回200
          valid = await _verifyPurchase(purchaseDetails);
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
  ///
  Future<bool> _verifyPurchase(PurchaseDetails details) async {
    if(details is AppStorePurchaseDetails) {
      var result = await Api.Wallet.checkAppPayStatus(transactionId);
      if(result is Map == false || result["code"] != 0) {
        return Future.value(false);
      }
      return result.isSuccess();
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
    _subscription?.cancel();
  }
}