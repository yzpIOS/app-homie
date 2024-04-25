import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/my_tab_indicator.dart';
import 'package:flutter/material.dart';

AppBar xAppBar({
  title,
  Widget? leading,
  bool? centerTitle,
  Color? bgColor,
  actions,
  PreferredSizeWidget? bottom,
  automaticallyImplyLeading =  true,
  ShapeBorder? shape,
  TextStyle? titleTextStyle,
  IconThemeData? iconTheme,
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
    titleTextStyle: titleTextStyle,
    flexibleSpace: _flexibleSpace,
    foregroundColor: _foregroundColor,
    backgroundColor: bgColor,
    centerTitle: centerTitle,
    leading: leading,
    bottom: bottom,
    automaticallyImplyLeading: automaticallyImplyLeading,
    shape: shape,
    iconTheme: iconTheme,
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
  final needPadding = true,
  final needDownLine = true,
  final double fontSize = 17,
  List<Widget>? tabManufacture,
  Decoration? decoration,
  final useDecoration = true,
  final double horizonPadding = 0,
  final double kItemHeight = 30,
  final double labelPadding = 15,
}) {

  return Align(
    alignment: alignment,
    child: TabBar(
      tabAlignment: TabAlignment.center,
      controller: controller,
      labelPadding: Pad(horizontal: labelPadding),
      //
      indicatorSize: TabBarIndicatorSize.label,
      indicator: useDecoration ? (decoration ?? const UnderlineTabIndicator(
        borderRadius: AppBorderRadius.a2,
        borderSide: BorderSide(width: 2, color: AppPalette.primary),
      )) : null,
      //
      labelStyle: TextStyle(fontSize: fontSize, fontWeight: fw$SemiBold),
      unselectedLabelStyle: TextStyle(fontSize: fontSize, fontWeight: fw$Regular),
      //
      labelColor: labelColor.value1,
      unselectedLabelColor: labelColor.value2,
      //
      isScrollable: isScrollable,
      padding: needPadding ? Pad(vertical: (height - kItemHeight) / 2, horizontal: horizonPadding) : null,
      tabs: tabManufacture ?? tabs.map((it) => Tab(text: it, height: kItemHeight)).toList(growable: false),
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
      icon: Image.asset(IMG.format(this), scale: 3),
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
