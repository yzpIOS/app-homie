import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/room_card_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScenePage extends StatefulWidget {
  const ScenePage({super.key});

  @override
  State<ScenePage> createState() => _ScenePageState();
}

class _ScenePageState extends State<ScenePage> {
  final keywordRx = RxnString();
  final controller = TextEditingController();
  final data = <String, Widget>{
    '免费': DelayView(
      keepAlive: true,
      builder: (_) => _DataView(onSelect: (Map data) => Get.back(result: data)),
    ),
    '付费': DelayView(
      keepAlive: true,
      builder: (_) => _DataView(onSelect: (Map data) => Get.back(result: data)),
    ),
    '热门': DelayView(
      keepAlive: true,
      builder: (_) => _DataView(onSelect: (Map data) => Get.back(result: data)),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '选择世界'),
      body: DefaultTabController(
        initialIndex: 0,
        length: data.length,
        child: Column(
          children: [
            $SearchView(),
            Box(
              padding: const Pad(left: 3, top: 10),
              alignment: Alignment.centerLeft,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                labelPadding: const Pad(horizontal: 14),
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: data.keys.map((it) => Tab(text: it, height: 28)).toList(growable: false),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: data.values.map((it) => it).toList(growable: false),
              ),
            ),
            // Expanded(child: _DataView(onSelect: onSelect),),
          ],
        ),
      ),
    );
  }

  // void onSelect(Map data) => Get.back(result: data);

  Widget $SearchView() {
    return Padding(
      padding: const Pad(horizontal: 17),
      child: XInputView(
        controller: controller,
        bgColor: AppPalette.colorEB,
        height: 34,
        autofocus: false,
        hintText: '搜索场景',
        textInputAction: TextInputAction.search,
        prefixIcon: OpacityButton(
          onTap: () {},
          child: SvgView(SVG.$('ic_search_2'), color: const Color(0xFF474747), width: 20, height: 20, fit: BoxFit.contain),
        ),
        suffixIcon: $SuffixIcon(),
        onSubmitted: keywordRx,
      ),
    );
  }

  Widget $SuffixIcon() {
    return Obx(() {
      final keyword = keywordRx();

      return keyword == null || keyword.isEmpty
          ? Spacing.blank
          : IntrinsicWidth(
        child: OpacityButton(
          onTap: () => _doSearch(''),
          child: const Center(
            child: Icon(CupertinoIcons.xmark_circle_fill, size: 16),
          ),
        ),
      );
    });
  }

  void _doSearch(String keyword) {
    controller
      ..clear()
      ..join(keyword);

    keywordRx(keyword);
  }
}

class _DataView extends SimplePageView<Map> {
  final ValueChanged<Map> onSelect;

  _DataView({required this.onSelect});

  @override
  BaseConfig get config {
    return const GridConfig(
      padding: Pad(horizontal: 10, top: 10, bottom: 30),
      gridDelegate: XGridDelegate(
        childAspectRatio: RoomCardView.ratio,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 12,
        fixedHeight: 25,
      ),
    );
  }

  @override
  Future fetchPage(PageNum page) => Api.Scene.list(page: page);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return OpacityButton(
      onTap: () => onSelect(item),
      child: _ItemView(data: item),
    );
  }
}

class _ItemView extends StatelessWidget {
  final Map data;

  const _ItemView({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoomCardView(image: data['image']),
        XText(
          data['name'],
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
