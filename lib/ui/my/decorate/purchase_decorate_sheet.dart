
import 'package:app/common/theme.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/my/decorate/purchase_activity_view.dart';
import 'package:app/ui/my/decorate/purchase_header_avatar_view.dart';
import 'package:app/ui/my/decorate/purchase_header_background_view.dart';
import 'package:app/ui/my/decorate/purchase_header_bubble_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'Purchase_base_view.dart';
import 'purchase_charge_view.dart';
import 'purchase_decorate_view.dart';
import 'purchase_header_base.dart';
import 'purchase_header_pet_view.dart';

class PurchaseDecorateSheet extends  StatefulWidget {

  PurchaseHeaderBase header;

  PurchaseBaseView view;

  PurchaseDecorateSheet({
    required this.header,
    required this.view,
    super.key
  });

  static void show() {
    // 1、判断是头像框，汽泡、背景和宠物
    // 头像框
    PurchaseHeaderBase header = PurchaseHeaderAvatarView();
    // 汽泡
    PurchaseBubbleView();
    // 背景
    PurchaseHeaderBackgroundView();
    // 宠物
    PurchaseHeaderPetView();

    // 2、判断是否活动所得，充值所得和购买天数
    // 活动所得
    PurchaseBaseView view = PurchaseActivityView();
    // 充值所得
    view = PurchaseChargeView();
    // 购买天数
    // 465
    view = PurchaseDecorateView();


    OrientationSheet.show(
      constraints: BoxConstraints(maxHeight: 280 + header.viewHeight()),
      barrierColor: const Color(0x80000000),
      child: PurchaseDecorateSheet(
        header: header,
        view: view,
      ),
      direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
    );
  }

  ///
  /// 购买进场背景
  ///
  static void buyBackground() {

  }

  ///
  /// 购买头像框
  ///
  static void buyDecorate() {

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