import 'package:app/net/api.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
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
      appBar: xAppBar(actions: _actions()),
      body: child,
    );
  }

  Widget $SquareView() {
    return Box(
      padding: const Pad(horizontal: 10),
      child: OpacityButton(
        onTap: () => Get.find<RoomManagerCtrl>().toSquare(),
        child: AspectRatio(
          aspectRatio: 355 / 177,
          child: Image.asset(IMG.format('广场'), fit: BoxFit.cover, scale: 2),
        ),
      ),
    );
  }

  _actions() {
    return [
      'ic_create'.toSvgAction(
        color: null,
        onPressed: () async {
          if(Env.isDebug) {
            MicUserOnlineManagerSheet.show(uid: "a");
            return;
          }
          Get.to(() => const CreateRoomPage());
        },
      ),
      'ic_search'.toSvgAction(
        onPressed: () {
          Get.to(() => const HomeSearchPage());
        },
      ),
    ];
  }
}
