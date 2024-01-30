

import 'dart:ffi';

import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/backpack/v2/base_backpack_state.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

typedef WareDrawApi = Future Function({required PageNum page, int? categoryId});

class BackPackActivateView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _BackPackActivateState();
}

class _BackPackActivateState extends BaseBackPackState<BackPackActivateView> {

  var refreshFlag = RxBool(false);

  _BackPackActivateState():super([]);

  @override
  Widget createTabView(Map data) {
    return Obx(() {
      var test = refreshFlag.value;
      return Column(
        children: [
          Expanded(
            child: ActiveBackPackDataView2(
              api: Api.DressUp.myList,
              category: data,
              padding: Pad(
                  horizontal: 10,
                  top: 0,
                  bottom: 0
              ),
              selectRx: selectRx,
              callBack: (productId) {
                debugPrint("选择发生变化: data = ${data.toString()}");
                CommonDialog.useImmediate(() async {
                  await Api.DressUp.dressUp2(productId);
                  refreshFlag.value = !refreshFlag.value;
                });
              },
            ),
          ),
          Text(test ? "": ""),
        ],
      );
    });
  }
  @override
  bool needActionView() => false;

  @override
  Widget $ActionView(Map<int, DateItem> data) {
    return SizedBox();
  }
}


class ActiveBackPackDataView2 extends StatelessWidget {

  final Pad? padding;

  final RxMap<int, DateItem> selectRx;

  Map category;

  WareDrawApi api;

  Function(int productId)? callBack;

  ActiveBackPackDataView2({
    required this.padding,
    required this.category,
    required this.selectRx,
    required this.api,
    this.callBack,
  });

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: api(page: PageNum(size: 999),
            categoryId: (category["category"] as List).first as int),
        builder: (contenxt, snap) {
          if(snap.data == null) {
            return const TipsView();
          }
          final data = snap.data["items"];
          if(data == null || data.length <= 0) {
            return const TipsView();
          }
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
            itemBuilder: (_, i) => _ItemView(data: data?[i] ?? {}, selectRx: selectRx, callBack: callBack,),
          );
        }
    );
  }
}

class _ItemView extends StatelessWidget {
  final DateItem data;
  final RxMap<int, DateItem> selectRx;

  Function(int productId)? callBack;

  _ItemView({required this.data, required this.selectRx, this.callBack});

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

    var is_dress_up = data["is_dress_up"] ?? false;

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
        '使用中',
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
          data["effective_time_txt"] ?? "",
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
        if(is_dress_up)
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
        if(callBack != null) {
          callBack?.call(data[idKey]);
          return;
        }
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

