import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final ValueNotifier<int> selector;
  final List<NavBarItem> items;

  const NavBar({super.key, required this.selector, required this.items});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.white,
      child: SafeArea(
        child: SizedBox(
          height: 52,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: views,
          ),
        ),
      ),
    );
  }

  List<Widget> get views {
    return items.mapIndexed((index, it) {
      Widget child;

      child = AspectRatio(
        aspectRatio: 1,
        child: InkResponse(
          child: ValueListenableBuilder(
            valueListenable: selector,
            builder: (_, val, __) => it.toView(index == val),
          ),
          onTap: () {
            if (selector.value == index) {
              it.refreshEvent?.fire();
            } else {
              selector.value = index;
            }
          },
        ),
      );

      return child;
    }).toList(growable: false);
  }
}

class NavBarItem {
  final String label;
  final RefreshEvent? refreshEvent;
  final ValueNotifier<int>? badge;

  NavBarItem({required this.label, this.refreshEvent, this.badge});

  Widget toView(bool b) {
    Widget iconView = AnimatedSwitcher(
      duration: kThemeChangeDuration,
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeOutCubic,
      child: SvgView(
        SVG.$('main/nav/$label${b ? '_p' : ''}'),
        width: 24,
        height: 24,
        permanent: true,
        fit: BoxFit.none,
      ),
    );

    if (badge != null) {
      final _iconView = iconView;

      iconView = NotifierView<int>(badge!, onData: (count) {
        return AppBadge.dot(
          show: count > 0,
          position: BadgePosition.topEnd(top: 0, end: -3),
          child: _iconView,
        );
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconView,
        AnimatedDefaultTextStyle(
          duration: kThemeChangeDuration,
          curve: Curves.easeOutCubic,
          style: TextStyle(
            fontSize: 10,
            color: b ? AppPalette.primary : Colors.black,
            fontWeight: b ? fw$SemiBold : fw$Regular,
          ),
          child: XText(label),
        ),
      ],
    );
  }
}
