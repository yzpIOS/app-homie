import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
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
      children: [
        $SquareView(),
        Box(
          padding: const Pad(top: 10),
          alignment: Alignment.centerLeft,
          child: TabBar(
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

    return Scaffold(
      body: Stack(
        children: [
          _createLinearGradient(),

          _createBar(),

          Positioned.fill(
            top: AppSize.appBar + AppSize.safeTop,
            left: 0,
            right: 0,
            bottom: 0,
            child: child,
          ),

          _createRandomRoomEntry(),
        ],
      ),
    );
  }

  Widget _createBar() {
    return Positioned.fill(
      left: AppSize.width - 68,
      right: 0,
      top: AppSize.safeTop,
      bottom: AppSize.height - AppSize.appBar * 2 - AppSize.safeTop,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const CreateRoomPage());
            },
            child: Image.asset(
              IMG.format("ic_create"),
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 10,),
          GestureDetector(
            onTap: () {
              Get.to(() => const HomeSearchPage());
            },
            child: Image.asset(
              IMG.format("ic_search"),
              width: 24,
              height: 24,
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 公约
        const HomeBannerView(),
        
        // 距离
        const SizedBox(height: 10,),
        HomePlayTogether(),
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
      left: AppSize.width - 106,
      bottom: 99 + AppSize.safeTop,
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
