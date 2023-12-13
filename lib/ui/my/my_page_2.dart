import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/api/my_info_dto.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/backpack/backpack_page.dart';
import 'package:app/ui/my/common/uid_view.dart';
import 'package:app/ui/my/connect_page.dart';
import 'package:app/ui/my/friend/access_agg_page.dart';
import 'package:app/ui/my/friend/friend_page.dart';
import 'package:app/ui/my/my_moment_page.dart';
import 'package:app/ui/my/real_identity_2_page.dart';
import 'package:app/ui/my/real_identity_page.dart';
import 'package:app/ui/my/setting/setting_page.dart';
import 'package:app/ui/my/title/my_title_page.dart';
import 'package:app/ui/my/user_home_page.dart';
import 'package:app/ui/my/wallet/wallet_page.dart';
import 'package:app/ui/room/room_fav_page.dart';
import 'package:app/ui/task/my_sign_view.dart';
import 'package:app/ui/task/task_center_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/my/common/other_details_info_view.dart';
import 'package:app/ui/my/openpersonallive/open_personal_live_page.dart';

class MyPage2 extends StatefulWidget {
  const MyPage2({super.key});

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> with BusStateMixin {

  @override
  void initState() {
    super.initState();
    Get.find<MyInfoCtrl>().doRefresh();

    // 请求数据刷新界面
    on<UserInfoRefreshEvent>(
      (_) => Get.find<MyInfoCtrl>().doRefresh(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: 5, thickness: 5, color: AppPalette.colorEB);

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
      '开直播',
      '我的钱包',
      '我的装扮',
      '我的背包',
      '我的任务',
      '我的称号',
      '首充礼包',
    ];

    Widget itemBuilder(String item) {
      Widget child = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(IMG.format('my/$item'), width: 70, height: 70, fit: BoxFit.contain, scale: 3),
          XText(
            item,
            style: const TextStyle(fontSize: 15, color: Colors.black),
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
      padding: const Pad(vertical: 5,),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 115,
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
      '主播认证',
    ];

    Widget itemBuilder(String item) {
      Widget child = Column(
        children: [
          const Spacing(flex: 10),
          Image.asset(IMG.format('my/$item'), width: 40, height: 40, scale: 3,),
          const Spacing(flex: 10),
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
      padding: const Pad(vertical: 5),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        mainAxisExtent: 70,
      ),
      children: items.map(itemBuilder).toList(growable: false),
    );
  }

  void onItemClick(String action) {
    switch (action) {
      case '开直播':
        Get.to(() => const OpenPersonalLivePage());
        break;
      case '我的钱包':
        Get.to(() => const WalletPage());
        break;
      case '我的装扮':
        Get.find<ClothSelectorCtrl>().needGoToMyWardrobe = true;
        const GoDressUpEvent().fire();
        break;
      case '我的背包':
        Get.to(() => const BackpackPage());
        break;
      case '我的任务':
        // SignDialog.show(isManual: true);
        Get.to(() => const TaskCenterPage());
        break;
      case '我的称号':
        Get.to(() => const MyTitlePage());
        break;
      case '首充礼包':
        
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
      case '主播认证':
        toRealIdentity2Page();
        break;
    }
  }

  void toRealIdentity2Page() async {
    // 已认证
    if (OAuthCtrl.isFaceValidate) {
      showToast('您已认证');
      return;
    }
    // 未认证，去认证
    await Get.to(() => const RealIdentity2Page());
    // 刷新用户数据
    OAuthCtrl.ins.useAuth(OAuthCtrl.token ?? "");
  }
}

class _HeaderView extends StatelessWidget {
  MyInfoDto? myInfoDto;
  _HeaderView({required this.myInfoDto});

  static double bgHeight = AppSize.width / 375 * 221.5;

  @override
  Widget build(BuildContext context) {
    // return $Body();
    return SizedBox(
      height: bgHeight + 85,
      child: $Body(),
    );
  }

  Widget $Body() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: bgHeight,
          child: $BgView(),
        ),
        Positioned(
          left: 15,
          right: 10,
          top: bgHeight - 54,
          child: $UserView(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 35,
          child: $NumView(),
        ),
      ],
    );
  }

