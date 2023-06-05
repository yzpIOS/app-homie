import 'package:app/common/theme.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ProductViewGrid extends GetView<ShoppingCartCtrl> {
  final List data;
  final EdgeInsetsGeometry padding;
  final SliverGridDelegateWithFixedCrossAxisCount delegate;

  const ProductViewGrid({super.key, required this.data, required this.delegate, required this.padding});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverGrid(
        gridDelegate: delegate,
        delegate: SliverChildBuilderDelegate(
          childCount: data.length,
          (_, i) => itemBuilder(data[i]),
        ),
      ),
    );
  }

  Widget itemBuilder(Map item) {
    return OpacityButton(
      child: _ItemView(data: item),
      onTap: () {
        simpleSub(
          controller.doAdd(item['id']),
          msg: '已添加至购物车',
        );
      },
    );
  }
}

class _ItemView extends StatelessWidget {
  final Map data;

  const _ItemView({required this.data});

  @override
  Widget build(BuildContext context) {
    final type = MoneyType.fromVal(data['currency']);

    Widget child = BlankImgState(
      child: LayoutBuilder(
        builder: (_, c) {
          final w = c.maxWidth;
          final h = c.maxHeight;

          return XFrameWidget(
            width: w,
            height: h,
            child: NetImage(data['image'], width: w, height: h),
          );
        },
      ),
    );

    child = Container(
      decoration: const ShapeDecoration(color: Color(0xFFE8F5FF), shape: AppShape.a8),
      padding: const Pad(all: 2),
      child: child,
    );

    child = Column(
      children: [
        Expanded(child: child),
        Box(
          height: 22,
          alignment: Alignment.bottomCenter,
          child: XText(data['name']),
        ),
        XRichText(
          TextSpan(
            children: [
              if (type != null)
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: MoneyIcon(type: type, size: 24),
                ),
              TextSpan(text: '${data['price']}'),
            ],
          ),
        ),
        Spacing.h2,
      ],
    );

    child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: fw$SemiBold),
      child: child,
    );

    return child;
  }
}
