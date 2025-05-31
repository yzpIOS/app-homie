import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.textStyle,
    this.backgroundColor,
    this.radius,
    this.spacing,
    this.padding,
    this.iconSort = 1,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final Widget icon;
  final Color? backgroundColor;
  final double? radius;
  final double? spacing;
  final EdgeInsets? padding;
  /// 图标顺序 1前 2后 默认前面
  final int iconSort;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 0))),
            padding:MaterialStateProperty.all(padding ?? EdgeInsets.zero),
            backgroundColor: backgroundColor != null
                ? MaterialStateProperty.all<Color>(backgroundColor!)
                : MaterialStateProperty.all<Color>(Colors.transparent)),
        onPressed: onPressed,
        child: Text.rich(
          TextSpan(
              style: textStyle ??
                  const TextStyle(color: Colors.black, fontSize: 13),
              children: [
                iconSort == 1 ? WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: icon,
                ) : TextSpan(
                  text: text,
                ),
                if (spacing != null)
                  WidgetSpan(
                    child: SizedBox(width: spacing),
                  ),
                iconSort == 1 ? TextSpan(
                  text: text,
                ) : WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: icon,
                ),
              ]),
        ));
  }
}
