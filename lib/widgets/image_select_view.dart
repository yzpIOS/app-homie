import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

const _radius = AppBorderRadius.a4;

class ImageSelectView extends StatelessWidget {
  final int maxCount;
  final int crossCount;
  final double spacing;
  final RxList<AssetEntity> imageRx;

  const ImageSelectView(
    this.imageRx, {
    super.key,
    this.spacing = 4,
    this.maxCount = 8,
    this.crossCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    Widget itemBuilder(AssetEntity it) {
      return LayoutBuilder(
        key: ValueKey(it),
        builder: (BuildContext context, BoxConstraints constraints) {
          final width = constraints.maxWidth;

          return $ItemWrap(
            child: Image(image: it.toProvider(), width: width, fit: BoxFit.cover),
            onDel: () => imageRx.remove(it),
          );
        },
      );
    }

    return ObxValue<RxList<AssetEntity>>(
      (items) {
        final max = maxCount - items.length;

        return GridLayout(
          childAspectRatio: 1,
          crossAxisCount: crossCount,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          children: [
            ...items.map(itemBuilder),
            if (max > 0) $AddView(imageAdd(imageRx, max)),
          ],
        );
      },
      imageRx,
    );
  }

  static Widget $AddView(VoidCallback onTap) {
    return Material(
      key: const Key('ADD'),
      borderRadius: _radius,
      color: const Color(0xFFF8F8F9),
      child: InkWell(
        onTap: onTap,
        child: const Center(
          child: Icon(
            Icons.add_rounded,
            size: 32,
            color: Color(0xFFBBBBBB),
          ),
        ),
      ),
    );
  }

  static Widget $ItemWrap({required Widget child, Widget? icon, VoidCallback? onDel}) {
    Widget $DelButton(VoidCallback onTap) {
      return OpacityButton(
        onTap: onTap,
        child: Box(
          width: 26,
          height: 26,
          alignment: Alignment.center,
          child: SvgView(SVG.$('ic_delete'), width: 18, height: 18),
        ),
      );
    }

    return Material(
      color: const Color(0xFFF8F8F9),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: _radius,
              child: child,
            ),
          ),
          if (icon != null) Center(child: icon),
          if (onDel != null) Positioned(top: 0, right: 0, child: $DelButton(onDel)),
        ],
      ),
    );
  }

  static VoidCallback imageAdd(RxList<AssetEntity> imageRx, int max) {
    return () {
      assetPicker(
        max: max,
        type: RequestType.image,
        okCall: (it) => imageRx.addAll(it.whereNot((it) => imageRx.contains(it))),
      );
    };
  }
}
