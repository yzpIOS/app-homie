
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class MineWalletItemView extends StatelessWidget {
  final Map data;

  const MineWalletItemView({required this.data});

  @override
  Widget build(BuildContext context) {
    return Box(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    XText(
                      data['name'] ?? '-',
                      style: const TextStyle(fontSize: 14, color: AppPalette.txtDark, fontWeight: fw$Medium),
                    ),
                    SizedBox(width: 3,),
                    Image.asset(IMG.format(data['type'] == 1 ? "my/ic_income" :"my/ic_cost"), width: 32, height: 18,)
                  ],
                ),
                Spacing.h4,
                XText(
                  TimeFormat.yyyyMMddHms.formatEpoch(data['created_at']),
                  style: const TextStyle(fontSize: 12, color: AppPalette.colorA9, fontWeight: fw$Regular),
                ),
              ],
            ),
          ),
          // const Expanded(child: Spacing.blank),
          XText(
            data['amount'] != null ? '${data['type'] == 1 ? '+' : '-'}${data['amount'].toString()}' : '-',
            style: TextStyle(fontSize: 15, color: Color(data['type'] == 1 ? 0xFFFE4848 : 0xFF1FB95D)),
          ),
        ],
      ),
    );
  }
}
