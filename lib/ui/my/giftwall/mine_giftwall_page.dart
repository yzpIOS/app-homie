import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/im/chat_ctrl.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
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
import 'package:app/widgets/app_bar2.dart';
import 'package:app/widgets/image/image_gallery.dart';
import 'package:flutter/material.dart';

class MineGiftWallPage extends StatefulWidget {
  final UID uid;

  const MineGiftWallPage({super.key, required this.uid});

  @override
  State<MineGiftWallPage> createState() => _MineGiftWallPageState();
}

class _MineGiftWallPageState extends State<MineGiftWallPage> {
  static const double _expHeight = 250;

  late final collapsedRx = RxBool(false);
  late final uid = widget.uid;
  late final isSelf = OAuthCtrl.isSelf(uid);

  final moreRx = RxMap();

  @override
  void initState() {
    super.initState();
    Api.UserInfo.home(uid).onType<Map>(moreRx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _InfoView(uid: uid, moreRx: moreRx),

              // 礼物墙
              GiftWallView(),

              Container(height: 10, color: const Color(0xFFF5F5F5),),

              Expanded(
                child: UserMomentView(uid: uid),
              ),
            ],
          ),

          // 标题
          AppBar2(actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const PersonalPage());
              },
              child: Image.asset(IMG.format("mine_edit"), width: 50, height: 24,),
            )
          ]),
        ],
      ),
    );
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
        ],
      );
    }

    Widget child = UserInfoCtrl.use(uid, builder: builder);

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
          Obx(() => XText(
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
        height: 64,
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
      height: AppSize.safeTop + 225,
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
