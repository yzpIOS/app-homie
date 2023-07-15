import 'package:app/common/theme.dart';
import 'package:app/shop/widgets/hold_future.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/my_wardrobe_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

///
/// 衣柜
///
class MyView$Wardrobe extends StatelessWidget {
  late final selectorCtrl = Get.find<ClothSelectorCtrl>();
  late final selector = selectorCtrl.selectorWardrobe;

  MyView$Wardrobe({super.key});

  @override
  Widget build(BuildContext context) {
    final cfg = context.read<BaseConfig>() as GridConfig;

    return GetX<MyWardrobeCtrl>(
      initState: (state) => state.controller?.doRefresh(),
      builder: (it) {
        final data = it.dataRx();

        return data.isEmpty
            ? LayoutBuilder(
                builder: (_, c) {
                  return SizedBox(
                    width: c.maxWidth,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: context.state<DataEmpty>(it.doRefresh),
                    ),
                  );
                },
              )
            : GridView.builder(
                controller: cfg.scroll,
                scrollDirection: cfg.scrollDirection,
                shrinkWrap: cfg.shrinkWrap ?? false,
                physics: cfg.physics,
                padding: cfg.padding,
                gridDelegate: cfg.gridDelegate,
                itemCount: data.length,
                itemBuilder: (_, i) => itemBuilder(data[i].value2),
              );
      },
    );
  }

  Widget itemBuilder(Map item) {
    final productId = item['product_id'];

    Widget child = _ItemView(
      key: ValueKey(productId),
      data: item,
    );

    child = HoldView(
      child: child,
      builder: (Object? taskId, DoHold doHold, child) {
        return GestureDetector(
          onTap: taskId != null ? null : () => doHold(productId, selector.doSelect(item)),
          child: Obx(
            () {
              final isSelected = selector.isRxSelected(productId);

              return DecoratedBox(
                decoration: ShapeDecoration(
                  color: const Color(0xFFF5F5F5),
                  shape: XRectangleBorder(
                    borderRadius: AppBorderRadius.a10,
                    side: isSelected
                        ? const BorderSide(width: 2, color: AppPalette.primary)
                        : (taskId == productId ? const BorderSide(width: 2, color: AppPalette.hint) : BorderSide.none),
                  ),
                ),
                child: child,
              );
            },
          ),
        );
      },
    );

    return child;
  }
}

class _ItemView extends StatelessWidget {
  final Map data;

  const _ItemView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Widget children = Column(
      children: [
        Expanded(
          flex: 70,
          child: BlankImgState(
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
          ),
        ),
        const Spacing(flex: 4),
        XText(
          data['name'],
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        const Spacing(flex: 8),
      ],
    );

    // 左上角图标
    if (data case {'label_list': List items}) {
      if (items.isNotEmpty) {
        children = Stack(
          children: [
            children,
            for (var i = 0; i < items.length; ++i)
              Positioned(
                top: 5,
                left: 5.0 * (i + 1) + 32 * i,
                child: NetImage(items[i]['icon'], width: 32, height: 16, fit: BoxFit.contain),
              ),
          ],
        );
      }
    }

    return children;
  }
}
