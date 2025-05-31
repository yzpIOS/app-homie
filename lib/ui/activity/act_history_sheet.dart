import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ActHistorySheet extends ISheetWidget {
  @override
  late final Widget title = const Text('我的中奖记录');
  @override
  late final Tuple2<Widget, VoidCallback>? leading = null;
  @override
  late final Tuple2<Widget, VoidCallback>? trailing = closeBtn;

  ActHistorySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const Pad(top: 8),
      child: GiftImgState(
        child: _DataView(),
      ),
    );
  }
}

class _DataView extends SimpleDataView<Map> {
  @override
  BaseConfig get config {
    return GridConfig(
      padding: Pad(horizontal: 20, top: 8, bottom: AppSize.safeBottom),
      gridDelegate: const XGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 26,
        crossAxisSpacing: 38,
        fixedHeight: 20 + 16,
      ),
    );
  }

  @override
  Future fetch() => Api.Lottery.winning();

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final type = MoneyType.fromVal(item['currency']);

    Widget $NumView() {
      return Container(
        constraints: const BoxConstraints(minWidth: 26),
        alignment: Alignment.center,
        padding: const Pad(horizontal: 4),
        decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0xFF6BE5B0)),
        child: XText(
          'X${item['count']}',
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
          style: const TextStyle(fontSize: 10, color: Colors.white, height: 1),
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
            child: NetImage(item['image']),
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
          item['prize_name'],
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
                text: '${item['price']}',
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );

    return child;
  }
}
