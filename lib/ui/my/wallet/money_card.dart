import 'package:app/common/theme.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class MoneyCard extends StatelessWidget {
  final MoneyType type;
  final String tips;
  final String? action;
  final ValueChanged<String>? onItemClick;

  const MoneyCard({super.key, required this.type, required this.tips, this.action, this.onItemClick});

  @override
  Widget build(BuildContext context) {
    const _decor = ShapeDecoration(
      shape: XStadiumBorder(),
      color: AppPalette.primary,
      shadows: [
        BoxShadow(
          color: Color(0xC4FFFFFF),
          blurRadius: 4,
          spreadRadius: 1,
          offset: Offset(0, 2),
        ),
        BoxShadow(
          color: Color(0x29000000),
          blurRadius: 6,
          spreadRadius: -3,
          offset: Offset(0, 3),
          blurStyle: BlurStyle.outer,
        ),
      ],
    );

    Widget child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WalletCtrl.use(
          builder: (it) {
            return XText(
              '${it[type] ?? '--'}',
              style: const TextStyle(fontSize: 24, color: AppPalette.primary, fontWeight: fw$SemiBold),
            );
          },
        ),
        Spacing.h4,
        XRichText(
          TextSpan(
            children: [
              TextSpan(text: type.label),
              const TextSpan(
                text: ' | ',
                style: TextStyle(color: AppPalette.cc),
              ),
              TextSpan(text: tips),
            ],
          ),
          style: const TextStyle(fontSize: 12, color: AppPalette.c9),
        ),
      ],
    );

    child = Row(
      children: [
        MoneyIcon(type: type, size: 60, variant: 1),
        Expanded(child: child),
        if (action != null)
          OpacityButton(
            onTap: onItemClick == null ? null : () => onItemClick!(action!),
            child: DecoratedBox(
              decoration: _decor,
              child: Box(
                width: 60,
                height: 32,
                alignment: Alignment.center,
                child: XText(
                  action!,
                  style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$SemiBold),
                ),
              ),
            ),
          ),
      ].separator(Spacing.w10).toList(growable: false),
    );

    child = Box(
      height: 100,
      padding: const Pad(horizontal: 10),
      child: child,
    );

    child = Material(
      elevation: 10,
      shadowColor: const Color(0x1A000000),
      borderRadius: AppBorderRadius.a10,
      child: child,
    );

    return child;
  }
}
