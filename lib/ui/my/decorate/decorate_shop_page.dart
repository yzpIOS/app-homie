
import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/my/decorate/purchase_decorate_sheet.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';
import 'package:app/widgets.dart';
import 'package:dartz/dartz.dart' as T;
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

typedef ItemFactory = Widget Function(String title);

///
/// 2D商城；装扮页面
///
class DecorateShopPage extends StatefulWidget {

  const DecorateShopPage({super.key});

  @override
  _DecorateShopState createState() => _DecorateShopState();
}

class _DecorateShopState extends State<DecorateShopPage> with SingleTickerProviderStateMixin {

  final data = RxMap<String, Map>();

  // 当前
  final selectedItem = RxMap<int, Map>();

  TabController? controller;

  // 当前选择的tab
  RxInt curSelectIndex = RxInt(0);

  // 点击tab时，锁住不给滚动
  bool canMove = true;

  // 滚动
  ScrollController scrollController = ScrollController();
  List<T.Tuple2<String, GlobalKey>> titles = [];


  GlobalKey scrollViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();


    requestTypes();

    scrollController.addListener(() {
      if(!canMove) {
        return;
      }
      int preIndex = 0;
      RenderBox? parent = scrollViewKey.currentContext?.findRenderObject() as RenderBox?;

      for(int index = 0; index < titles.length; index ++) {

        RenderBox? child = titles[index].value2.currentContext?.findRenderObject() as RenderBox?;

        Offset? childOffset = child?.localToGlobal(Offset.zero);
        if(childOffset != null) {
          //convert
          Offset? childRelativeToParent = parent?.globalToLocal(childOffset);
          // debugPrint("数据异常[${titles[index].value1}]: offSetX = ${childRelativeToParent?.dx}, "
          //     "offSetY = ${childRelativeToParent?.dy}");
          if((childRelativeToParent?.dy ?? -1) >= 0.0) {
            break;
          }
          preIndex = index;
        }
      }
      if(controller?.index != preIndex) {
        controller?.animateTo(preIndex);
      }
    });
  }

  void requestTypes() {
    Api.Shop.get2DGoods().then((value) {
      //debugPrint("aa");
      data.clear();
      (value as List).forEach((element) {
        if(((element["product_item_list"] as List?)?.length ?? 0) > 0) {
          data[element["category_name"]] = element;
        }
      });
      controller = TabController(vsync: this, length: data.length);
      controller?.addListener(() {
        curSelectIndex.value = controller?.index ?? 0;
      });
      data.refresh();
    }).onError((error, stackTrace) {
      showToast('服务异常');
      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: "装扮商城"),
      bottomNavigationBar: createBottomBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 10,),
          createTab(),

          Obx(() {
            var inerDagta = data.value;
            return Expanded(
              child: createItem(inerDagta),
            );
          })
        ],
      ),
    );
  }

  ///
  /// 创建tab
  ///
  Widget createTab() {
    return Container(
      height: 30,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 7),
      child: Obx(() {
        if(data.keys.isEmpty) {
          return SizedBox();
        }
        var children = <Widget>[];
        var items = data.keys.toList();
        for(int index = 0; index < items.length; index ++) {
          children.add(createTabItem(index, items[index]));
        }

        return xAppBar$TabBar(
            data.keys,
            controller: controller,
            alignment: Alignment.centerLeft,
            needPadding: false,
            needDownLine: false,
            isScrollable: true,
            fontSize: 12,
            height: 23,
            labelPadding: 5,
            kItemHeight: 23,
            decoration: const BoxDecoration(),
            indicatorColor: AppPalette.sheetWhite,
            labelColor:const T.Tuple2(Colors.white, Color(0XFF666666)),
            tabManufacture: children
        );
      }),
    );
  }

  Widget createTabItem(int index, String title) {
    return GestureDetector(
      onTap: () {
        RenderBox? parent = scrollViewKey.currentContext?.findRenderObject() as RenderBox?;
        RenderBox? child = titles[index].value2.currentContext?.findRenderObject() as RenderBox?;
        Offset? childOffset = child?.localToGlobal(Offset.zero);
        if(childOffset != null) {
          Offset? childRelativeToParent = parent?.globalToLocal(childOffset);
          if(childRelativeToParent != null) {
            scrollController.animateTo(childRelativeToParent.dy + scrollController.offset,
                duration: const Duration(milliseconds: 10), curve: Curves.linear);

            canMove = false;
            Future.delayed(const Duration(milliseconds: 50)).whenComplete(() {
              canMove = true;
              curSelectIndex.value = index;
            });
          }
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Obx(() {
        var localIndex = curSelectIndex.value;
        return Container(
          constraints: BoxConstraints(minWidth: 30, maxHeight: 23, minHeight: 23),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: localIndex == index ? BoxDecoration(
              color: AppPalette.primary,
              borderRadius: BorderRadius.circular(100)
          ) : BoxDecoration(
              color: const Color(0xFFE9E9E9),
              borderRadius: BorderRadius.circular(100)
          ),

          child: Text(
            title,
            style: TextStyle(
                color: localIndex == index ? Colors.white : Color(0xFF6C6C6C),
                fontWeight: FontWeight.normal,
                fontSize: 12
            ),
          ),
        );
      }),
    );
  }

  Widget createItem(Map data) {
    List datas = data.keys.toList();

    return CustomScrollView(
      key: scrollViewKey,
      controller: scrollController,
      slivers: datas.map((e) {
        return SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 两个类别的间距
              datas.indexOf(e) == 0 ? SizedBox(height: 22,) : SizedBox(height: 15,),
              // 标题
              createNavigator(e),
              SizedBox(height: 10,),
              // 表格处理
              createGrid(data[e]),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget createNavigator(String title) {
    titles.removeWhere((element) => element.value1 == title);
    var globalKey = GlobalKey(debugLabel: title);
    titles.add(T.Tuple2(title, globalKey));

    return Row(
      key: globalKey,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 11,),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 15
            ),
          ),
        ),
        SizedBox(width: 11,),
      ],
    );
  }

  ///
  /// 商品列表
  ///
  Widget createGrid(Map data) {
    List items = data["product_item_list"];
    if(items.isEmpty) {
      return SizedBox();
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          childAspectRatio: 0.65
        ),
        itemBuilder: (context, index) {
          // 单个商品item
          return GestureDetector(
            onTap: () async {
              await PurchaseDecorateSheet.show(items[index]);

              WalletCtrl.ins.doRefresh();
            },
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 图标
                NetImage(items[index]["icon"], width: 117, height: 121,),

                // 名字
                Text(
                  items[index]["name"],
                  style: TextStyle(
                      color: AppPalette.txtDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                  ),
                ),
                // 价格
                SizedBox(height: 5,),
                createPrize(items[index]["sku_list"], items[index]["label_list"]),
              ],
            ),
          );
        }
      ),
    );
  }

  ///
  /// 每个item下的价格
  ///
  Widget createPrize(List? skuList, List? label_list) {
    // 活动获得
    if (label_list != null && label_list.isNotEmpty) {
      bool itemBuyAble = label_list.isNotEmpty && label_list[0]["is_buy"] == true;
      if(!itemBuyAble) {
        return createActivity();
      }
    }

    if(skuList == null || skuList.isEmpty) {
      return SizedBox();
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MoneyIcon(type: MoneyType.diamond, size: 16),
        SizedBox(width: 2,),
        Text(
          skuList.first["price"].toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppPalette.txtDark,
            fontSize: 12,
            fontWeight: FontWeight.w700
          ),
        )
      ],
    );
  }

  ///
  /// item下的活动
  ///
  Widget createActivity() {
    return Container(
      width: 50,
      height: 21,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFFFEBF3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "活动获得",
        style: TextStyle(
          color: Color(0xFFFF569D),
          fontWeight: FontWeight.w700,
          fontSize: 10
        ),
      ),
    );
  }

  ///
  /// 整个界面底部的余额显示
  ///
  Widget createBottomBar() {
    return Container(
      height: 87,
      color: Color(0xFFEBEBFF),
      padding: EdgeInsets.only(bottom: 10, left: 11, right: 11),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "余额：",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppPalette.txtDark,
            ),
          ),

          Expanded(child: SizedBox()),

          // 紫砖
          GestureDetector(
            onTap: () {
              Get.to(() => RechargePage(hasShowUnityView: false,));
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                // 紫砖
                SizedBox(
                  height: 26,
                  width: 26,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        left: 12,
                        top: 3,
                        bottom: 3,
                        child: Container(color: Color(0xFFC1C1C1)),
                      ),
                      Positioned.fill(
                        child: MoneyIcon(type: MoneyType.diamond, size: 50),
                      ),
                    ],
                  ),
                ),

                // 金额
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFFC1C1C1),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 5,),
                      WalletCtrl.use(
                        builder: (it) {
                          return XText(
                            '${it[MoneyType.diamond] ?? '--'}',
                            style: const TextStyle(fontSize: 13, color: AppPalette.txtDark, fontWeight: fw$SemiBold),
                          );
                        },
                      ),
                      // 充值
                      SizedBox(width: 8,),
                      Image.asset(IMG.format("my/charge_add"), width: 17, height: 17,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}