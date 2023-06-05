import 'package:app/event/event.dart';
import 'package:app/shop/cart_mini_view.dart';
import 'package:app/shop/home_shop_and_dressup_view.dart';
import 'package:app/shop/shop_view_best.dart';
import 'package:app/store/intro_ctrl.dart';
import 'package:app/store/shop_category_ctrl.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/intro/shop_intro_overlay.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/x_page_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeShopPage extends StatefulWidget {
  const HomeShopPage({super.key});

  @override
  State<HomeShopPage> createState() => _HomeShopPageState();
}

class _HomeShopPageState extends State<HomeShopPage> with BusStateMixin, OverlayMixin {
  late final cartCtrl = Get.find<ShoppingCartCtrl>();

  late final pageCtrl = PageController();
  late final page = <Widget Function(ScrollController)>[
    (_) => $ShopAndDressUpView(),
    // ShopViewCombo.new,
    ShopViewBest.new,
  ];

  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();

    Get.find<ShopCategoryCtrl>().doRefresh();
    // Get.find<ShopRecommendCtrl>().doRefresh();
    cartCtrl.doRefresh();

    on<GoDressUpEvent>(
      (_) => pageCtrl.jumpToPage(0),
    );

    on<GoWardrobeEvent>(
      (_) => pageCtrl.jumpToPage(0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UiOverlayRegion.dark(
      child: Stack(
        children: [
          XPageView(controller: pageCtrl, itemCount: page.length, itemBuilder: itemBuilder),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: $CartMiniView(),
          ),
        ],
      ),
    );
  }

  Widget $ShopAndDressUpView() {
    return VisibilityDetector(
      key: _key,
      child: const HomeShopAndDressUpView(),
      onVisibilityChanged: (it) => cartCtrl.showCarRx(it.visibleFraction == 0),
    );
  }

  Widget $CartMiniView() {
    return Obx(
      () => cartCtrl.showCarRx() && cartCtrl.autoGet.isNotEmpty ? const CartMiniView() : Spacing.blank,
    );
  }

  Widget itemBuilder(_, ScrollController scroll, int i) {
    final child = page[i](scroll);

    return DelayView(
      fraction: 0.1,
      fadeIn: i != 0,
      keepAlive: true,
      builder: (_) => child,
    );
  }

  @override
  late List<XOverlayWidget> overlay = [
    if (!Get.find<IntroCtrl>().isMarked('ShopIntroOverlay'))
      XOverlayWidget(
        uniqueKey: 'ShopIntroOverlay',
        rootOverlay: true,
        child: ShopIntroOverlay(),
      ),
  ];
}
