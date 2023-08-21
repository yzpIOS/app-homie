import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/shop/shop_view_header.dart';
import 'package:app/shop/widgets/hold_future.dart';
import 'package:app/shop/widgets/shop_tab_bar.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/shop_category_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/dressup/my_cloth_tab_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

typedef Category = (int? id, String title, (String? icon, String? icon2));

class HomeShopAndDressUpView extends StatefulWidget {
  const HomeShopAndDressUpView({super.key});

  @override
  State<HomeShopAndDressUpView> createState() => _HomeShopAndDressUpViewState();
}

class _HomeShopAndDressUpViewState extends State<HomeShopAndDressUpView> with BusStateMixin {
  late final controller = Get.find<ClothSelectorCtrl>();

  @override
  void initState() {
    super.initState();

    on<GoWardrobeEvent>(
          (_) => controller.setWardrobeMode(true),
    );
  }

  late final children = [
    GetX<ShopCategoryCtrl>(
      builder: (it) {
        final data = <Category>[
          //const (null, '全部', (null, null)),
          ...it.autoGet.map((it) => (it['id'], it['name'], (it['icon'], it['select_icon']))),
        ];

        return DefaultTabController(
          length: data.length,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacing(height: 5, flex: null),
              $TabBar(data),
              Expanded(child: $TabBarView(data)),
            ],
          ),
        );
      },
    ),
    //----------//
    DelayView(builder: (_) => const MyClothTabView()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyModelView(),
        Expanded(
          child: HoldRoot(
            child: Obx(
                  () => IndexedStack(index: controller.isShopMode ? 0 : 1, children: children),
            ),
          ),
        ),
      ],
    );
  }

  Widget $TabBar(List<Category> data) {
    //data.skip(1)
    final tabs = data.map((it) {
      final (_, title, icon) = it;

      return (b) {
        return ShopTab(
          title: title,
          icon: NetImage(b ? icon.$2 : icon.$1, fit: BoxFit.contain),
        );
      };
    });

    return ShopTabBar(
      tabs: tabs,
      // beforeTab: Box(
      //   //跟装扮里面的MY图标一样宽
      //   width: 46,
      //   height: 46,
      //   alignment: Alignment.center,
      //   child: XText(data.first.$2, style: const TextStyle(fontSize: 16)),
      // ),
    );
  }

  Widget $TabBarView(List<Category> data) {
    return ConfigListState(
      buildNoMoreView: ([_]) => Spacing.blank,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: data //
            .map((it) => _DataView(categoryId: it.$1))
            .toList(growable: false),
      ),
    );
  }
}

class _DataView extends StatefulWidget {
  final int? categoryId;

  const _DataView({this.categoryId});

  @override
  State<_DataView> createState() => _DataViewState();
}

class _DataViewState extends SimplePageState<Map, _DataView> {
  late final myInfo = Get.find<MyInfoCtrl>().dataRx;
  late final selectorCtrl = Get.find<ClothSelectorCtrl>();
  late final selector = selectorCtrl.selectorShop;

  @override
  BaseConfig get config {
    const count = 2;
    const space = 5.0;

    return GridConfig(
      padding: const Pad(horizontal: space * 2, vertical: 5),
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        mainAxisSpacing: space,
        crossAxisSpacing: space,
        mainAxisExtent: (AppSize.width - (3 * space + 4 * space)) / 3.5,
      ),
    );
  }

  StreamSubscription? streamSubscription = null;
  static bool needDoRefresh = false;

  @override
  void didUpdateWidget(covariant _DataView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (needDoRefresh == false) {
      needDoRefresh = true;
      return;
    }
    debugPrint("didUpdateWidget categoryId = ${widget.categoryId}");
    streamSubscription?.cancel();
    streamSubscription = Future.delayed(const Duration(milliseconds: 200)).asStream().listen((event) {
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
    return Api.Shop.productList(page: page, categoryId: widget.categoryId, gender: myInfo().gender);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final productId = item['id'];
    // 放在这里吧？
    Get.find<ShopCategoryCtrl>().sendItems(productId);

    return HoldView(
      child: _ItemView(
        key: ValueKey(productId),
        data: item,
      ),
      builder: (Object? taskId, DoHold doHold, child) {
        return GestureDetector(
          onTap: taskId != null ? null : () => doHold(productId, selector.doSelect(item)),
          child: Obx(
                () {
              final isSelected = selector.isRxSelected(productId);

              return DecoratedBox(
                decoration: ShapeDecoration(
                  shape: XRectangleBorder(
                    borderRadius: AppBorderRadius.a10,
                    side: isSelected
                        ? const BorderSide(width: 2, color: AppPalette.primary)
                        : (taskId == productId ? const BorderSide(width: 2, color: AppPalette.hint) : BorderSide.none),
                  ),
                  color: const Color(0xFFF5F5F5),
                ),
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}

class _ItemView extends StatelessWidget {
  final Map data;

  const _ItemView({super.key, required this.data});


  @override
  Widget build(BuildContext context) {
    final type = MoneyType.fromVal(data['currency']);

    Widget child = LayoutBuilder(
      builder: (_, c) {
        final w = c.maxWidth;
        final h = c.maxHeight;

        return XFrameWidget(
          width: w,
          height: h,
          child: NetImage(data['image'], width: w, height: h),
        );
      },
    );

    var itemBuyAble = true;
    if (data case {'label_list': List items}) {
      if (items.isNotEmpty) {
        // 不能购买
        itemBuyAble = items.isNotEmpty && items[0]["is_buy"] == true;
        child = Stack(
          children: [
            child,
              // 普通左上角的商品角标
              if(items.isNotEmpty && items[0]["is_buy"] == true)
                Positioned(
                  top: 5,
                  left: 5.0,
                  child: NetImage(items[0]['icon'], width: 32, height: 16, fit: BoxFit.contain),
                ),
          ],
        );
      }
    }

    child = BlankImgState(child: child);

    child = Column(
      children: [
        Expanded(child: child),
        XText(data['name']),
        // 可以购买，显示价格
        if(itemBuyAble)
          XRichText(
            TextSpan(
              children: [
                if (type != null)
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: MoneyIcon(type: type, size: 20),
                  ),
                TextSpan(text: '${data['price']}'),
              ],
            ),
          ),

        // 不能购买
        // label_list内增加is_buy字段，用于声明该商品是否可以加入购物车并购买
        if(!itemBuyAble)
          Align(
            alignment: Alignment.bottomCenter,
            child: Positioned(
              child: NetImage(data["label_list"][0]['icon'], fit: BoxFit.contain),
            ),
          ),
        Spacing.h2,
      ],
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: Colors.black),
      child: child,
    );

    return child;
  }
}