  Widget $BgView() {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IMG.format('my/my_bg')),
          scale: 3,
          fit: BoxFit.cover,
        ),
      ),
    );
    //
    // return DecoratedBox(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage(IMG.format('my/my_bg')),
    //       scale: 3,
    //       fit: BoxFit.cover,
    //     ),
    //     // gradient: LinearGradient(
    //     //   begin: Alignment.topCenter,
    //     //   end: Alignment.bottomCenter,
    //     //   colors: [Color(0xFFD89BFE), Color(0xFFE6BFFF), Color(0xFFD898FF)],
    //     // ),
    //   ),
    // );
  }

  Widget $UserView() {
    Widget builder(MyInfoDto data) {
      Widget myNickView() {
        Widget nickView = XText(
          data.nickName ?? '',
          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: fw$Bold),
        );

        final gender = data.gender;

        if (gender != null) {
          nickView = Row(
            children: [
              Flexible(child: nickView),
              Spacing.w4,
              Image.asset(IMG.format('my/性别_${gender.code}'), width: 20, height: 20, scale: 3,),
            ],
          );
        }

        return nickView;
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OpacityButton(
            onTap: () => Get.to(() => UserHomePage(uid: data.uid ?? "")),
            child: AvatarView(
              data.avatar,
              blur: data.avatarEx,
              size: 75,
              side: const BorderSide(width: 2, color: Colors.white, strokeAlign: BorderSide.strokeAlignCenter),
            ),
          ),
          Spacing.w6,
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacing(height: 10, flex: null,),
                myNickView(),
                const Spacing(height: 10, flex: null,),
                UidView(uid: data.uid, account: data.account, level: data.level),
                const Spacing(height: 6, flex: null,),
                if (data.desc != null && data.desc!.isNotEmpty)
                  XText(
                    data.desc!,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 11, color: AppPalette.color71, fontWeight: fw$Regular),
                  ),
                const Spacing(height: 6, flex: null,),
                OtherDetailsInfoView(uid: data.uid, level: data.level, ageShow: data.ageShow, starSign: data.starSign, location: data.location,),
                // SizedBox(
                //   height: 20,
                //   child: UidView(uid: data.uid, account: data.account, level: data.level),
                // ),
              ],
            ),
          ),
        ],
      );
    }

    Widget child = MyInfoCtrl.use(builder: builder);

    // child = DefaultTextStyle.merge(
    //   style: const TextStyle(fontSize: 15, color: Colors.white),
    //   child: child,
    // );

    return child;
  }

  Widget $NumView() {
    Widget itemBuilder(MapEntry<String, String> item) {
      if (item.value == '分割线') {
        return const Box(width: 1, height: 8.5, color: AppPalette.color71);
      }
      return Expanded(
        child: OpacityButton(
          onTap: () => onItemClick(item.key),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              XText(
                item.key,
                style: const TextStyle(fontSize: 11, color: AppPalette.colorA9, fontWeight: fw$SemiBold),
              ),
              Spacing.w8,
              XText(
                item.value,
                style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: fw$Bold),
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
          '分割1': '分割线',
          '粉丝': $NumFormat(it.fansCount),
          '分割2': '分割线',
          '访客': $NumFormat(it.accessCount),
        };

        return Row(
          children: data.entries.map(itemBuilder).toList(growable: false),
        );
      },
    );

    // child = Material(
    //   color: Colors.red,
    //   borderRadius: const XBorderRadius.vertical(top: AppRadius.r20),
    //   textStyle: const TextStyle(fontSize: 12, color: Colors.black),
    //   child: child,
    // );

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
