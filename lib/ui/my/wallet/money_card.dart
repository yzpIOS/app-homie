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

    late final Color textColor;
    switch(type.val) {
      case 0:
        textColor = const Color(0xFFBD7BE5);
        break;
      case 1:
        textColor = const Color(0xFFFFD143);
        break;
      case 2:
      default:
        textColor = AppPalette.txtDark;
        break;
    }
    Widget child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WalletCtrl.use(
          builder: (it) {
            return XText(
              '${it[type] ?? '--'}',
              style: const TextStyle(fontSize: 24, color: AppPalette.txtDark, fontWeight: fw$SemiBold),
            );
          },
        ),
        Spacing.h4,
        XRichText(
          TextSpan(
            children: [
              TextSpan(
                text: type.label,
                style: TextStyle(fontSize: 12, color: textColor),
              ),
              const TextSpan(text: ' | ',),
              TextSpan(text: tips),
            ],
          ),
          style: const TextStyle(fontSize: 12, color: AppPalette.colorA9),
        ),
      ],
    );

    child = Row(
      children: [
        MoneyIcon(type: type, size: 51,),
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

    child = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.a10,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8D47FF).withAlpha(80),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Material(
        elevation: 10,
        borderRadius: AppBorderRadius.a10,
        child: child,
      ),
    );

    return child;
  }
}
