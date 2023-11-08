import 'package:app/common/theme.dart';
import 'package:app/store/banner_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:app/ui/common/web_page.dart';

class HomeBannerView extends StatefulWidget {
  const HomeBannerView({super.key});

  @override
  State<HomeBannerView> createState() => _HomeBannerViewState();
}

class _HomeBannerViewState extends State<HomeBannerView> with GetStateMixin {
  final showRx = RxBool(true);
  final indexRx = RxInt(0);

  late final options = CarouselOptions(
    aspectRatio: 355 / 80,
    viewportFraction: 1,
    autoPlay: true,
    autoPlayCurve: Curves.easeOutCubic,
    enlargeCenterPage: false,
    autoPlayInterval: const Duration(seconds: 3),
    onPageChanged: (i, _) => indexRx(i),
  );

  late final dotsEffect = const ExpandingDotsEffect(
    dotColor: AppPalette.divider,
    activeDotColor: AppPalette.primary,
    spacing: 4,
    dotWidth: 5,
    dotHeight: 4,
    expansionFactor: 2,
  );

  late final ctrl = Get.find<BannerCtrl>();

  @override
  void initState() {
    super.initState();

    ctrl.doRefresh();

    final controller = ctrl.controller;

    bindWorker(
      ever(
        showRx,
        (b) => (b ? controller.startAutoPlay : controller.stopAutoPlay).call(),
        condition: () => ctrl.dataRx.isNotEmpty,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Obx(
      () {
        final data = ctrl.autoGet();

        return data.isEmpty
            ? Spacing.blank
            : RepaintBoundary(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CarouselSlider.builder(
                      carouselController: ctrl.controller,
                      options: options,
                      itemCount: data.length,
                      itemBuilder: (_, i, __) => itemBuilder(data[i]),
                    ),
                    Positioned(
                      bottom: 12,
                      child: Obx(
                        () => AnimatedSmoothIndicator(
                          activeIndex: indexRx(),
                          count: data.length,
                          effect: dotsEffect,
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );

    child = VisibilityDetector(
      key: const Key('轮播'),
      child: child,
      onVisibilityChanged: (it) => showRx(it.visibleFraction > 0),
    );

    child = Padding(
      padding: const Pad(horizontal: 5),
      child: child,
    );

    return child;
  }

  Widget itemBuilder(Map data) {
    Widget child = NetImage(data['image'], fit: BoxFit.cover, toProvider: const ImageToWebp());

    child = Container(
      width: double.infinity,
      margin: const Pad(horizontal: 5),
      clipBehavior: Clip.hardEdge,
      decoration: const ShapeDecoration(shape: AppShape.a12),
      child: child,
    );

    child = OpacityButton(
      child: child,
      onTap: () {
        Get.to(() => WebPage(title: data['title'], uri: Uri.parse(data['url'])));
      },
    );

    return child;
  }
}
