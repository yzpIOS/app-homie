import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

AppBar xAppBar({
  title,
  Widget? leading,
  bool? centerTitle,
  Color? bgColor,
  actions,
  PreferredSizeWidget? bottom,
}) {
  List<Widget>? _actions;

  if (actions is Widget) {
    _actions = [actions, Spacing.w10];
  } else if (actions is Iterable<Widget>) {
    _actions = [...actions, Spacing.w10];
  }

  Widget? _title, _flexibleSpace;

  if (title is String) {
    _title = XText(title);
  } else if (title is String) {
    _title = XText(title);
  } else if (title is Text) {
    _title = title;
  } else if (title is Builder) {
    _title = title;
  } else if (title is Widget) {
    _flexibleSpace = title;
  } else if (title == null) {
    //ignore
  } else {
    assert(false, title);
  }

  Color? _foregroundColor;

  if (bgColor != null) {
    switch (ThemeData.estimateBrightnessForColor(bgColor)) {
      case Brightness.dark:
        _foregroundColor = AppPalette.appBarForegroundColorDark;

        if (_title != null) {
          _title = DefaultTextStyle.merge(
            style: TextStyle(color: _foregroundColor),
            child: _title,
          );
        }
        break;
      case Brightness.light:
        break;
    }
  }

  return AppBar(
    actions: _actions,
    title: _title,
    flexibleSpace: _flexibleSpace,
    foregroundColor: _foregroundColor,
    backgroundColor: bgColor,
    centerTitle: centerTitle,
    leading: leading,
    bottom: bottom,
  );
}

Widget xAppBar$TabBar(
  Iterable<String> tabs, {
  final TabController? controller,
  final double height = AppSize.appBar,
  final bool isScrollable = true,
  final Color indicatorColor = AppPalette.primary,
  final Tuple2<Color, Color> labelColor = const Tuple2(AppPalette.primary, Colors.black),
  final AlignmentGeometry alignment = Alignment.bottomCenter,
}) {
  const double kItemHeight = 30;

  return Align(
    alignment: alignment,
    child: TabBar(
      controller: controller,
      labelPadding: const Pad(horizontal: 15),
      //
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const UnderlineTabIndicator(
        borderRadius: AppBorderRadius.a2,
        borderSide: BorderSide(width: 2, color: AppPalette.primary),
      ),
      //
      labelStyle: const TextStyle(fontSize: 17, fontWeight: fw$SemiBold),
      unselectedLabelStyle: const TextStyle(fontSize: 17, fontWeight: fw$Regular),
      //
      labelColor: labelColor.value1,
      unselectedLabelColor: labelColor.value2,
      //
      isScrollable: isScrollable,
      padding: Pad(vertical: (height - kItemHeight) / 2),
      tabs: tabs.map((it) => Tab(text: it, height: kItemHeight)).toList(growable: false),
    ),
  );
}

Widget xActionBtn({required Widget icon, VoidCallback? onPressed}) {
  return IconButton(
    icon: icon,
    padding: Pad.zero,
    onPressed: onPressed,
    visualDensity: VisualDensity.compact,
  );
}

extension ActionBtn$String on String {
  Widget toTxtAction({Color? color, double? fontSize = 17, VoidCallback? onPressed}) {
    return InkResponse(
      onTap: onPressed,
      child: Container(
        constraints: const BoxConstraints(minWidth: 56),
        alignment: Alignment.center,
        child: XText(
          this,
          style: TextStyle(fontSize: fontSize, color: color, fontWeight: fw$Medium),
        ),
      ),
    );
  }

  Widget toStadiumAction({VoidCallback? onPressed}) {
    return xActionBtn(
      onPressed: onPressed,
      icon: Container(
        width: 48,
        height: 30,
        alignment: Alignment.center,
        decoration: const ShapeDecoration(shape: XStadiumBorder(), color: AppPalette.primary),
        child: XText(
          this,
          style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
        ),
      ),
    );
  }

  Widget toImgAction({VoidCallback? onPressed}) {
    return xActionBtn(
      onPressed: onPressed,
      icon: Image.asset(IMG.$(this), scale: 3),
    );
  }

  Widget toSvgAction({VoidCallback? onPressed, Color? color = Colors.black}) {
    return xActionBtn(
      onPressed: onPressed,
      icon: SvgView(SVG.$(this), color: color, fit: BoxFit.none),
    );
  }

  Widget toMenuAction(Iterable<String> items, {PopupMenuItemSelected<String>? onSelected}) {
    return PopupMenuButton<String>(
      icon: SvgView(SVG.$(this), color: Colors.black),
      onSelected: onSelected,
      itemBuilder: (_) {
        return items //
            .map((it) => PopupMenuItem(value: it, child: XText(it)))
            .toList(growable: false);
      },
    );
  }
}
