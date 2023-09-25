import 'package:app/event/event.dart';
import 'package:app/shop/cart_mini_view.dart';
import 'package:app/shop/home_shop_and_dressup_view.dart';
import 'package:app/shop/shop_view_best.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
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
  StreamSubscription? streamSubscription;
  bool modelSceneUnityLoadComplete = false;//商城模特unity界面是否加载完成

  late final clothSelectorCtrl = Get.find<ClothSelectorCtrl>();
  late final cartCtrl = Get.find<ShoppingCartCtrl>();

  late final pageCtrl = PageController();
  late final page = <Widget Function(ScrollController)>[
    (_) => shopAndDressUpView(),
    // ShopViewCombo.new,
    ShopViewBest.new,
  ];

  final _key = UniqueKey();

  @override
  void dispose() {
    super.dispose();
    streamSubscription?.cancel();
  }

  @override
  void initState() {
    super.initState();

    Get.find<ShopCategoryCtrl>().doRefresh();
    // Get.find<ShopRecommendCtrl>().doRefresh();
    cartCtrl.doRefresh();

    /// unity界面加载事件
    streamSubscription = Bus.on<LoadScene>((event) {
      modelSceneUnityLoadComplete = (event.sceneName == "ModelScene");
      if (modelSceneUnityLoadComplete && clothSelectorCtrl.needGoToMyWardrobe) {
        const GoWardrobeEvent().fire();
        clothSelectorCtrl.needGoToMyWardrobe = false;
      }
    });

    /// 我的页点击“我的装扮”，跳转“商城-我的-衣柜”事件
    on<GoDressUpEvent>(
      // (_) => pageCtrl.jumpToPage(0),
      (_) {
        if (modelSceneUnityLoadComplete) {
          const GoWardrobeEvent().fire();
          clothSelectorCtrl.needGoToMyWardrobe = false;
        } else {
          clothSelectorCtrl.needGoToMyWardrobe = true;
        }
      },
    );

    /// 点击“去使用”，跳转“商城-我的-衣柜”事件
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

  Widget shopAndDressUpView() {
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
