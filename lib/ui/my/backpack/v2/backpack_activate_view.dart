

import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/backpack/v2/base_backpack_state.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class BackPackActivateView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _BackPackActivateState();
}

class _BackPackActivateState extends BaseBackPackState<BackPackActivateView> {

  @override
  Widget createItem(Map data) {
    return BackPackDataView2(
        padding: Pad(
          horizontal: 10,
          top: 0,
          bottom: 0
        )
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 11,
              childAspectRatio: 0.68
          ),
          itemBuilder: (context, index) {
            // 单个商品item
            return GestureDetector(
              onTap: () {

              },
              behavior: HitTestBehavior.opaque,
              child: createGoodsItem({}),
            );
          }
      ),
    );
  }


  Widget createGoodsItem(Map item) {
    final imageView = Box(
      padding: const Pad(top: 4, bottom: 8),
      child: GiftImgState(
        child: NetImage(item['cover']),
      ),
    );

    final nameView = DecoratedBox(
      decoration: const ShapeDecoration(
        shape: XRectangleBorder(borderRadius: AppBorderRadius.b8),
        gradient: LinearGradient(
          colors: [Color(0xFFB7E0FC), Color(0xFFE1F3FF), Color(0xFFB7E0FC)],
        ),
      ),
      child: Center(
        child: XText(
          item['name'],
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );

    final countView = Container(
      constraints: const BoxConstraints(minWidth: 20),
      decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0x4D000000)),
      alignment: Alignment.center,
      child: XText(
        'X${item['count']}',
        style: const TextStyle(fontSize: 8, color: Colors.white),
      ),
    );

    Widget child = Stack(
      children: [
        Positioned(top: 0, left: 0, right: 0, bottom: 22, child: imageView),
        Positioned(top: 3, right: 3, height: 10, child: countView),
        Positioned(left: 0, right: 0, bottom: 0, height: 22, child: nameView),
      ],
    );

    child = Container(
      foregroundDecoration: const ShapeDecoration(
        shape: XRectangleBorder(
          borderRadius: AppBorderRadius.a8,
          side: BorderSide(
            width: 2,
            color: Color(0xFFE8F5FF),
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
      ),
      child: child,
    );

    return child;
  }

}