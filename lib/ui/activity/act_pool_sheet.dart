import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ActPoolSheet extends ISheetWidget {
  @override
  late final Widget title = const Text('本期奖池');
  @override
  late final Tuple2<Widget, VoidCallback>? leading = null;
  @override
  late final Tuple2<Widget, VoidCallback>? trailing = closeBtn;

  ActPoolSheet({super.key});

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
      padding: Pad(horizontal: 10, top: 8, bottom: AppSize.safeBottom),
      gridDelegate: const XGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 12,
        fixedHeight: 2 + 38,
      ),
    );
  }

  @override
  Future fetch() => Api.Lottery.pool();

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final type = MoneyType.fromVal(item['currency']);

    Widget child = AspectRatio(
      aspectRatio: 1,
      child: XFrameWidget(
        child: NetImage(item['image']),
      ),
    );

    child = Column(
      children: [
        Spacing.h2,
        child,
        Spacing.exp,
        XText(
          item['prize_name'],
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        Spacing.exp,
        XRichText(
          TextSpan(
            children: [
              if (type != null)
                WidgetSpan(
                  child: Padding(
                    padding: const Pad(right: 1),
                    child: MoneyIcon(type: type, size: 20),
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
              TextSpan(
                text: '${item['price']}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );

    child = DecoratedBox(
      decoration: const ShapeDecoration(color: Color(0xFFF5F5F5), shape: AppShape.a8),
      child: child,
    );

    return child;
  }
}
