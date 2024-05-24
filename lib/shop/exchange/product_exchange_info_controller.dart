
import 'package:app/model/dress_up_product_model.dart';
import 'package:app/shop/exchange/product_exchange_result_dialog.dart';
import 'package:app/tools.dart';

/// 商品兑换
class ProductExchangeInfoCtrl extends GetxController {
  DressUpProductModel productModel;
  ProductExchangeInfoCtrl({required this.productModel});

  void clickConfirm(){
    Get.dialog(
      const ProductExchangeResultDialog(isExchangeSuccess: false,),
      useSafeArea: false,
    );

  }

  void clickClose(){
    Get.back();
  }
}