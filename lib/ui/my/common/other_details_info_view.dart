import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 个人信息“年龄、星座、地区”
class OtherDetailsInfoView extends StatelessWidget {
  final UID uid;
  final String? account;
  final String? level;

  const OtherDetailsInfoView({super.key, required this.uid, this.account, this.level});

  @override
  Widget build(BuildContext context) {
    Widget $OneItemView(String text) {
      return Container(
        constraints: const BoxConstraints(minWidth: 42, maxWidth: 90,),
        padding: const Pad(horizontal: 4, top: 1.5,),
        height: 20,
        decoration: const BoxDecoration(
          color: Color(0xFFEBEBFF),
          borderRadius: AppBorderRadius.max,
        ),
        child: XText(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, color: AppPalette.color71, fontWeight: fw$Regular),
        ),
      );
    }

    return Row(
      children: [
        // if (account != null) ...[
        //   Flexible(
        //     child: SelectableText('ID $account'),
        //   ),
        // ],
        if (level != null) WealthyLevelView(level: level!, height: 17, uid: uid),
        $OneItemView('20岁'),
        $OneItemView('摩羯座'),
        $OneItemView('广东广东广东'),
      ].separator(Spacing.w4).toList(growable: false),
    );
  }
}