import 'package:app/common/theme.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/net/api.dart';
import 'package:app/store/my_wardrobe_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

typedef DateItem = Tuple2<RxInt, Map>;

class BackpackView$Gift extends StatefulWidget {

  const BackpackView$Gift({super.key});

  @override
  State<BackpackView$Gift> createState() => _BackpackView$GiftState();
}

class _BackpackView$GiftState extends State<BackpackView$Gift> {


  late final selectRx = RxMap<int, Map>();

  late final wardrobeCtrl = Get.find<MyWardrobeCtrl>();

  // 数据列表
  var dataNotifier = RxList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: "我的背包"),
      body: Container(
        margin: EdgeInsets.only(
          left: 12,
          right: 12,
          top: 17
        ),
        child: _BackpackView$Gift(selectRx, dataNotifier),
      ),
      bottomNavigationBar: $ActionView(),
    );
  }


  @override
  Widget $ActionView() {


    return Obx(() {
      // 选中的商品
      var selectData = selectRx.value;
      if(selectData.isNotEmpty) {
        return createSelectedWidget(selectData);
      }

      // 所有商品列表
      var data = dataNotifier.value;
      if(data.isNotEmpty) {
        return _createNotSelectValues(data);
      }

      // 所有数据为空
      return SizedBox();
    });
  }

  ///
  /// 选中商品时显示商品的价格
  ///
  Widget createSelectedWidget(Map<int, Map> selectRx) {
    final agg = <int, num>{};

    for (final item in selectRx.values) {
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
                  '共${selectRx.length}件商品',
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
                ids: selectRx.keys.toList(),
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
        ],
      ),
    );
  }

  Widget _createNotSelectValues(List data) {
    int total = 0;
    int totalValue = 0;
    data.forEach((element) {
      var curCount = element["count"] as int;

      total += curCount;
      totalValue += (curCount * (element["count"] as int));
    });
    return Container(
      height: 88,
      margin: EdgeInsets.only(left: 10, right: 10),
      alignment: Alignment.centerLeft,
      child: Text.rich(
          TextSpan(
              children: [
                TextSpan(
                    text: "共",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                    text: "$total",
                    style: TextStyle(
                        color: Color(0xffBD7BE5),
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                    text: "件商品，总价值",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                    text: "$totalValue",
                    style: TextStyle(
                        color: Color(0xffBD7BE5),
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    )
                ),
                WidgetSpan(
                    child: MoneyIcon(size: 15, type: MoneyType.diamond,)
                )
              ]
          )
      ),
    );
  }
}


class _BackpackView$Gift extends SimpleDataView<Map>{

  final idKey = "id";

  late RxMap<int, Map> selectRx;

  late RxList items;

  _BackpackView$Gift(this.selectRx, this.items);

  @override
  BaseConfig? get config {
    return GridConfig(
      gridDelegate: XGridDelegate(
        childAspectRatio: 112.toDouble() / 116.toDouble(),
        crossAxisCount: 3,
        mainAxisSpacing: 9,
        crossAxisSpacing: 8,
      ),
    );
  }

  @override
  Future fetch() async {
    var data = await Api.Gift.backpack();
    if(data["items"] != null) {
      items.value = data["items"];
    }
    return data;
  }

  @override
  Widget itemBuilder(BuildContext context, Map data, int index) {

    double size = 70;

    final imageView = BlankImgState(
      child: NetImage(data["cover"]),
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
            data['name'] ?? "",
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

    Widget leftTime;
    if(effective_time.isNotEmpty) {
      leftTime = Row(
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
    } else {
      leftTime = SizedBox();
    }

    Widget child = Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(top: 17, width: size, height: size, child: imageView),
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
