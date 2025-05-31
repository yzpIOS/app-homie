import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class UidView extends StatelessWidget {
  final UID uid;
  final String? account;
  final String? level;

  const UidView({super.key, required this.uid, this.account, this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const Pad(left: 8, right: 11),
      height: 20,
      decoration: BoxDecoration(
        color: (account != null) ? const Color(0xFFEBEBFF) : AppPalette.transparent,
        borderRadius: AppBorderRadius.max,
      ),
      child: Row(
        children: [
          if (account != null) ...[
            Expanded(
              child: SelectableText(
                'ID:$account',
                style: const TextStyle(fontSize: 11, color: AppPalette.color71, fontWeight: fw$Regular),
              ),
            ),
            Padding(
              padding: const Pad(bottom: 3),
              child: OpacityButton(
                child: const Text(
                  '点击复制',
                  style: TextStyle(fontSize: 11, color: AppPalette.color71, fontWeight: fw$Regular),
                ),
                onTap: () => copyTxt(account),
              ),
            ),
          ],
        ],
      ),
    );

    // return Row(
    //   children: [
    //     if (account != null) ...[
    //       Flexible(
    //         child: SelectableText('ID $account'),
    //       ),
    //       OpacityButton(
    //         child: SvgView(SVG.$('common/复制'), color: Colors.white, width: 24, height: 24),
    //         onTap: () => copyTxt(account),
    //       ),
    //     ],
    //     if (level != null) WealthyLevelView(level: level!, height: 17, uid: uid),
    //   ].separator(Spacing.w2).toList(growable: false),
    // );
  }
}
