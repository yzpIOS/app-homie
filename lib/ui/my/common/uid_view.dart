import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/level_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class UidView extends StatelessWidget {
  final UID uid;
  final String? account;
  final String? level;

  const UidView({super.key, required this.uid, this.account, this.level});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (account != null) ...[
          Flexible(
            child: SelectableText('ID $account'),
          ),
          OpacityButton(
            child: SvgView(SVG.$('common/复制'), color: Colors.white, width: 24, height: 24),
            onTap: () => copyTxt(account),
          ),
        ],
        if (level != null) LevelView(level: level!, height: 17, uid: uid),
      ].separator(Spacing.w2).toList(growable: false),
    );
  }
}
