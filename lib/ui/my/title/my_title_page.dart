import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import '../../podcast/city_room_view.dart';
import '../../podcast/follow_room_view.dart';
import '../../podcast/hot_room_view.dart';

/// 我的称号
class MyTitlePage extends StatefulWidget {
  const MyTitlePage({super.key});

  @override
  State<MyTitlePage> createState() => _MyTitlePageState();
}

class _MyTitlePageState extends State<MyTitlePage> {
  final data = const {
    '财富称号': FollowRoomView(),
    '魅力称号': HotRoomView(),
    '活动称号': CityRoomView(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.colorEB,
      extendBodyBehindAppBar: true,
      appBar: xAppBar(
        title: '我的称号',
        bgColor: AppPalette.appBarForegroundColorDark.withAlpha(0),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: data.length,
        child: $Body(),
      ),
    );
  }

  Widget $Body() {
    return Column(
      children: [
        Container(
          margin: Pad(top: AppSize.appBar + AppSize.safeTop + 20, bottom: 58),
          color: const Color(0xFF7816A2),
          width: 168,
          height: 62.5,
        ),
        Expanded(child: $ContentView(),),
      ],
    );
  }

  Widget $ContentView() {
    Widget child = Padding(
      padding: const Pad(top: 9, left: 9, right: 16),
      child: Row(
        children: [
          const XText(
            '富可敌国',
            style: TextStyle(fontSize: 19, color: AppPalette.txtDark, fontWeight: fw$Medium),
          ),
          const XText(
            ' (未获得)',
            style: TextStyle(fontSize: 12, color: Color(0xFF00FF11), fontWeight: fw$Regular),
          ),
          Spacing.exp,
          $ActionBtn(
            '去获得',
            [const Color(0xFFE9447D), const Color(0xFFEB634E)],
          ),
        ],
      ),
    );

    child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        Container(
          padding: const Pad(top: 5, left: 9, right: 87),
          height: 45,
          child: const XText(
            '1.称号说明称号说明称号说明称号说明称号说明称号说明称号说明称号说明称号说明称号说明',
            style: TextStyle(fontSize: 14, color: AppPalette.txtDark, fontWeight: fw$Regular),
            maxLines: 2,
          ),
        ),
        $TabBar(),
        const Divider(height: 1, color: AppPalette.colorEB),
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

    child = Material(
      borderRadius: AppBorderRadius.t10,
      color: Colors.white,
      child: child,
    );

    return child;
  }

  Widget $TabBar() {
    return Box(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        labelPadding: const Pad(horizontal: 9),
        isScrollable: true,
        indicator: const BoxDecoration(),
        labelColor: AppPalette.primary,
        unselectedLabelColor: Colors.black,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: fw$Regular),
        unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: fw$Regular),
        tabs: _buildTabs(),
      ),
    );
  }

  // 带分割线的tabs
  List<Widget> _buildTabs() {
    List<Widget> tabBarItems = [];

    for (int i = 0; i < data.keys.length; i++) {
      tabBarItems.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Tab(text: data.keys.toList()[i], height: 28,),
            const Spacing(width: 18, flex: null,),
            if (i < data.keys.length - 1)
              const Padding(padding: Pad(top: 3), child: Box(width: 1, height: 8.5, color: AppPalette.color71)),
          ],
        ),
      );
    }

    return tabBarItems;
  }

  Widget $ActionBtn(String text, List<Color> colors,) {
    Widget child = Text(
      text,
      style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Regular),
    );

    child = Container(
      width: 71,
      height: 29,
      decoration: ShapeDecoration(
        shape: const XStadiumBorder(),
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      alignment: Alignment.center,
      padding: const Pad(bottom: 3),
      child: child,
    );

    child = OpacityButton(
      child: child,
      onTap: () {

      },
    );

    return child;
  }
}
