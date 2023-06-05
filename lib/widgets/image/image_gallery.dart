import 'package:app/store/common/size_provider.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

abstract class GalleryItem {
  PhotoViewGalleryPageOptions toGalleryOptions();
}

class ImageGalleryItem extends GalleryItem {
  final ImageProvider image;
  final ImageProvider? thumb;
  final Object? heroTag;
  final SizeProvider? sizeProvider;
  final VoidCallback? onLongPress;

  ImageGalleryItem({
    required this.image,
    this.thumb,
    this.sizeProvider,
    this.heroTag,
    this.onLongPress,
  });

  late final size = _size();

  @override
  PhotoViewGalleryPageOptions toGalleryOptions() {
    Widget child = SizedBox.fromSize(
      size: size,
      child: ConfigImgState(
        loading: _loadingBuilder,
        child: AppImage(image: image),
      ),
    );

    child = GestureDetector(
      onTap: Get.back,
      onLongPress: onLongPress,
      child: child,
    );

    if (heroTag != null) child = Hero(tag: heroTag!, child: child);

    return PhotoViewGalleryPageOptions.customChild(
      minScale: 0.5 / Get.pixelRatio,
      maxScale: PhotoViewComputedScale.covered,
      initialScale: PhotoViewComputedScale.contained,
      childSize: size,
      child: child,
    );
  }

  Size? _size() {
    final size = sizeProvider?.sizeOrNull();

    if (size != null) {
      return size / Get.pixelRatio;
    }

    return null;
  }

  Widget _loadingBuilder(Tuple2<String?, double?>? arg) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (thumb != null) Positioned.fill(child: Image(image: thumb!)),
        FittedBox(
          child: Box(
            width: 375,
            height: 375,
            alignment: Alignment.center,
            child: SizedBox.fromSize(
              size: const Size.square(48),
              child: CircularPercentIndicator(
                radius: 24,
                lineWidth: 3,
                animation: true,
                curve: Curves.easeOutCubic,
                animationDuration: 200,
                percent: arg?.value2 ?? 0.01,
                progressColor: Colors.white,
                backgroundColor: Colors.black38,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageGallery extends StatefulWidget {
  final int initialPage;
  final int itemCount;
  final GalleryItem Function(int index) itemBuilder;

  const ImageGallery({
    super.key,
    required this.initialPage,
    required this.itemCount,
    required this.itemBuilder,
  });

  static void showPage({
    required int initialPage,
    required int itemCount,
    required GalleryItem Function(int index) itemBuilder,
  }) {
    Get.push(
      GalleryRoute(
        ImageGallery(initialPage: initialPage, itemCount: itemCount, itemBuilder: itemBuilder),
      ),
    );
  }

  static void show({required GalleryItem data}) => showPage(initialPage: 0, itemCount: 1, itemBuilder: (_) => data);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  late final controller = PageController(initialPage: widget.initialPage);

  late final itemCount = widget.itemCount;
  late final itemBuilder = widget.itemBuilder;

  @override
  Widget build(BuildContext context) {
    Widget child = PhotoViewGallery.builder(
      backgroundDecoration: const BoxDecoration(),
      enableRotation: false,
      pageController: controller,
      itemCount: itemCount,
      builder: (_, i) => itemBuilder(i).toGalleryOptions(),
    );

    child = GestureDetector(
      onTap: Get.back,
      child: child,
    );

    child = Material(
      type: MaterialType.transparency,
      child: child,
    );

    child = UiOverlayRegion.light(child: child);

    return child;
  }
}
