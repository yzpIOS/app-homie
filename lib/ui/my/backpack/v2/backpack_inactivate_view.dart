
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/my/backpack/v2/base_backpack_state.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../common/theme.dart';

class BackPackInActivateView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _BackPackInActivateState();
}

class _BackPackInActivateState extends BaseBackPackState<BackPackInActivateView> {

  _BackPackInActivateState():super([{"category":[1, 2], "name":"衣柜"}]);

  @override
  Widget createTabView(Map data) {
    return Obx(() {
      var test = selectRx.value;
      return Column(
        children: [
          Expanded(
            child: InactiveBackPackDataView2(
              api: Api.DressUp.backpackList2,
              category: data,
              padding: Pad(
                  horizontal: 10,
                  top: 0,
                  bottom: 0
              ),
              selectRx: selectRx,
            ),
          ),
          Text(test.isNotEmpty ? "": ""),
        ],
      );
    });
  }


  @override
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

}



class InactiveBackPackDataView2 extends StatelessWidget {

  final Pad? padding;

  final RxMap<int, DateItem> selectRx;

  GoodsApi api;

  Map category;

  Function(int productId)? callBack;

  InactiveBackPackDataView2({
    required this.padding,
    required this.api,
    required this.category,
    required this.selectRx,
    this.callBack,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: FutureBuilder(
          future: api(category["name"] == "衣柜" ? "group_id_list" : "category_id_list", categories: category["category"]),
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
                mainAxisSpacing: 9,
                crossAxisSpacing: 8,
              ),
              itemCount: data?.length ?? 0,
              itemBuilder: (_, i) => _ItemView(data: data?[i] ?? {}, selectRx: selectRx, callBack: callBack,),
            );
          }
      ),
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
    double size = 70;

    final imageView = BlankImgState(
      child: NetImage(data['image']),
    );

    final nameView =  Container(
      decoration: const BoxDecoration(
          color: Color(0xFFEBEBFF),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          )
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
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 1.5,),
            Image.asset(IMG.format("my/icon_sj"), width: 12, height: 12,),
          ],
        ),
        SizedBox(width: 1,),
        Text(
          data["effective_time_txt"],
          style: TextStyle(
              fontSize: 11,
              color: Color(0xFF999999),
              fontWeight: FontWeight.normal
          ),
        )
      ],
    );

    Widget child = Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 30,
            child: Center(child: SizedBox(width: size, height: size, child: imageView,),)
        ),
        Positioned(left: 1, top: 0, child: countView),
        Positioned(left: 0, right: 0, bottom: 0, height: 22, child: nameView),

        if(effective_time.isNotEmpty)
          Positioned(
            right: 3,
            bottom: 22,
            height: 15,
            child: leftTime,
          ),

        // label图片
        if (data case {'label_list': List items})
          for (var i = 0; i < items.length; ++i)
            Positioned(
              top: (i + 1) * 16 + 2,
              left: 0,
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
            color: Color(0xFFEBEBFF),
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

