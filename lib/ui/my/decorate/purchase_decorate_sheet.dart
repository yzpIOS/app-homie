
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/my/decorate/purchase_activity_view.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/pic_item.dart';
import 'package:flutter/material.dart';

import 'purchase_decorate_view.dart';

class PurchaseDecorateSheet extends  StatefulWidget {

  Widget header;

  Widget view;

  PurchaseDecorateSheet({
    required this.header,
    required this.view,
    super.key
  });

  static void show(Map data) async {
    // 获取商品的高度
    Size? picItem = await ImageHelp.getNetImageSize(data["detail_image"]);

    // 商品详情的图片
    Widget headerView = createHeaderViw(data["detail_image"], picItem);

    // 2、判断是否活动所得，充值所得和购买天数
    Widget? view;
    if(!canBuy(data)) {
      view = PurchaseActivityView(data: data,);
    } else {
      view = PurchaseDecorateView(data: data,);
      var totalCount = caculateColumn(data) * 58;
      if(totalCount <= 0) {
        return;
      }
    }

    var scaleHeight = picItem != null ? ((AppSize.width / picItem.width) * picItem.height) : 0;

    // 计算sku列表的高度
    var totalCount = caculateColumn(data) * 58;

    await OrientationSheet.show(
      decoration: const ShapeDecoration(
        color: Colors.transparent,
        shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
      ),
      constraints: BoxConstraints(maxHeight: 222 + scaleHeight.toDouble() + 30 + totalCount),
      barrierColor: const Color(0x80000000),
      child: PurchaseDecorateSheet(
        header: headerView,
        view: view,
      ),
      direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
    );
  }

  static canBuy(Map data) {
    var dataList = data["label_list"] as List?;
    if (dataList != null && dataList.isNotEmpty) {
      bool itemBuyAble = dataList.isNotEmpty && dataList[0]["is_buy"] == true;
      return itemBuyAble;
    }
    return true;
  }

  static caculateColumn(Map data) {
    var totalCount = 0;
    var dataList = data["sku_list"] as List?;
    if(dataList == null) {
      return totalCount;
    }
    totalCount = (dataList.length % 3 > 0 ? dataList.length / 3 + 1 : dataList.length / 3).toInt();
    return totalCount;
  }

  static Widget createHeaderViw(String imageUrl, Size? picItem) {
    if(picItem == null || picItem.height <= 0) {
      return SizedBox();
    }
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8)
      ),
      child: PicItem(
        imageUrl,
        width: AppSize.width,
        height: ((AppSize.width.toDouble() / picItem.width.toDouble()) * picItem.height),
        autoSize: true,
        scale: picItem.width.toDouble() / AppSize.width.toDouble(),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => _PurchaseDecorateState();
}

class _PurchaseDecorateState extends State<PurchaseDecorateSheet> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.header,
          widget.view,
        ],
      ),
    );
  }
}