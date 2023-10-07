import 'package:app/common/theme.dart';
import 'package:app/ui/my/invite_new_members/common_share_sheet.dart';
import 'package:app/ui/my/invite_new_members/invite_new_members_myrewardlist_sheet.dart';
import 'package:app/ui/my/invite_new_members/invite_new_members_rules_sheet.dart';
import 'package:app/ui/my/invite_new_members/open_redpacket_result_dialog.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class InviteNewMembersActivityPage extends StatefulWidget {
  const InviteNewMembersActivityPage({super.key});

  @override
  State<InviteNewMembersActivityPage> createState() => _InviteNewMembersActivityPageState();
}

class _InviteNewMembersActivityPageState extends State<InviteNewMembersActivityPage> {
  //剩余红包次数
  final remainingRedPacketCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //appBar: xAppBar(bgColor: Colors.transparent),
      body: $BodyView(),
    );
  }

  Widget $BodyView() {
    final startTop = AppSize.safeTop + (MediaQuery.of(context).padding.top - 24) / 2.0;
    Widget child = Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(child: Image.asset(IMG.format('my/hd_pic_bg_lx'), scale: 3, fit: BoxFit.contain),),
        const Positioned(top: 0, left: 0, child: OnlyBackAppBar(),),
        Positioned(top: startTop, right: 0, child: $RightEntranceButton('活动规则'),),
        Positioned(top: startTop + 33, right: 0, child: $RightEntranceButton('我的奖励'),),
        Positioned(top: startTop + 66, right: 0, child: $RightEntranceButton('我的邀请'),),
        Positioned(
          left: 32,
          right: 32,
          height: 60,
          bottom: AppSize.safeBottom + 26,
          child: XOutlinedBtn(
            label: '邀请好友获得红包',
            textStyle: const TextStyle(fontSize: 28, fontWeight: fw$Regular),
            color: const Color(0xFFFE4A27),
            side: const BorderSide(color: Color(0xFFFFF3A5), width: 2.0),
            onTap: () => onItemClick('邀请好友'),
          ),
        ),
        Positioned(
          bottom: AppSize.safeBottom + 26 + 60 + 17,
          child: XText('剩余红包次数:$remainingRedPacketCount', style: const TextStyle(fontSize: 12, color: AppPalette.c6, fontWeight: fw$Regular),),
        ),
        Positioned(
          left: 32,
          right: 32,
          height: 60,
          bottom: AppSize.safeBottom + 26 + 60 + 34,
          child: XOutlinedBtn(
            label: '拆红包',
            textStyle: TextStyle(fontSize: 28, color: remainingRedPacketCount > 0 ? Colors.white : AppPalette.c9, fontWeight: fw$Regular),
            color: remainingRedPacketCount > 0 ? const Color(0xFFFE4A27) : AppPalette.cc,
            side:  BorderSide(color: remainingRedPacketCount > 0 ? const Color(0xFFFFF3A5) : AppPalette.cc, width: 2.0),
            onTap: () {if (remainingRedPacketCount > 0) onItemClick('拆红包');},
          )
        ),
      ],
    );

    return child;
  }

  Widget $RightEntranceButton(String text) {
    return InkWell(
      onTap: () => onItemClick(text),
      child: Container(
        alignment: Alignment.center,
        width: 70,
        height: 24,
        decoration: const ShapeDecoration(
          color: Color(0x60000000),
          shape: XRectangleBorder(borderRadius: AppBorderRadius.l6),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: fw$Regular),),
      ),
    );
  }

  void onItemClick(String action) {
    switch (action) {
      case '活动规则':
        OrientationSheet.show(
          barrierColor: const Color(0x80000000),
          child: const InviteNewMembersRulesSheet(),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
        );
        break;
      case '我的奖励':
        OrientationSheet.show(
          barrierColor: const Color(0x80000000),
          child: const InviteNewMembersMyRewardListSheet(listType: 1,),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
        );
        break;
      case '我的邀请':
        OrientationSheet.show(
          barrierColor: const Color(0x80000000),
          child: const InviteNewMembersMyRewardListSheet(listType: 2,),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
        );
        break;
      case '拆红包':
        OpenRedPacketResultDialog.show();
        break;
      case '邀请好友':
        OrientationSheet.show(
          constraints: BoxConstraints(maxHeight: 246 + AppSize.safeBottom),
          barrierColor: const Color(0x80000000),
          child: const CommonShareSheet(),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
        );
        break;
    }
  }
}

class OnlyBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnlyBackAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IconButton(color:Colors.white, icon: const Icon(Icons.arrow_back), onPressed: () {Navigator.of(context).pop();},),
    );
  }
}
