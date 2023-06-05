import 'package:app/ui/my/backpack/backpack_view_gift.dart';
import 'package:app/ui/my/backpack/backpack_view_wardrobe.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class BackpackPage extends StatefulWidget {
  const BackpackPage({super.key});

  @override
  State<BackpackPage> createState() => _BackpackPageState();
}

class _BackpackPageState extends State<BackpackPage> {
  final tabs = const {
    '衣柜': BackpackView$Wardrobe(),
    '礼物': BackpackView$Gift(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: xAppBar(title: xAppBar$TabBar(tabs.keys)),
        body: ConfigListState(
          buildEmptyView: ([arg]) => TipsView(tips: '还没有装扮哦~', doRefresh: arg),
          child: TabBarView(
            children: tabs.values //
                .map((it) => DelayView(builder: (_) => it, keepAlive: true))
                .toList(growable: false),
          ),
        ),
      ),
    );
  }
}
