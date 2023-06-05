import 'package:app/common/theme.dart';
import 'package:app/store/common/hero_provider.dart';
import 'package:app/store/common/size_provider.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/image/image_gallery.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/moment/view_item/content.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/ui/moment/view_item/single_attach_view.dart';

mixin MomentImage<T extends IMomentDataAdapter> implements IImageView<T> {
  abstract final ImageCreator imageCreator;

  final _ = Rxn();

  @override
  Widget $img() {
    return Obx(() {
      _();

      return imageCreator.create(vm.images);
    });
  }
}

abstract class ImageCreator<T> {
  Widget create(List<T>? images) {
    if (images != null) {
      switch (images.length) {
        case 0:
          break;
        case 1:
          return singleBuilder(images[0]);
        default:
          return multiBuilder(images);
      }
    }

    assert(false, '数据错误');

    return Spacing.blank;
  }

  Widget _image(List<T> data, T item);

  Widget _imageBuilder(List<T> data, T item) {
    Widget child = _image(data, item);

    child = ClipRRect(
      borderRadius: AppBorderRadius.a6,
      child: child,
    );

    return child;
  }

  Widget singleBuilder(T item) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: Get.width * 0.6),
      child: MomentSingleAttachView(
        size: SizeProvider.from(item),
        child: _imageBuilder([item], item),
      ),
    );
  }

  Widget multiBuilder(List<T> data);
}

//<editor-fold desc="Net">
mixin _NetImageMixin on ImageCreator<Map> {
  @override
  Widget _image(List<Map> data, Map item) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth;
        final maxH = constraints.maxHeight;

        final url = item['url'];
        final hero = context.read<HeroProvider>();

        Widget child = AppImage(
          width: maxW,
          height: maxH,
          fit: BoxFit.cover,
          blur: item['extra'],
          image: const ImageToThumb().toProvider(Left(url)),
        );

        child = hero.withHero(tag: url, child: child);

        child = OpacityButton(
          onTap: onItemClick(_ItemInfo(item: item, data: data, hero: hero)),
          child: child,
        );

        child = XFrameWidget(width: maxW, height: maxH, child: child);

        return child;
      },
    );
  }

  VoidCallback? onItemClick(_ItemInfo info);
}

mixin _ToImageGalleryMixin on _NetImageMixin {
  @override
  VoidCallback onItemClick(_ItemInfo info) {
    return () {
      ImageGallery.showPage(
        initialPage: info.index,
        itemCount: info.count,
        itemBuilder: (i) {
          final item = info.data[i];
          final url = item['url'];
          final tag = info.hero.withTag(url);

          return ImageGalleryItem(
            heroTag: tag,
            image: const ImageToWebp().toProvider(Left(url)),
            thumb: const ImageToThumb().toProvider(Left(url)),
            sizeProvider: SizeProvider.from(item),
          );
        },
      );
    };
  }
}

class ImageCreator$Grid extends ImageCreator<Map> with _NetImageMixin, _ToImageGalleryMixin {
  final int axisCount;
  final int maxLines;

  ImageCreator$Grid({required this.axisCount, this.maxLines = 1}) : assert(axisCount > 0);

  @override
  Widget multiBuilder(List<Map> data) {
    final total = data.length;

    bool isOverflow = false;
    Iterable<Map> _data = data;

    if (maxLines > 0) {
      if (total / axisCount > maxLines) {
        isOverflow = true;

        _data = data.take(maxLines * axisCount);
      }
    }

    Widget child = GridLayout(
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: 1,
      crossAxisCount: axisCount,
      children: _data.map((it) => _imageBuilder(data, it)).toList(growable: false),
    );

    if (isOverflow) {
      child = Stack(
        children: [
          child,
          Positioned(
            right: 5,
            bottom: 5,
            child: Container(
              width: 25,
              height: 15,
              alignment: Alignment.center,
              decoration: const ShapeDecoration(color: Colors.black38, shape: XStadiumBorder()),
              child: XText(
                '$total',
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

    return child;
  }
}

class ImageCreator$Detail extends ImageCreator$Grid with _ToImageGalleryMixin {
  ImageCreator$Detail() : super(axisCount: 3, maxLines: -1);
}

class _ItemInfo {
  final Map item;
  final List<Map> data;
  final HeroProvider hero;

  final int index;
  final int count;

  _ItemInfo({required this.item, required this.data, required this.hero})
      : index = data.indexOf(item),
        count = data.length;
}
//</editor-fold>
