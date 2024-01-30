
import 'package:app/common/theme.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/net/api.dart';
import 'package:app/store/my_wardrobe_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import '../v1/backpack_view_wardrobe.dart';
typedef DateItem = Map;

abstract class BaseBackPackState<T extends StatefulWidget> extends State<T> with SingleTickerProviderStateMixin {

  // 当前选中的index
  RxInt curSelectIndex = RxInt(0);

  // 对应的tabView
  final tabViews = RxMap<String, Widget>();

  // 选中的商品
  late final selectRx = RxMap<int, DateItem>();

  final List<Map> defaultTab;

  late TabController  controller;

  late final wardrobeCtrl = Get.find<MyWardrobeCtrl>();

  BaseBackPackState(this.defaultTab);

  @override
  void initState() {
    super.initState();

    wardrobeCtrl.doRefresh();
    requestCategoryList();
  }

  void requestCategoryList() {
    Api.Shop.categoryList_(groupId: [3]).then((value) {
      tabViews.clear();
      var list = (value as List?) ?? [];

      // 默认分类
      defaultTab.forEach((element) {
        tabViews[element["name"]] = createTabView(element);
      });

      // 服务端传过来的分类
      list.forEach((element) {
        element["category"] = [element["id"]];
        tabViews[element["name"]] = createTabView(element);
      });

      // 滚动监听
      controller = TabController(vsync: this, length: tabViews.length);
      controller.addListener(() {
        curSelectIndex.value = controller.index;
      });


      tabViews.refresh();
    }).onError((error, stackTrace) {
      showToast("服务接口报错");
      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        createTab(),
        Obx(() {
          if(tabViews.isEmpty) {
            return SizedBox();
          }
          return Expanded(
              child: TabBarView(
                controller: controller,
                children: tabViews.values.toList(),
              )
          );
        }),

        Obx(() {
          return $ActionView(selectRx);
        })
      ],
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
        if(tabViews.isEmpty) {
          return SizedBox();
        }
        var children = <Widget>[];
        var keyList = tabViews.keys.toList();
        for(int index = 0; index < keyList.length; index ++) {
          children.add(createTabItem(index, keyList[index]));
        }

        return xAppBar$TabBar(
            [],
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
            labelColor:const Tuple2(Colors.white, Color(0XFF666666)),
            tabManufacture: children
        );
      }),
    );
  }

  Widget createTabItem(int index, String title) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          curSelectIndex.value = index;
          controller.animateTo(index);
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 23,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: curSelectIndex.value == index ? BoxDecoration(
              color: AppPalette.primary,
              borderRadius: BorderRadius.circular(5)
          ) : BoxDecoration(
              color: const Color(0xFFE9E9E9),
              borderRadius: BorderRadius.circular(5)
          ),

          child: Text(
            title,
            style: TextStyle(
                color: curSelectIndex.value == index ? Colors.white : Color(0xFF6C6C6C),
                fontWeight: FontWeight.normal,
                fontSize: 12
            ),
          ),
        ),
      );
    });
  }


  Widget $ActionView(Map<int, DateItem> data) {
    if(data.isEmpty) {
      return SizedBox();
    }

    final agg = <int, num>{};

    for (final item in data.values) {
      final k = item['currency'];
      final v = item['price'];

      final _v = agg[k];

      if (_v is num) {
        agg[k] = _v + v;
      } else {
        agg[k] = v;
      }
    }

    return Container(
      color: Color(0xFFEBEBFF),
      height: 88,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 价格
          SizedBox(width: 35,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                XText(
                  '共${data.length}件商品',
                  style: const TextStyle(fontWeight: fw$Medium),
                ),
                Spacing.h4,
                XRichText(
                  TextSpan(
                    children: [
                      const TextSpan(text: '总价值'),
                      ...agg.entries.expand((it) {
                        final type = MoneyType.fromVal(it.key);

                        return [
                          TextSpan(text: '\t${it.value}'),
                          if (type != null)
                            WidgetSpan(
                              child: MoneyIcon(type: type, size: 24),
                              alignment: PlaceholderAlignment.middle,
                            ),
                        ];
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              wardrobeCtrl.doGive(
                ids: data.keys.toList(),
                callback: selectRx.clear,
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 66,
              height: 29,
              decoration: BoxDecoration(
                color: Color(0XFFBD7BE5),
                borderRadius: BorderRadius.circular(100),
              ),
              margin: EdgeInsets.only(right: 13),
              alignment: Alignment.center,
              child: Text(
                "赠送",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),


          GestureDetector(
            onTap: () {
              wardrobeCtrl.doUse(
                ids: data.keys.toList(),
                callback: (_) => selectRx.clear(),
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 66,
              height: 29,
              decoration: BoxDecoration(
                color: Color(0XFFBD7BE5),
                borderRadius: BorderRadius.circular(100),
              ),
              margin: EdgeInsets.only(right: 13),
              alignment: Alignment.center,
              child: Text(
                "使用",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                ),
              ),
            ) ,
          ),
        ],
      ),
    );
  }

  Widget createTabView(Map data);
}

typedef GoodsApi = Future Function({List categories});

class BackPackDataView2 extends StatelessWidget {

  final Pad? padding;

  final RxMap<int, DateItem> selectRx;

  GoodsApi api;

  Map category;

  BackPackDataView2({required this.padding, required this.api, required this.category, required this.selectRx});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: api(categories: category["category"]),
      builder: (contenxt, snap) {
        if(snap.data == null || (snap.data?.length ?? 0) <= 0) {
          return const TipsView();
        }
        final data = snap.data;
        return GridView.builder(
          padding: padding,
          gridDelegate: XGridDelegate(
            childAspectRatio: 112.toDouble() / 116.toDouble(),
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            fixedHeight: 22,
          ),
          itemCount: data?.length ?? 0,
          itemBuilder: (_, i) => _ItemView(data: data?[i] ?? {}, selectRx: selectRx),
        );
      }
    );
  }
}

class _ItemView extends StatelessWidget {
  final DateItem data;
  final RxMap<int, DateItem> selectRx;

  _ItemView({required this.data, required this.selectRx});

  final idKey = "product_id";

  @override
  Widget build(BuildContext context) {

    final imageView = Box(
      padding: const Pad(top: 4, bottom: 8),
      width: 70,
      height: 70,
      child: BlankImgState(
        child: NetImage(data['image'], width: 70, height: 70,),
      ),
    );

    final nameView = DecoratedBox(
      decoration: const ShapeDecoration(
        shape: XRectangleBorder(borderRadius: AppBorderRadius.b8),
        gradient: LinearGradient(
          colors: [Color(0xFFB7E0FC), Color(0xFFE1F3FF), Color(0xFFB7E0FC)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          XText(
            data['name'],
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          if(data["gender"] == 1 || data["gender"] == 2)
            Image.asset(IMG.format(data["gender"] == 1 ? "my/icon_nan" : "my/icon_nv"), width: 20, height: 20,)
        ],
      ),
    );

    final countView = Container(
      constraints: BoxConstraints(minWidth: 35, minHeight: 16),
      decoration: BoxDecoration(
        color: Color(0xFF27E4BB),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0)
        )
      ),
      alignment: Alignment.center,
      child: XText(
        'X${data["count"] ?? 0}',
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );

    var effective_time = data["effective_time_txt"]?.toString() ?? "";

    Widget leftTime = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(IMG.format("my/icon_sj"), width: 12, height: 12,),
        SizedBox(width: 1,),
        Text(
          data["effective_time_txt"],
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF999999),
            fontWeight: FontWeight.normal
          ),
        )
      ],
    );

    Widget child = Stack(
      children: [
        Positioned(top: 0, left: 0, right: 0, bottom: 22, child: imageView),
        Positioned(left: 1, top: 0, child: countView),
        Positioned(left: 0, right: 0, bottom: 0, height: 22, child: nameView),

        if(effective_time.isNotEmpty)
          Positioned(
            right: 3,
            bottom: 25,
            height: 11,
            child: leftTime,
          ),

        // label图片
        if (data case {'label_list': List items})
          for (var i = 0; i < items.length; ++i)
            Positioned(
              top: 5,
              left: 5.0 * (i + 1) + 32 * i,
              child: NetImage(items[i]['icon'], width: 32, height: 16, fit: BoxFit.contain),
            ),
      ],
    );

    child = GestureDetector(
      onTap: () {
        // 取消选择
        if(selectRx.containsKey(data[idKey])) {
          selectRx.clear();
          return;
        }
        selectRx.clear();
        selectRx[data[idKey]] = data;
        // if (!selectRx.containsKey(data[idKey])) {
        //   selectRx[data[idKey]] = data;
        // } else {
        //   selectRx.remove(data[idKey]);
        // }
        // debugPrint("aaa");
      },
      behavior: HitTestBehavior.opaque,
      child: child,
    );

    return Obx(() {
      var selected = selectRx.containsKey(data[idKey]);
      final _decor = BoxDecoration(
        borderRadius: AppBorderRadius.a10,
        border: selectRx.containsKey(data[idKey])
            ? const Border.fromBorderSide(
          BorderSide(
            width: 2,
            color: AppPalette.primary,
          ),
        )
            : const Border.fromBorderSide(
          BorderSide(
            width: 2,
            color: Color(0xFFE8F5FF),
          ),
        ),
      );

      return AnimatedContainer(
          duration: kTabScrollDuration,
          curve: Curves.easeOutCubic,
          decoration: _decor,
          child: child
      );
      },
    );
  }
}
