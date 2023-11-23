import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/home/home_activity_banner_view.dart';
import 'package:app/ui/home/home_banner_view.dart';
import 'package:app/ui/home/home_play_together.dart';
import 'package:app/ui/home/home_search_page.dart';
import 'package:app/ui/podcast/city_room_view.dart';
import 'package:app/ui/podcast/create_room_page.dart';
import 'package:app/ui/podcast/follow_room_view.dart';
import 'package:app/ui/podcast/hot_room_view.dart';
import 'package:app/ui/room/user/mic_user_charm_manager_sheet.dart';
import 'package:app/ui/room/user/mic_user_online_manager_sheet.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/webview/webview_page.dart';
import 'package:flutter/material.dart';

class HotPodcastPage extends StatefulWidget {
  const HotPodcastPage({super.key});

  @override
  State<HotPodcastPage> createState() => _HotPodcastPageState();
}

class _HotPodcastPageState extends State<HotPodcastPage> {
  final data = const {
    '关注': FollowRoomView(),
    '热播': HotRoomView(),
    '同城': CityRoomView(),
  };

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        $SquareView(),
        Box(
          padding: const Pad(top: 10),
          alignment: Alignment.centerLeft,
          child: TabBar(
            tabAlignment: TabAlignment.start,
            labelPadding: const Pad(horizontal: 15),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: data.keys.map((it) => Tab(text: it, height: 28)).toList(growable: false),
          ),
        ),
        Expanded(
          child: TabBarView(
            children: data.values
                .map((it) => (_) => it)
                .map((it) => DelayView(keepAlive: true, builder: it))
                .toList(growable: false),
          ),
        ),
      ],
    );

    child = DefaultTabController(
      initialIndex: 1,
      length: data.length,
      child: child,
    );

    return UiOverlayRegion.dark(
      child: Stack(
        children: [
          _createLinearGradient(),

          Positioned.fill(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _createBar(),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),


          _createRandomRoomEntry(),
        ],
      ),
    );
  }

  Widget _createBar() {
    return Container(
      height: AppSize.appBar + AppSize.safeTop,
      padding: EdgeInsets.only(top: AppSize.safeTop, right: 10),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const CreateRoomPage());
            },
            child: Image.asset(
              IMG.format("ic_create"),
              width: 28,
              height: 28,
            ),
          ),
          const SizedBox(width: 11,),
          GestureDetector(
            onTap: () {
              if(Env.isDebug) {
                Get.to(() => WebViewPage(title: "test", url: "http://192.168.1.126:3002/public/html/deeplink.html",));
                return;
              }
              Get.to(() => const HomeSearchPage());
            },
            child: Image.asset(
              IMG.format("ic_search"),
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createLinearGradient() {
    return Positioned.fill(
      top: 0,
      left: 0,
      right: 0,
      bottom: AppSize.height - 133,
      child: Container(
        height: 133,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE8E4FF),
              AppPalette.background,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
      ),
    );
  }

  Widget $SquareView() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeActivityBannerView(),// 活动banner
        SizedBox(height: 10,),// 距离
        HomePlayTogether(),// 一起玩模块
      ],
    );
  }

  ///
  /// 随机房间
  /// https://www.openinstall.io/doc/asa.html
  ///
  Widget _createRandomRoomEntry() {
    return Positioned.fill(
      right: 10,
      bottom: 50,
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            // todo 随机进房
            RoomManagerCtrl.ins.toRandomRoom();
          },
          child: Image.asset(IMG.format("random_room_entry"), width: 96, height: 42,),
        ),
      ),
    );
  }
}
