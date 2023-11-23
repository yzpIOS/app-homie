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
      padding: Pad.zero,
      labelPadding: const Pad(left: 10, right: 8),
      //
      labelColor: AppPalette.primary,
      labelStyle: const TextStyle(fontSize: 10, fontWeight: fw$SemiBold),
      //
      unselectedLabelColor: AppPalette.c6,
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

  const ShopTab({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    const size = 46.0;

    Widget child;

    child = Stack(
      clipBehavior: Clip.none,
      children: [
        BlankImgState(
          child: SizedBox(width: 36, height: 36, child: icon),
        ),
        Positioned(
          top: 24,
          left: 36 - 20,
          child: Box(
            width: 20 * 2,
            height: 20,
            alignment: Alignment.center,
            child: XText(title, textAlign: TextAlign.center, overflow: TextOverflow.fade),
          ),
        ),
      ],
    );

    child = Box(width: size, height: size, child: child);

    return child;
  }
}
