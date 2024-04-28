
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class MineHomieItemView extends StatelessWidget {
  final Map item;

  const MineHomieItemView({required this.item});

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      children: [
        Spacing.w8,
        UserHomeWrap(
          uid: item['send_uid'],
          child: AvatarView(item['send_avatar_url'], size: 40),
        ),
        Spacing.w10,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: XText(
                      '${item['text']}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 3,),
                  Image.asset(IMG.format(item['type'] == 1 ? "my/ic_income" :"my/ic_cost"), width: 32, height: 18,),
                ],
              ),
              Spacing.h10,
              XText(
                TimeFormat.yMMMMdHms.formatEpoch(item['created_at']),
                style: const TextStyle(fontSize: 12, color: AppPalette.colorA9, fontWeight: fw$Regular),
              ),
            ],
          ),
        ),
        SizedBox(width: 3,),
        Container(
          width: 42,
          height: 42,
          clipBehavior: Clip.hardEdge,
          decoration: const ShapeDecoration(shape: AppShape.a4, color: Color(0xFFF5F5F5)),
          child: Stack(
            children: [
              Positioned(
                top: 1,
                left: 1,
                right: 1,
                bottom: 1,
                child: GiftImgState(
                  child: NetImage(item['product_url'], width: 40, height: 40),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 2,
                child: IntrinsicWidth(
                  child: Container(
                    constraints: BoxConstraints.tight(const Size.square(10)).copyWith(maxWidth: 20),
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0xFF2CDFB9)),
                    child: XText(
                      '${item['count']}',
                      style: const TextStyle(fontSize: 7, color: Colors.white, fontWeight: fw$Medium),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Spacing.w16,
        XText(
          item['amount'] != null ? '${item['type'] == 1 ? '+' : '-'}${item['amount'].toString()}' : '-',
          style: TextStyle(fontSize: 15, color: Color(item['type'] == 1 ? 0xFFFE4848 : 0xFF1FB95D)),
        ),

        Spacing.w10,
      ],
    );

    child = Box(height: 82, child: child);

    return child;
  }
}
