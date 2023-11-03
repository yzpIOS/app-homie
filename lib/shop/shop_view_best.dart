import 'package:app/common/theme.dart';
import 'package:app/shop/shop_view_list.dart';
import 'package:app/shop/widgets/title_view.dart';
import 'package:app/store/shop_category_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ShopViewBest extends StatelessWidget {
  final ScrollController scroll;

  ShopViewBest(
    this.scroll, {
    super.key,
  });

  final selectRx = RxnInt();

  @override
  Widget build(BuildContext context) {
    Widget child = Obx(
      () => ShopViewList(scroll: scroll, categoryId: selectRx()),
    );

    child = Row(
      children: [
        $CategoryView(),
        Expanded(child: child),
      ],
    );

    child = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: child,
    );

    child = Column(
      children: [
        GroupTitleView(
          title: '热销异性商品',
          margin: Pad(top: AppSize.safeTop),
        ),
        Expanded(child: child),
      ],
    );

    return child;
  }

  Widget $CategoryView() {
    Widget $DataView(List data) {
      Widget itemWrap({required Widget child, int? categoryId}) {
        Widget builder(bool b) {
          return Material(
            color: b ? Colors.white : Colors.transparent,
            textStyle: b
                ? const TextStyle(fontSize: 10, color: AppPalette.primary, fontWeight: fw$SemiBold)
                : const TextStyle(fontSize: 10, color: AppPalette.c6),
            child: child,
          );
        }

        return OpacityButton(
          onTap: () => selectRx.value = categoryId,
          child: Obx(
            () => builder(selectRx.value == categoryId),
          ),
        );
      }

      Widget itemBuilder(int index, data) {
        final categoryId = data['id'];

        Widget child = Stack(
          children: [
            Positioned(
              top: 5,
              left: 10,
              child: BlankImgState(
                child: Obx(
                  () {
                    return NetImage(
                      data[selectRx() == categoryId ? 'select_icon' : 'icon'],
                      width: 36,
                      height: 36,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 24,
              left: 36 - (9 - 2),
              right: 9 - (9 - 2),
              child: TextOneLine(data['name'] ?? '', textAlign: TextAlign.center),
            ),
          ],
        );

        child = SizedBox(height: 56, child: child);

        child = itemWrap(categoryId: categoryId, child: child);

        return child;
      }

      return ListView(
        padding: const Pad(bottom: 90),
        children: [
          // itemWrap(
          //   child: const Box(
          //     height: 32,
          //     alignment: Alignment.center,
          //     child: XText('全部', style: TextStyle(fontSize: 14)),
          //   ),
          // ),
          ...data.mapIndexed(itemBuilder),
        ],
      );
    }

    return Box(
      width: 65,
      color: const Color(0xFFF5F5F5),
      child: GetX<ShopCategoryCtrl>(
        builder: (it) {
          final _data = it.allCategoryList ?? [];
          if (selectRx.value == null && _data.isNotEmpty) {
            final temp = _data.first;
            final categoryId = temp['id'];
            selectRx.value = categoryId;
          }
          return $DataView(_data);
        },
        initState: (value) {
          value.controller?.getAllCategoryList();
        },
      ),
    );
  }
}
