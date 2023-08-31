import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/invite_new_members/invite_new_members_share_qrcodeimage_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class CommonShareSheet extends StatelessWidget {
  const CommonShareSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacing.h20,
        const XText('分享到', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$SemiBold),),
        _Action2(),
      ],
    );
  }

  Widget _Action2() {
    final items = [
      '微信好友',
      '朋友圈',
      'QQ好友',
      'QQ空间',
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

  void onItemClick(String action) {
    Get.back();

    switch (action) {
      case '微信好友':

        break;
      case '朋友圈':

        break;
      case 'QQ好友':

        break;
      case 'QQ空间':

        break;
      case '生成二维码':
        InviteNewMembersShareQrcodeImageDialog.show();
        break;
      case '复制链接':
        copyTxt('http://');
        break;
    }
  }
}
