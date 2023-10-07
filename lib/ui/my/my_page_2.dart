import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/api/my_info_dto.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/backpack/backpack_page.dart';
import 'package:app/ui/my/common/nick_view.dart';
import 'package:app/ui/my/common/uid_view.dart';
import 'package:app/ui/my/connect_page.dart';
import 'package:app/ui/my/friend/access_agg_page.dart';
import 'package:app/ui/my/friend/friend_page.dart';
import 'package:app/ui/my/invite_new_members/invite_new_members_activity_page.dart';
import 'package:app/ui/my/my_moment_page.dart';
import 'package:app/ui/my/real_identity_page.dart';
import 'package:app/ui/my/setting/setting_page.dart';
import 'package:app/ui/my/user_home_page.dart';
import 'package:app/ui/my/wallet/wallet_page.dart';
import 'package:app/ui/room/room_fav_page.dart';
import 'package:app/ui/task/my_sign_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class MyPage2 extends StatefulWidget {
  const MyPage2({super.key});

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {

  @override
  void initState() {
    super.initState();
    Get.find<MyInfoCtrl>().doRefresh();
  }

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: 10, thickness: 10, color: AppPalette.background2);

    return UiOverlayRegion.light(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => Get.find<MyInfoCtrl>().doRefresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Obx((){
                  Rx<MyInfoDto> dataRx = Get.find<MyInfoCtrl>().dataRx;
                  return _HeaderView(myInfoDto: dataRx.value,);
                }),
                divider,
                _Action1(),
                divider,
                _Action2(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _Action1() {
    final items = [
      '我的钱包',
      '我的装扮',
      '我的背包',
      '我的任务',
    ];

    Widget itemBuilder(String item) {
      Widget child = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacing.blank,
          Image.asset(IMG.format('my/$item'), width: 56, height: 56, fit: BoxFit.contain, scale: 3),
          XText(
            item,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      );

      child = InkWell(
        child: child,
        onTap: () => onItemClick(item),
      );

      return child;
    }

    return GridView(
      padding: Pad.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 118,
      ),
      children: items.map(itemBuilder).toList(growable: false),
    );
  }

  Widget _Action2() {
    final items = [
      '我的动态',
      '足迹与关注',
      '实名认证',
      '联系客服',
      '设置',
    ];

    Widget itemBuilder(String item) {
      Widget child = Column(
        children: [
          const Spacing(flex: 10),
          SvgView(SVG.$('my/$item'), width: 40, height: 40, permanent: true),
          const Spacing(flex: 5),
          XText(
            item,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
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
        crossAxisSpacing: 6,
        mainAxisExtent: 77,
      ),
      children: items.map(itemBuilder).toList(growable: false),
    );
  }

  void onItemClick(String action) {
    switch (action) {
      case '我的钱包':
        Get.to(() => const WalletPage());
        break;
      case '我的装扮':
        Get.find<ClothSelectorCtrl>().needGoToMyWardrobe = true;
        const GoDressUpEvent().fire();
        break;
      case '我的背包':
        Get.to(() => const BackpackPage());
        // Get.to(() => const InviteNewMembersActivityPage());
        break;
      case '我的任务':
        SignDialog.show(isManual: true);
        break;
      case '我的动态':
        Get.to(() => const MyMomentPage());
        break;
      case '实名认证':
        Get.to(() => const RealIdentityPage());
        break;
      case '联系客服':
        Get.to(() => const ConnectPage());
        break;
      case '设置':
        Get.to(() => const SettingPage());
        break;
      case '足迹与关注':
        Get.to(() => const RoomFavPage());
        break;
    }
  }
}

class _HeaderView extends StatelessWidget {
  MyInfoDto? myInfoDto;
  _HeaderView({required this.myInfoDto});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.safeTop + 236,
      child: $Body(),
    );
  }

  Widget $Body() {
    return Stack(
      children: [
        Positioned.fill(child: $BgView()),
        Positioned(
          left: 10,
          right: 10,
          bottom: 80 + 15,
          height: 70,
          child: $UserView(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 80,
          child: $NumView(),
        ),
      ],
    );
  }

  Widget $BgView() {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFD89BFE), Color(0xFFE6BFFF), Color(0xFFD898FF)],
        ),
      ),
    );
  }

  Widget $UserView() {
    Widget builder(MyInfoDto data) {
      return Row(
        children: [
          OpacityButton(
            onTap: () => Get.to(() => UserHomePage(uid: data.uid ?? "")),
            child: AvatarView(
              data.avatar,
              blur: data.avatarEx,
              size: 70,
              side: const BorderSide(width: 1, color: Colors.white, strokeAlign: BorderSide.strokeAlignCenter),
            ),
          ),
          Spacing.w10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NickView(nickName: data.nickName, gender: data.gender),
                SizedBox(
                  height: 24,
                  child: UidView(uid: data.uid, account: data.account, level: data.level),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget child = MyInfoCtrl.use(builder: builder);

    child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: Colors.white),
      child: child,
    );

    return child;
  }

  Widget $NumView() {
    Widget itemBuilder(MapEntry<String, String> item) {
      return Expanded(
        child: OpacityButton(
          onTap: () => onItemClick(item.key),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              XText(
                item.value,
                style: const TextStyle(fontSize: 18, fontWeight: fw$SemiBold),
              ),
              XText(
                item.key,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    Widget child = MyInfoCtrl.use(
      builder: (it) {
        final data = {
          '关注': $NumFormat(it.followCount),
          '粉丝': $NumFormat(it.fansCount),
          '访客': $NumFormat(it.accessCount),
        };

        return Row(
          children: data.entries.map(itemBuilder).toList(growable: false),
        );
      },
    );

    child = Material(
      color: Colors.white,
      borderRadius: AppBorderRadius.t12,
      textStyle: const TextStyle(fontSize: 12, color: Colors.black),
      child: child,
    );

    return child;
  }

  void onItemClick(String action) {
    switch (action) {
      case '关注':
        Get.to(() => const MyFriendPage(initIndex: 1));
        break;
      case '粉丝':
        Get.to(() => const MyFriendPage(initIndex: 2));
        break;
      case '访客':
        Get.to(() => const AccessAggPage());
        break;
    }
  }
}
