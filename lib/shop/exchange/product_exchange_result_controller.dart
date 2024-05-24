
import 'package:app/tools.dart';

/// 商品兑换结果
class ProductExchangeResultController extends GetxController {
  bool isExchangeSuccess;
  ProductExchangeResultController({required this.isExchangeSuccess});

  void clickButton(){
    Get.back();
  }


}