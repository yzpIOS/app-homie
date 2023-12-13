import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 我的称号
class MyTitlePage extends StatefulWidget {
  const MyTitlePage({super.key});

  @override
  State<MyTitlePage> createState() => _MyTitlePageState();
}

class _MyTitlePageState extends State<MyTitlePage> {
  final data = {
    '财富称号': TitleGridDataView(listType: 1,),
    '魅力称号': TitleGridDataView(listType: 2,),
    '活动称号': TitleGridDataView(listType: 3,),
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
          child: Image.asset(
            IMG.format('my/无上仙帝'), width: 216, fit: BoxFit.cover,),
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
            style: TextStyle(
                fontSize: 19, color: AppPalette.txtDark, fontWeight: fw$Medium),
          ),
          const XText(
            ' (未获得)',
            style: TextStyle(
                fontSize: 12, color: Color(0xFF00FF11), fontWeight: fw$Regular),
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
            style: TextStyle(fontSize: 14,
                color: AppPalette.txtDark,
                fontWeight: fw$Regular),
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
        unselectedLabelStyle: const TextStyle(
            fontSize: 14, fontWeight: fw$Regular),
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
              const Padding(padding: Pad(top: 3),
                  child: Box(width: 1, height: 8.5, color: AppPalette.color71)),
          ],
        ),
      );
    }

    return tabBarItems;
  }

  Widget $ActionBtn(String text, List<Color> colors,) {
    Widget child = Text(
      text,
      style: const TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: fw$Regular),
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

class TitleGridDataView extends StatelessWidget {
  final int listType;

  TitleGridDataView({super.key, required this.listType});

  late final _selectedData = RxMap();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _createTitle("已获得: ", 18, true),
        _createGridView([
          {'name': '1'},
          {'name': '2'},
          {'name': '3'},
          {'name': '4'},
          {'name': '5'},
        ], true),
        _createTitle("未获得: ", 20, false),
        _createGridView([
          {'name': '1'},
          {'name': '2'},
          {'name': '3'},
          {'name': '4'},
          {'name': '5'},
          {'name': '6'},
          {'name': '7'},
        ], false),
        SizedBox(height: AppSize.safeBottom + 8.5,).toSliver(),
      ],
    );
  }

  Widget _createTitle(String text, int count, bool isReceived) {
    return Container(
      height: 38,
      padding: const Pad(top: 12),
      child: XRichText(
        TextSpan(
          children: [
            TextSpan(text: text),
            TextSpan(
              text: count.toString(),
              style: TextStyle(
                  color: isReceived ? AppPalette.primary : AppPalette.colorB5),
            ),
          ],
          style: const TextStyle(
              fontSize: 11, color: AppPalette.txtDark, fontWeight: fw$Medium),
        ),
      ),
    ).toSliver(padding: const Pad(horizontal: 9),);
  }

  Widget _createGridView(List data, bool isReceived) {
    Widget sliverGrid = SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.5,
        crossAxisSpacing: 7.5,
        childAspectRatio: (113.0 / 105.0),
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: data.length,
            (_, i) => _createGiftItem(data[i], isReceived),
      ),
    );

    return SliverPadding(padding: const Pad(horizontal: 9), sliver: sliverGrid,);
  }

  Widget _createGiftItem(Map data, bool isReceived) {
    // 点亮图标
    Widget giftImage; //NetImage(data["cover"], fit: BoxFit.cover),
    bool isLighten = false;
    if (isReceived) {
      giftImage = Image.asset(IMG.format('my/无上仙帝'), fit: BoxFit.cover,);
      isLighten = true;
    } else {
      const ColorFilter sepia = ColorFilter.matrix(<double>[
        0.2126, 0.7152, 0.0722, 0, 0,
        0.2126, 0.7152, 0.0722, 0, 0,
        0.2126, 0.7152, 0.0722, 0, 0,
        0, 0, 0, 1, 0,
      ]);

      giftImage = ColorFiltered(
        colorFilter: sepia,
        child: Image.asset(IMG.format('my/无上仙帝'), fit: BoxFit.cover,),
      );
    }

    Widget child = Obx(() {
      bool isSelected = _selectedData == data;

      return DecoratedBox(
        decoration: ShapeDecoration(
          color: isReceived ? AppPalette.colorEB : const Color(0xFFD0D0D0),
          shape: XRectangleBorder(
            borderRadius: AppBorderRadius.a10,
            side: isSelected ? const BorderSide(width: 1.5, color: AppPalette.primary) : BorderSide.none,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const Pad(top: 13, horizontal: 8, bottom: 15, ),
              child: giftImage,
            ),
            const XText(
              '富可敌国',
              style: TextStyle(fontSize: 12, color: AppPalette.txtDark, fontWeight: fw$Regular),
            ),
          ],
        ),
      );
    });

    return GestureDetector(
      child: child,
      onTap: () {
        _selectedData.value = data;
      },
    );
  }
}

