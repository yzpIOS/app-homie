import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

@immutable
class AppBar2 extends StatelessWidget {
  // 返回按钮的颜色
  final Color? color;
  // 标题
  List<Widget> actions;

  AppBar2({this.color, this.actions = const <Widget>[], super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 返回按钮
          GestureDetector(
            onTap: () {
              Get.back();
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 44,
              width: 44,
              alignment: Alignment.center,
              child: Image.asset(
                  IMG.format("icon_back_baise"),
                  fit: BoxFit.cover,
                  width: 24,
                  height: 24,
                )
            ),
          ),
          // 中间文字
          const Expanded(child: SizedBox()),
          //
          ...actions,
          const SizedBox(width: 10,)
        ],
      ),
    );
  }
}
