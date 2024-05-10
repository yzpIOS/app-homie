import 'package:app/common/theme.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/repaint_boundary_utils.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class InviteNewMembersShareQrcodeImageDialog extends StatelessWidget {
  //二维码
  final String qrcode;

  const InviteNewMembersShareQrcodeImageDialog._({
    required this.qrcode,
  });

  static Future<void> show() async {
    await Get.dialog(
      const InviteNewMembersShareQrcodeImageDialog._(qrcode: ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = RepaintBoundary(
      key: boundaryKey,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(child: Image.asset(IMG.format('my/invite_new_members_share_bgimage'), scale: 3),),
          Positioned(top: 15, left: 10, child: Image.asset(IMG.format('my/icon_home60'), width: 60, height: 60, scale: 3,),),
          Positioned(top: 23, left: 80, child: XText(appInfo.appName, style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Regular),),),
          const Positioned(top: 48, left: 80, child: XText('另一个世界，另一个你', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Regular),),),
          Positioned(right: 10, top: 15, child: OpacityButton(onTap: () => Get.back(), child: Image.asset(IMG.format('my/ic_white_close'), width: 24, height: 24, scale: 3,)),),
          Positioned(bottom: 6, left: 10, right: 10, child: $BottomItemsView()),
        ],
      ),
    );

    child = Column(
      children: [
        child,
        Spacing.h20,

        GestureDetector(
          onTap: () {
            RepaintBoundaryUtils().savePhoto(back: true);
          },
          child: Container(
            width: 117,
            height: 38,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFF7A665),
                      Color(0xFFFFC893),
                    ]
                ),
                borderRadius: AppBorderRadius.max,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFFC394),
                    offset: Offset(0.0, 3.0),
                    spreadRadius: 0,
                    blurRadius: 5,
                  )
                ]
            ),
            child: Text(
              "保存图片",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );

    child = Box(
      width: 375,
      child: child,
    );

    child = FittedBox(fit: BoxFit.fitWidth, child: child);

    return Material(
      type: MaterialType.transparency,
      textStyle: const TextStyle(fontSize: 12, color: AppPalette.c9, fontWeight: fw$Medium),
      child: child,
    );
  }

  Widget $BottomItemsView() {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text: '我是${Get.find<MyInfoCtrl>().dataRx().nickName}',
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: fw$Regular
                            )
                        ),
                        TextSpan(
                            text: '(ID:${Get.find<MyInfoCtrl>().dataRx().account})',
                            style: const TextStyle(
                                fontSize: 14,
                                color: AppPalette.primary,
                                fontWeight: fw$Regular
                            )
                        ),
                        TextSpan(
                            text: '我是，邀请你一起畅游Homie语音，感受次时代社交~',
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: fw$Regular
                            )
                        )
                      ]
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),

        Spacing.w10,
        Image.asset(IMG.format("my/invite_qrcode"), width: 68, height: 68,),
      ],
    );
  }
}
