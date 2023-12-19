import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ShopTabBar extends StatelessWidget {
  final Widget? beforeTab;
  final ValueChanged<int>? onTap;
  final Iterable<Widget Function(bool isSelected)> tabs;

  const ShopTabBar({super.key, required this.tabs, this.beforeTab, this.onTap});

  @override
  Widget build(BuildContext context) {
    final beforeTab = this.beforeTab;
    final hasBeforeTab = beforeTab != null;

    final ctrl = DefaultTabController.of(context);

    return TabBar(
      onTap: onTap,
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      indicator: const BoxDecoration(),
      //
      padding: const Pad(left: 4,),
      labelPadding: const Pad(left: 4, right: 4),
      //
      labelColor: AppPalette.primary,
      labelStyle: const TextStyle(fontSize: 10, fontWeight: fw$SemiBold),
      //
      unselectedLabelColor: AppPalette.txtDark,
      unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: fw$Regular),
      //
      tabs: [
        if (hasBeforeTab) beforeTab,
        ...tabs.mapIndexed((index, builder) {
          final i = hasBeforeTab ? index + 1 : index;

          return AnimatedBuilder(
            animation: ctrl,
            builder: (_, __) => builder(i == ctrl.index),
          );
        }),
      ],
    );
  }
}

class ShopTab extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool isShowDivider;//是否显示分割线

  const ShopTab({super.key, required this.title, required this.icon, required this.isShowDivider,});

  @override
  Widget build(BuildContext context) {
    const sizeWidth = 60.0;
    const sizeHeight = 40.0;

    Widget child;

    child = Stack(
      clipBehavior: Clip.none,
      children: [
        BlankImgState(
          child: SizedBox(width: 31, height: 31, child: icon),
        ),
        Positioned(
          top: 16,
          left: 30,
          child: XText(
            title,
            overflow: TextOverflow.fade,
          ),
        ),
        if(isShowDivider)
          const Positioned(
            top: 12,
            right: 0,
            child: Box(width: 1, height: 8.5, color: AppPalette.color71),
          ),
      ],
    );

    child = Box(width: sizeWidth, height: sizeHeight, child: child);

    return child;
  }
}
