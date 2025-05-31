import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/shop/widgets/hold_future.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

///
/// 套装，头发，上装，下装等
///
class MyView extends StatefulWidget {
  final int? categoryId;

  const MyView({super.key, this.categoryId});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends SimplePageState<Map, MyView> {
  late final selectorCtrl = Get.find<ClothSelectorCtrl>();
  late final selector = selectorCtrl.selectorCloth;
  StreamSubscription? streamSubscription = null;

  @override
  void didUpdateWidget(covariant MyView oldWidget) {
    super.didUpdateWidget(oldWidget);
    streamSubscription?.cancel();
    streamSubscription = Future.delayed(const Duration(milliseconds: 100)).asStream().listen((event) {
      doRefresh();
    });
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription?.cancel();
  }

  @override
  Future fetchPage(PageNum page) {
    return Api.DressUp.myList(page: page, categoryId: widget.categoryId);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
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
