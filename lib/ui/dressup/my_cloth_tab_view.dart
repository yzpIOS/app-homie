import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/shop/widgets/shop_tab_bar.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/intro_ctrl.dart';
import 'package:app/store/my_dressup_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/dressup/my_view.dart';
import 'package:app/ui/dressup/my_view_wardrobe.dart';
import 'package:app/ui/intro/my_cloth_intro_overlay.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class MyClothTabView extends StatefulWidget {
  const MyClothTabView({super.key});

  @override
  State<MyClothTabView> createState() => _MyClothTabViewState();
}

class _MyClothTabViewState extends State<MyClothTabView> with BusStateMixin, OverlayMixin {
  late final tabs = {
    '我的': MyView$Wardrobe(),
  };

  @override
  Widget build(BuildContext context) {
    return GetX<MyDressUpCtrl>(
      builder: (it) {
        final _data = it.myDressList ?? [];
        return _createTabView(_data);
      },
      initState: (value) {
        value.controller?.getMyDressList();
      },
    );
  }

  Widget _createTabView(List<dynamic> _data) {
    return ConfigListState(
      buildNoMoreView: ([_]) => Spacing.blank,
      child: DefaultTabController(
        length: tabs.length + _data.length,
        child: BusView<GoWardrobeEvent>(
          onData: (context, _) => DefaultTabController.maybeOf(context)?.index = 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacing(height: 5, flex: null),
              $TabBar(_data),
              Expanded(child: $TabBarView(_data)),
            ],
          ),
        ),
      ),
    );
  }

  Widget $TabBar(List data) {
    final switchWardrobeMode = Get.find<ClothSelectorCtrl>().setWardrobeMode;

    final tabs = data.asMap().entries.map((it) {
      final index = it.key;

      return (b) {
        return ShopTab(
          title: it.value['name'],
          icon: NetImage(it.value[b ? 'select_icon' : 'icon'], fit: BoxFit.contain),
          isShowDivider: index != data.length - 1,
        );
      };
    });

    return ShopTabBar(
      onTap: (int i) => switchWardrobeMode(i == 0),
      tabs: tabs,
      beforeTab: ShopTab(
        title: '衣柜',
        isShowDivider: true,
        icon: Builder(
          builder: (context) {
            return SvgView(
              SVG.$('dressup/我的'),
              width: 31,
              height: 31,
              color: DefaultTextStyle.of(context).style.color,
            );
          },
        ),
      ),
    );
  }

  Widget $TabBarView(List data) {
    final items = [
      ...tabs.values,
      ...data.map((it) => MyView(categoryId: it['id'])),
    ];

    const count = 2;
    const space = 5.0;

    return ConfigList(
      config: GridConfig(
        padding: const Pad(horizontal: space * 2, vertical: 5),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count,
          mainAxisSpacing: space,
          crossAxisSpacing: space,
          mainAxisExtent: (AppSize.width - (3 * space + 4 * space)) / 3.5,
        ),
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: items,
      ),
    );
  }

  @override
  late List<XOverlayWidget> overlay = [
    if (!Get.find<IntroCtrl>().isMarked('MyClothIntroOverlay'))
      XOverlayWidget(
        uniqueKey: 'MyClothIntroOverlay',
        rootOverlay: true,
        child: MyClothIntroOverlay(),
      ),
  ];
}
