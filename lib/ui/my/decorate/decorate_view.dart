
import 'package:app/ui/main/nav_view.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/my_tab_indicator.dart';
import 'package:dartz/dartz.dart' as T;
import 'package:flutter/material.dart';


///
/// 装扮页面
///
class DecoratePage extends StatefulWidget {

  const DecoratePage({super.key});

  @override
  _DecorateState createState() => _DecorateState();
}

class _DecorateState extends State<DecoratePage> with SingleTickerProviderStateMixin {

  final data = <String, Widget>{};

  late TabController  controller;

  @override
  void initState() {
    super.initState();
    data["日榜"] = Container(color: Colors.red,);
    data["周榜"] = Container(color: Colors.green,);
    data["月榜"] = Container(color: Colors.red,);

    controller = TabController(vsync: this, length: data.length);;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: "装扮"),
      body: Column(
        children: [
          xAppBar$TabBar(
            data.keys,
            controller: controller,
            alignment: Alignment.centerLeft,
            needPadding: false,
            needDownLine: false,
            isScrollable: false,
            fontSize: 12,
            height: 23,
            kItemHeight: 23,
            labelPadding: 20,
            decoration: MyUnderlineTabIndicator(
              borderRadius: BorderRadius.circular(5),
              insets: const EdgeInsets.symmetric(horizontal: 8),
              horizonDistance: 10
            ),
            labelColor:const T.Tuple2(Colors.white, Color(0XFF666666)),
          ),

          Expanded(
            child: TabBarView(
              controller: controller,
              children: data.values
                  .map((it) => (_) => it)
                  .map((it) => DelayView(keepAlive: true, builder: it))
                  .toList(growable: false),
            )
          )
        ],
      ),
    );
  }

}