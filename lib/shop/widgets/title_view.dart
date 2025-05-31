import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class GroupTitleView extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? margin;

  const GroupTitleView({super.key, required this.title, this.margin});

  static const double height = 22 + 10 * 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.centerLeft,
      margin: margin,
      padding: const Pad(horizontal: 10),
      child: XText(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$SemiBold),
      ),
    );
  }
}
