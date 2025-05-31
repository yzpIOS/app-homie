import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ActResultDialog extends StatelessWidget {
  final List data;

  const ActResultDialog({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(
      padding: const Pad(horizontal: 8, top: 0, bottom: 12),
      child: Stack(
        alignment: Alignment.center,
        children: $Body(),
      ),
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: Colors.black),
      child: child,
    );

    child = Container(
      width: 288,
      height: 327,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(IMG.format('activity/结果背景')), scale: 3),
      ),
      margin: const Pad(horizontal: 20),
      child: child,
    );

    child = FittedBox(
      fit: BoxFit.contain,
      alignment: const FractionalOffset(0.5, (224 + 327 / 2) / 812),
      child: child,
    );

    return child;
  }

  List<Positioned> $Body() {
    final children = <Widget>[];
    final total = <MoneyType?, num>{};

    Widget itemBuilder(MoneyType? type, Map data) {
      Widget $NumView() {
        return Container(
          constraints: const BoxConstraints(minWidth: 26),
          alignment: Alignment.center,
          padding: const Pad(horizontal: 4),
          decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0xFF6BE5B0)),
          child: XText(
            'X${data['count']}',
            style: const TextStyle(fontSize: 10, color: Colors.white),
          ),
        );
      }

      Widget child = Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -6,
            right: 0,
            height: 14,
            child: $NumView(),
          ),
          Positioned(
            top: 12,
            left: 12,
            right: 12,
            bottom: 12,
            child: XFrameWidget(
              child: NetImage(data['prize_image']),
            ),
          ),
        ],
      );

      child = AspectRatio(
        aspectRatio: 1,
        child: DecoratedBox(
          decoration: const ShapeDecoration(color: Color(0xFFF5F5F5), shape: AppShape.a4),
          child: child,
        ),
      );

      child = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          child,
          XText(
            data['prize_name'],
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          XRichText(
            TextSpan(
              children: [
                if (type != null)
                  WidgetSpan(
                    child: Padding(
                      padding: const Pad(right: 1),
                      child: MoneyIcon(type: type, size: 16),
                    ),
                    alignment: PlaceholderAlignment.middle,
                  ),
                TextSpan(
                  text: '${data['price']}',
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      );

      return child;
    }

    for (final item in data) {
      final type = MoneyType.fromVal(item['currency']);

      final amount = item['count'] * item['price'];

      if (total.containsKey(type)) {
        total[type] = total[type]! + (amount);
      } else {
        total[type] = amount;
      }

      children.add(itemBuilder(type, item));
    }

    return [
      const Positioned(
        top: 4,
        child: Text(
          '恭喜您获得',
          style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$SemiBold),
        ),
      ),
      Positioned(
        top: 56,
        left: 6,
        right: 6,
        bottom: 55,
        child: $DataView(children),
      ),
      Positioned(
        right: 13,
        bottom: 20,
        child: $TotalView(total),
      ),
      Positioned(
        bottom: 15,
        width: 120,
        height: 30,
        child: $AgainBtn(),
      ),
    ];
  }

  Widget $AgainBtn() {
    Widget child = const Text(
      '再来一次',
      style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
    );

    child = Container(
      decoration: const ShapeDecoration(
        shape: XStadiumBorder(),
        gradient: LinearGradient(
          colors: [Color(0xFFFFD064), Color(0xFFFFA779)],
        ),
      ),
      alignment: Alignment.center,
      child: child,
    );

    child = OpacityButton(
      child: child,
      onTap: () => Get.back(result: true),
    );

    return child;
  }

  Widget $DataView(List<Widget> children) {
    const delegate = XGridDelegate(
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 8,
      fixedHeight: 20 + 16,
    );

    return GiftImgState(
      child: GridView(
        padding: const Pad(horizontal: 8, top: 8, bottom: 8),
        gridDelegate: delegate,
        children: children,
      ),
    );
  }

  Widget $TotalView(Map<MoneyType?, num> data) {
    return Row(
      children: [
        ...data.entries.map((it) {
          final type = it.key;
          return XRichText(
            TextSpan(
              children: [
                TextSpan(
                  text: '${it.value}',
                  style: const TextStyle(color: AppPalette.primary),
                ),
                if (type != null)
                  WidgetSpan(
                    child: MoneyIcon(type: type, size: 20),
                    alignment: PlaceholderAlignment.middle,
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
