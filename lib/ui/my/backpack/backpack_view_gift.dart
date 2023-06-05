import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class BackpackView$Gift extends StatefulWidget {
  const BackpackView$Gift({super.key});

  @override
  State<BackpackView$Gift> createState() => _BackpackView$GiftState();
}

class _BackpackView$GiftState extends SimpleDataState<Map, BackpackView$Gift> {
  @override
  BaseConfig? get config {
    return const GridConfig(
      padding: Pad(horizontal: 20, vertical: 20),
      gridDelegate: XGridDelegate(
        childAspectRatio: 105 / 78,
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        fixedHeight: 22,
      ),
    );
  }

  @override
  Future fetch() => Api.Gift.backpack();

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
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
