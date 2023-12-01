import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/im/chat_ctrl.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/message/chat/chat_page.dart';
import 'package:app/ui/moment/common/giftwall_view.dart';
import 'package:app/ui/moment/my/user_moment_view.dart';
import 'package:app/ui/moment/report/moment_report_page.dart';
import 'package:app/ui/my/common/uid_view.dart';
import 'package:app/ui/my/personal_page.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/image/image_gallery.dart';
import 'package:flutter/material.dart';

import 'common/other_details_info_view.dart';

/// 个人主页
class UserHomePage extends StatefulWidget {
  final UID uid;

  const UserHomePage({super.key, required this.uid});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> with BusStateMixin {
  double _expHeight = 404 - 153;

  late final collapsedRx = RxBool(false);
  late final uid = widget.uid;
  late final isSelf = OAuthCtrl.isSelf(uid);
  final refresh = RxBool(false);

  final moreRx = RxMap();

  bool firstRefresh = true;

  @override
  void initState() {
    super.initState();

    if (!isSelf) {
      Get.find<UserInfoCtrl>().loadByNet(uid);
      Api.UserInfo.access(uid);
    }
    updateUserInfo();

    // 请求数据刷新界面
    on<UserInfoRefreshEvent>(
      (_) => updateUserInfo(),
    );

    // Api.UserInfo.home(uid).onType<Map>(moreRx);
  }

  void updateUserInfo() {
    double bgHeight = AppSize.width / 375 * 221.5;

    Api.UserInfo.home(uid).then((value) {
      var curMap = value as Map;
      if(curMap.containsKey("gift_wall_items") == true && (curMap["gift_wall_items"] as List).length > 0) {
        _expHeight = bgHeight + 112 + (153 * (AppSize.width / 375));//434;
      } else {
        _expHeight = bgHeight + 112;//404 - 153;
      }
      moreRx.value = value as Map;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: XNestedScrollView(
        pinnedHeaderSliverHeightBuilder: () => AppSize.appBar + AppSize.safeTop,
        headerSliverBuilder: (_, __) => [$AppBar()],
        body: UserMomentView(uid: uid, callBack: () {
          if(firstRefresh) {
            firstRefresh = false;
            return;
          }
          updateUserInfo();
        }),
      ),
    );
  }

  Widget $AppBar() {
    final height = AppSize.appBar + AppSize.safeTop;

    return Obx(() {
      // 只为了刷新
      refresh.value;
      return SliverAppBar(
        backgroundColor: Colors.white,
        toolbarHeight: AppSize.appBar,
        expandedHeight: _expHeight,
        pinned: true,
        actions: (moreRx != null && moreRx['is_pull_black'] == false) ? _actions() : null,
        leading: Obx(() =>
            BackButton(color: collapsedRx() ? Colors.black : Colors.white)),
        flexibleSpace: LayoutBuilder(
          builder: (_, c) {
            final collapsed = c.maxHeight <= height;

            post(() => collapsedRx(collapsed));

            return FlexibleSpaceBar(
              background: _InfoView(uid: uid, moreRx: moreRx),
            );
          },
        ),
      );
    });
  }

  List<Widget>? _actions() {
    if (isSelf) {
      return null;
      // return [
      //   GestureDetector(
      //     onTap: () {
      //       Get.to(() => const PersonalPage());
      //     },
      //     child: Image.asset(IMG.format("mine_edit"), width: 50, height: 24,),
      //   ),
      //   const SizedBox(width: 14,),
      // ];
    }

    return [
      Obx(
        () {
          final b = moreRx['is_follow'] == true;

          return 'my/${b ? '用户已关注' : '用户未关注'}'.toSvgAction(
            onPressed: () {
              simpleSub(
                Api.UserInfo.follow(uid: uid, doFollow: !b),
                callback: () {
                  moreRx['is_follow'] = !b;
                },
              );
            },
          );
        },
      ),
      'my/用户聊天'.toSvgAction(
        onPressed: () {
          ChatPage.to(SingleChatCtrl.fromUid(uid));
        },
      ),
      'my/dontai_icon_siliao'.toSvgAction(
        onPressed: () {
          Get.showSheet(['举报', '拉黑']).onNotNull((val) {
            switch (val) {
              case '举报':
                Get.to(() => MomentReportPage(type: 2, id: uid));
                break;
              case '拉黑':
                Get.alertSub(
                  () => Api.UserInfo.blackListPull(uid),
                  alert: '是否拉黑？',
                  callback: () {
                    showToast('拉黑成功');
                    // 删除im信息
                    ConvManagerCtrl.ins?.deleteAllBlackConservation(uid);
                    // 返回事件
                    Get.back();
                    // 通知外面刷新
                    UserBlackEvent(userId: uid).fire();
                  },
                );
                break;
            }
          });
        },
      ),
      Spacing.w8,
    ];
  }
}

class _InfoView extends StatelessWidget {
  final UID uid;
  final RxMap moreRx;

  const _InfoView({required this.uid, required this.moreRx});

  static double bgHeight = AppSize.width / 375 * 221.5;

  @override
  Widget build(BuildContext context) {
    final _top = AppSize.safeTop + AppSize.appBar;

    return Stack(
      children: [
        // $BgView(),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: bgHeight,
          child: $BgView(),
        ),
        Positioned(
          top: bgHeight - 54,
          left: 15,
          right: 10,
          child: $UserView(),
        ),
        Positioned(
          top: bgHeight + 50,
          left: 0,
          right: 0,
          child: $InfoView(),
        ),
      ],
    );
  }

  Widget $UserView() {
    /// 跳转直播间
    void toRoom() {
      final liveState = moreRx['liveState'];
      if (liveState.containsKey("room_id") && liveState['room_id'] != null) {
        Get.find<RoomManagerCtrl>().toRoom(roomId: liveState['room_id']);
      }
    }

    Widget builder(UserInfoDto? data) {
      final avatar = data?.avatar;

      final onTap = avatar == null
          ? null
          : () {
              ImageGallery.show(
                data: ImageGalleryItem(
                  image: const ImageToWebp().toProvider(Left(avatar)),
                  thumb: const ImageToThumb().toProvider(Left(avatar)),
                ),
              );
            };

      Widget myNickView() {
        Widget childView = XText(
          data?.showName() ?? '',
          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: fw$Bold),
        );

        final gender = data?.gender;
        final isSelf = OAuthCtrl.isSelf(uid);

        childView = Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Flexible(child: childView),
            childView,
            if (gender != null)
             ...[
               Spacing.w4,
               Image.asset(IMG.format('my/性别_${gender.code}'), width: 20, height: 20, scale: 3,),
             ],
            if (data != null && isSelf)
              ...[
                Spacing.w4,
                GestureDetector(
                  onTap: () => Get.to(() => const PersonalPage()),
                  child: Image.asset(IMG.format("my/info_edit"), width: 21, height: 21, scale: 3,),
                ),
              ],
            const Expanded(child: SizedBox()),
            Obx(() {
              if (moreRx.containsKey("liveState") && (moreRx["liveState"] as Map).isNotEmpty) {
                final liveState = moreRx['liveState'];
                if (liveState.containsKey("status") && liveState['status'] == 1) {
                  return InkWell(
                    onTap: toRoom,
                    child: Image.asset(IMG.format('my/进入直播间'), width: 95, height: 26.8, scale: 3,),
                  );
                }
              }
              return Spacing.blank;
            }),
          ],
        );

        return SizedBox(
          height: 26.8,
          child: childView,
        );
      }

