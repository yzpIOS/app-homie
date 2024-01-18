import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/ui/my/invite_new_members/common_share_sheet.dart';
import 'package:app/ui/my/invite_new_members/invite_new_members_myrewardlist_sheet.dart';
import 'package:app/ui/my/invite_new_members/invite_new_members_rules_sheet.dart';
import 'package:app/ui/my/invite_new_members/invite_prize_animate_view.dart';
import 'package:app/ui/my/invite_new_members/open_redpacket_result_dialog.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 拉新活动主页
class InviteNewMembersActivityPage extends StatefulWidget {
  const InviteNewMembersActivityPage({super.key});

  @override
  State<InviteNewMembersActivityPage> createState() => _InviteNewMembersActivityPageState();
}

class _InviteNewMembersActivityPageState extends State<InviteNewMembersActivityPage> {
  //剩余红包次数
  final remainingRedPacketCountRx = RxInt(0);

  late final api = Api.Wallet.rechargeCombo();

  // 规则数据
  final ruleMap = RxMap();

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    final safePop = context.safePop;

    try {
      final val = await api;

      final items = val['items'];
      final types = val['pay_type_items'];

      // 规则
      final rules = await Api.Activity.queryLotteryRule();
      ruleMap.value = rules;

      // 剩余拆红包次数
      refreshLeftOpenCount();

      // 开始动画
      InvitePrizeAnimateView.startRolling();
    } catch (e, s) {
      errLog(e, s);

      Get.alertDialog('数据错误').whenComplete(safePop);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: xAppBar(bgColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: $BodyView(),
    );
  }

  Widget $BodyView() {
    final startTop = AppSize.safeTop + (AppSize.appBar - 24) / 2.0 + 25;
    Widget child = Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(child: Image.asset(IMG.format('my/hd_pic_bg_lx'), width: AppSize.width, height: AppSize.height, fit: BoxFit.fill),),
        const Positioned(top: 0, left: 0, child: OnlyBackAppBar(),),
        // 活动规则
        Positioned(
          top: startTop,
          right: 0,
          child: Obx(() {
            if(ruleMap.isEmpty) {
              return SizedBox();
            }
            return $RightEntranceButton('活动规则');
          }),
        ),

        Positioned(top: startTop + 33, right: 0, child: $RightEntranceButton('我的奖励'),),
        Positioned(top: startTop + 66, right: 0, child: $RightEntranceButton('我的邀请'),),
        Positioned(
          left: 32,
          right: 32,
          height: 71,
          bottom: AppSize.safeBottom + 26,
          child: GestureDetector(
            onTap: () {
              onItemClick('邀请好友');
            },
            child: Container(
              width: 321,
              height: 71,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(IMG.format('my/open_btn'))
                )
              ),
              alignment: Alignment.center,
              child: Text(
                "邀请好友获得红包",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: AppPalette.txtWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: AppSize.safeBottom + 26 + 60 + 17,
          child: Obx(() {
            return XText(
              '剩余红包次数:${remainingRedPacketCountRx.value}',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFFFF306A),
                fontWeight: FontWeight.w900
              ),
            );
          }),
        ),

        Positioned(
          left: 32,
          right: 32,
          height: 85,
          top: 478 + startTop,
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(IMG.format('my/ic_pic_kuang_bg')),
              ),
              Positioned(
                top: 16,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // https://blog.csdn.net/ZuoYueLiang/article/details/129788014
                    creatRichText("最高可得", 0xFFFFF1DE, 27),
                    SizedBox(width: 6,),

                    Obx(() {
                      if(ruleMap.isEmpty) {
                        return SizedBox();
                      }
                      return creatRichText(ruleMap["activity_value"].toString(), 0xFFf0ff00, 40);
                    }),


                    SizedBox(width: 6,),
                    creatRichText("钻石", 0xFFFFF1DE, 27),
                  ],
                ),
              )
            ],
          ),
        ),

        Positioned(
          left: 32,
          right: 32,
          height: 71,
          bottom: AppSize.safeBottom + 26 + 60 + 34,
          child: Obx(() {
            bool canOpen = remainingRedPacketCountRx.value > 0;

            return GestureDetector(
              onTap: () {
                if(Env.isDebug) {
                  onItemClick('拆红包');
                  return;
                }
                if(!canOpen) {
                  return;
                }
                onItemClick('拆红包');
              },
              child: Container(
                width: 321,
                height: 71,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(IMG.format(canOpen ? 'my/open_btn' : "my/open_disable"))
                  )
                ),
                alignment: Alignment.center,
                child: Text(
                  "拆红包",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: AppPalette.txtWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          })
        ),
      ],
    );

    return child;
  }

  Widget creatRichText(String text, int color, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..style = PaintingStyle.fill
          ..strokeWidth = 5
          ..color = Color(color),
        shadows: [
          Shadow(
              blurRadius: 30,
              color: Color(0xFFffab34),
              offset: Offset(0, 0)
          ),

          Shadow(
              blurRadius: 30,
              color: Color(0xFFffab34),
              offset: Offset(0, 0)
          )
        ]
      ),
    );
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

  Future<void> onItemClick(String action) async {
    switch (action) {
      case '活动规则':
        if(!ruleMap.containsKey("rule_desc") || ruleMap["rule_desc"] == null) {
          return;
        }
        OrientationSheet.show(
          barrierColor: const Color(0x80000000),
          child: InviteNewMembersRulesSheet(ruleContent: ruleMap["rule_desc"],),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
          )
        );
        break;
      case '我的奖励':
        OrientationSheet.show(
          barrierColor: const Color(0x80000000),
          child: const InviteNewMembersMyRewardListSheet(listType: 1,),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
          )
        );
        break;
      case '我的邀请':
        OrientationSheet.show(
          barrierColor: const Color(0x80000000),
          child: const InviteNewMembersMyRewardListSheet(listType: 2,),
          direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
          )
        );
        break;
      case '拆红包':
        if(Env.isDebug) {
          await OpenRedPacketResultDialog.show("111", "");
          return;
        }
        var result = await Api.Activity.openEnvelope();
        var giftName = result["name"];
        var giftImageUrl = result["image"];
        if(giftName == null || giftImageUrl == null) {
          return;
        }
        await OpenRedPacketResultDialog.show(giftName, giftImageUrl);
        refreshLeftOpenCount();
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

  ///
  /// 剩余拆红包次数
  ///
  void refreshLeftOpenCount() async {
    final leftOpenTime = await Api.Activity.queryLeftOpenCount();
    if(Env.isDebug) {
      remainingRedPacketCountRx(10);
      return;
    }
    remainingRedPacketCountRx(leftOpenTime["count"]);
  }

  @override
  void dispose() {
    super.dispose();
    InvitePrizeAnimateView.clearAnimate();
  }
}

class OnlyBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnlyBackAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IconButton(
        color:Colors.white,
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Get.back(),
      ),
    );
  }
}
