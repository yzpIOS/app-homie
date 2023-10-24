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
import 'package:app/ui/my/common/nick_view.dart';
import 'package:app/ui/my/common/uid_view.dart';
import 'package:app/ui/my/personal_page.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/image/image_gallery.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  final UID uid;

  const UserHomePage({super.key, required this.uid});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
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

    // Api.UserInfo.home(uid).onType<Map>(moreRx);
  }

  void updateUserInfo() {
    Api.UserInfo.home(uid).then((value) {
      var curMap = value as Map;
      if(curMap.containsKey("gift_wall_items") == true && (curMap["gift_wall_items"] as List).length > 0) {
        _expHeight = 434;
      } else {
        _expHeight = 404 - 153;
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
      return [
        GestureDetector(
          onTap: () {
            Get.to(() => const PersonalPage());
          },
          child: Image.asset(IMG.format("mine_edit"), width: 50, height: 24,),
        ),
        const SizedBox(width: 14,),
      ];
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

  @override
  Widget build(BuildContext context) {
    final _top = AppSize.safeTop + AppSize.appBar;

    return Stack(
      children: [
        $BgView(),
        Positioned(
          top: _top + 28,
          left: 10,
          right: 10,
          child: $UserView(),
        ),
        Positioned(
          top: _top + 113,
          left: 0,
          right: 0,
          bottom: 0,
          child: $InfoView(),
        ),
      ],
    );
  }

  Widget $UserView() {
    /// 跳转直播间
    void toRoom() {
      Get.find<RoomManagerCtrl>().toRoom(roomId: 82);
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

      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          OpacityButton(
            onTap: onTap,
            child: AvatarView(
              avatar,
              blur: data?.avatarEx,
              size: 70,
              side: const BorderSide(color: Colors.white, width: 1),
            ),
          ),
          Spacing.w10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NickView(nickName: data?.showName(), gender: data?.gender),
                SizedBox(
                  height: 24,
                  child: UidView(uid: uid, account: data?.account, level: data?.level),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: toRoom,
            child: Image.asset(IMG.format('my/进入直播间'), width: 95, height: 26.8, scale: 3, fit: BoxFit.contain),
          )
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
    const _decor = ShapeDecoration(
      color: Colors.white,
      shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
    );

    Widget child = Box(
      padding: const Pad(top: 2, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(
            () => XText(
              moreRx['description'] ?? '',
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          // $TagView(),
        ],
      ),
    );

    child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        $NumView(),
        SizedBox(height: 16,),
        Obx(() {
          bool hasGiftWall = moreRx.containsKey("gift_wall_items") && (moreRx["gift_wall_items"] as List<dynamic>).isNotEmpty;
          return Column(
            children: [
              // 礼物墙
              if(hasGiftWall)
                SizedBox(
                  height: 153,
                  child: GiftWallView(datas: moreRx["gift_wall_items"], uid: uid,),
                ),
              if(hasGiftWall)
                Container(color: Colors.white, height: 10,),
              if(hasGiftWall)
                Container(color: const Color(0xFFF5F5F5), height: 10,),
            ],
          );
        }),

        Expanded(child: child),
      ],
    );

    child = DecoratedBox(decoration: _decor, child: child);

    return child;
  }

  Widget $NumView() {
    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: Colors.black),
      child: SizedBox(
        height: 54,
        child: Obx(
          () {
            final data = {
              '关注': $NumFormat(moreRx['follow_count']),
              '粉丝': $NumFormat(moreRx['fans_count']),
              '动态': $NumFormat(moreRx['dynamic_count']),
            };

            return Row(
              children: data.entries.map((it) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      XText(
                        it.value,
                        style: const TextStyle(fontSize: 16, fontWeight: fw$SemiBold),
                      ),
                      XText(it.key),
                    ],
                  ),
                );
              }).toList(growable: false),
            );
          },
        ),
      ),
    );
  }

  Widget $BgView() {
    return Container(
      height: AppSize.safeTop + 232,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFD89BFE), Color(0xFFE6BFFF), Color(0xFFD898FF)],
        ),
      ),
    );
  }

  Widget $TagView() {
    Widget itemBuilder({required Widget child}) {
      return Container(
        width: 34,
        height: 16,
        decoration: const ShapeDecoration(color: Color(0xFFF5F5F5), shape: AppShape.a2),
        alignment: Alignment.center,
        child: child,
      );
    }

    final genderView = UserInfoCtrl.use(
      uid,
      builder: (it) {
        return it == null
            ? Spacing.blank
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgView(SVG.$('common/性别_${it.gender.code}'), width: 14, height: 14),
                  XText(it.gender.label),
                ],
              );
      },
    );

    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 10, color: AppPalette.c9),
      child: Row(
        children: [
          itemBuilder(child: genderView),
        ],
      ),
    );
  }
}
