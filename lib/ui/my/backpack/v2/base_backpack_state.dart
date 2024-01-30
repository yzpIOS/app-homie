
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

        if(needActionView())
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

  bool needActionView() => true;

  Widget createTabView(Map data);

  Widget $ActionView(Map<int, DateItem> data);
}

typedef GoodsApi = Future Function({List categories});