      String? descStr = data?.desc;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OpacityButton(
            onTap: onTap,
            child: AvatarView(
              avatar,
              blur: data?.avatarEx,
              size: 75,
              side: const BorderSide(width: 2, color: Colors.white, strokeAlign: BorderSide.strokeAlignCenter),
            ),
          ),
          Spacing.w6,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacing(height: 3, flex: null,),
                myNickView(),
                // NickView(nickName: data?.showName(), gender: data?.gender),
                const Spacing(height: 10, flex: null,),
                UidView(uid: uid, account: data?.account, level: data?.level),
                const Spacing(height: 6, flex: null,),
                if (descStr != null && descStr.isNotEmpty)
                  XText(
                    descStr,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 11, color: AppPalette.color71, fontWeight: fw$Regular),
                  ),
                const Spacing(height: 6, flex: null,),
                OtherDetailsInfoView(uid: uid, level: data?.level, ageShow: data?.ageShow, starSign: data?.starSign, location: data?.location,),
              ],
            ),
          ),
        ],
      );
    }

    Widget child = UserInfoCtrl.use(uid, builder: builder, refresh: true);

    child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: Colors.white),
      child: child,
    );

    return child;
  }

  Widget $InfoView() {
    // const _decor = ShapeDecoration(
    //   color: Colors.white,
    //   shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
    // );

    // Widget child = Box(
    //   padding: const Pad(top: 2, horizontal: 10),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       Obx(
    //         () => XText(
    //           moreRx['description'] ?? '',
    //           style: const TextStyle(fontSize: 14, color: Colors.black),
    //         ),
    //       ),
    //       // $TagView(),
    //     ],
    //   ),
    // );

    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacing(height: 15, flex: null,),
        $NumView(),
        const Spacing(height: 2, flex: null,),
        Obx(() {
          bool hasGiftWall = moreRx.containsKey("gift_wall_items") && (moreRx["gift_wall_items"] as List<dynamic>).isNotEmpty;
          return Column(
            children: [
              // 礼物墙
              if(hasGiftWall)
                GiftWallView(datas: moreRx["gift_wall_items"], uid: uid,),
                // SizedBox(
                //   // height: 153,
                //   child: GiftWallView(datas: moreRx["gift_wall_items"], uid: uid,),
                // ),
              if(hasGiftWall)
                Container(color: Colors.white, height: 10,),
              if(hasGiftWall)
                Container(color: const Color(0xFFEBEBFF), height: 5,),
            ],
          );
        }),
        const Padding(
          padding: Pad(left: 13, top: 10),
          child: XText('动态', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$SemiBold),),
        ),

        // Expanded(child: child),
      ],
    );

    // child = DecoratedBox(decoration: _decor, child: child);

    return child;
  }

  Widget $NumView() {
    Widget itemBuilder(MapEntry<String, String> item) {
      if (item.value == '分割线') {
        return const Box(width: 1, height: 10, color: AppPalette.color71);
      }
      return Expanded(
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
      );
    }

    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: Colors.black),
      child:Obx(
            () {
          final data = {
            '关注': $NumFormat(moreRx['follow_count']),
            '分割1': '分割线',
            '粉丝': $NumFormat(moreRx['fans_count']),
            '分割2': '分割线',
            '动态': $NumFormat(moreRx['dynamic_count']),
          };

          return Row(
            children: data.entries.map(itemBuilder).toList(growable: false),
          );
        },
      ),
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
  }

  // Widget $TagView() {
  //   Widget itemBuilder({required Widget child}) {
  //     return Container(
  //       width: 34,
  //       height: 16,
  //       decoration: const ShapeDecoration(color: Color(0xFFF5F5F5), shape: AppShape.a2),
  //       alignment: Alignment.center,
  //       child: child,
  //     );
  //   }
  //
  //   final genderView = UserInfoCtrl.use(
  //     uid,
  //     builder: (it) {
  //       return it == null
  //           ? Spacing.blank
  //           : Row(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 SvgView(SVG.$('common/性别_${it.gender.code}'), width: 14, height: 14),
  //                 XText(it.gender.label),
  //               ],
  //             );
  //     },
  //   );
  //
  //   return DefaultTextStyle.merge(
  //     style: const TextStyle(fontSize: 10, color: AppPalette.c9),
  //     child: Row(
  //       children: [
  //         itemBuilder(child: genderView),
  //       ],
  //     ),
  //   );
  // }
}
