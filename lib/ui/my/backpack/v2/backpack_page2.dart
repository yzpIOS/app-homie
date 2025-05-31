
import 'package:app/common/theme.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/my/backpack/v2/backpack_activate_view.dart';
import 'package:app/ui/my/backpack/v2/backpack_inactivate_view.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' as T;
import 'package:app/store/my_wardrobe_ctrl.dart';
import 'package:app/tools.dart';

class BackpackPage2 extends StatefulWidget {
  const BackpackPage2({super.key});

  @override
  State<BackpackPage2> createState() => _BackpackPageState();
}


class _BackpackPageState extends State<BackpackPage2> with SingleTickerProviderStateMixin {

  final data = <String, Widget>{};

  late TabController  controller;

  int curSelectIndex = 0;

  late final wardrobeCtrl = Get.find<MyWardrobeCtrl>();

  @override
  void initState() {
    super.initState();
    // 未使用的
    // http://192.168.1.156:20000/project/15/interface/api/746
    // group_id_list: [3]

    // http://192.168.1.156:20000/project/15/interface/api/741
    // category_id_list:[上面的id]

    // 己使用的
    // http://192.168.1.156:20000/project/15/interface/api/736
    // category_id_list:[上面的id]

    data["未激活"] = BackPackInActivateView();
    data["己使用"] = BackPackActivateView();
    controller = TabController(vsync: this, length: data.length);
    controller.addListener(() {
      curSelectIndex = controller.index;
      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    var items = data.keys.toList();
    for(int index = 0; index < items.length; index ++) {
      children.add(Text(
        items[index],
        style: TextStyle(
            color: curSelectIndex == index ? Color(0xFFB97BE6) : Color(0xFF6C6C6C),
            fontSize: 16
        ),
      ));
    }

    return Scaffold(
      appBar: xAppBar(title: "我的装扮"),
      // bottomNavigationBar: $ActionView(selectRx),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          xAppBar$TabBar(
            data.keys,
            controller: controller,
            alignment: Alignment.center,
            fontSize: 16,
            height: 30,
            labelPadding: 30,
            kItemHeight: 23,
            horizonPadding: 20,
            isScrollable: false,
            needPadding: false,
            useDecoration: false,
            tabManufacture: children,
          ),

          SizedBox(height: 12,),

          Expanded(
            child: TabBarView(
              controller: controller,
              children: data.values.toList(),
            )
          ),
        ],
      ),
    );
  }


  Widget $ActionView(Map<int, DateItem> data) {
    final agg = <int, num>{};

    for (final item in data.values) {
      final k = item.value2['currency'];
      final v = item.value2['price'];

      final _v = agg[k];

      if (_v is num) {
        agg[k] = _v + v;
      } else {
        agg[k] = v;
      }
    }

    Widget child = Padding(
      padding: const Pad(top: 30),
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 16, color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
    );

    child = Padding(padding: const Pad(horizontal: 20), child: child);

    return child;
  }
}