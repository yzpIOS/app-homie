import 'dart:typed_data';

import 'package:app/3rd/tencent/qq.dart';
import 'package:app/3rd/tencent/wx.dart';
import 'package:app/common/theme.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/invite_new_members/invite_new_members_share_qrcodeimage_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tencent_kit/tencent_kit.dart';
import 'package:wechat_kit/wechat_kit.dart';
import 'package:image/image.dart' as image;

class CommonShareSheet extends StatelessWidget {
  const CommonShareSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacing.h20,
        const XText('分享到', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$SemiBold),),
        _$Actions(),
      ],
    );
  }

  Widget _$Actions() {
    final items = [
      '微信好友',
      '朋友圈',
      '生成二维码',
      '复制链接',
    ];

    Widget itemBuilder(String item) {
      Widget child = Column(
        children: [
          const Spacing(flex: 10),
          Image.asset(IMG.format('my/$item'), width: 50, height: 50, scale: 3,),
          const Spacing(flex: 10),
          XText(item, style: const TextStyle(fontSize: 14, color: Colors.black),),
        ],
      );

      child = InkWell(
        child: child,
        onTap: () => onItemClick(item),
      );

      return child;
    }

    return GridView(
      padding: const Pad(horizontal: 10, vertical: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
        mainAxisExtent: 87,
      ),
      children: items.map(itemBuilder).toList(growable: false),
    );
  }

  Future<void> onItemClick(String action) async {
    Get.back();

    switch (action) {
      case '微信好友':
      case '朋友圈':

        UserInfoDto? userDt0 = await UserInfoCtrl.ins.findByUidOrNull(OAuthCtrl.uid, useNet: true);
        if(userDt0 == null) {
          return;
        }

        final ByteData assetIcon = await rootBundle.load('assets/img/my/icon_home60.webp');
        final Uint8List iconBytes = assetIcon.buffer.asUint8List();

        Wx.doShare(WxShareModel(
          shareType: 1,
          scene: (action == '微信好友') ? WechatScene.kSession : WechatScene.kTimeline,
          webpageUrl: 'https://app.web.homieyy.com?inviteId=${userDt0.account}',
          title: '我是${Get.find<MyInfoCtrl>().dataRx().nickName}，邀请你一起畅游Homie语音，感受次时代社交~',
          thumbData: iconBytes,
        ));
        break;
      case 'QQ好友':
      case 'QQ空间':
        Qq.doShare(QqShareModel(
          shareType: 1,
          scene:  (action == 'QQ好友') ? TencentScene.kScene_QQ : TencentScene.kScene_QZone,
          webpageUrl: 'http://www.sina.com',
          title: '我是${Get.find<MyInfoCtrl>().dataRx().nickName}，邀请你一起畅游Homie语音，感受次时代社交~',)
        );
        break;
      case '生成二维码':
        InviteNewMembersShareQrcodeImageDialog.show();
        break;
      case '复制链接':
        UserInfoDto? userDt0 = await UserInfoCtrl.ins.findByUidOrNull(OAuthCtrl.uid, useNet: true);
        if(userDt0 == null) {
          return;
        }
        copyTxt('https://app.web.homieyy.com?inviteId=${userDt0.account}');
        break;
    }
  }
}
