
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GiftListDialog extends StatefulWidget {

  static GiftListDialog show() {
    return GiftListDialog();
  }

  @override
  State<StatefulWidget> createState() => _GiftListDialogState();

}

class _GiftListDialogState extends State<GiftListDialog> with SingleTickerProviderStateMixin {

  final data = {
    "礼物": GiftPannel(type: 0,),
    "装饰": GiftPannel(type: 1,),
  };

  late final controller = TabController(vsync: this, length: data.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF312753),
      appBar: xAppBar(
        bgColor: const Color(0xFF312753),
        title: xAppBar$TabBar(
          data.keys,
          controller: controller,
          alignment: Alignment.center,
          labelColor: const Tuple2(AppPalette.primary, Color(0xFF999999))
        ),
        automaticallyImplyLeading: false,
      ),
      body: ConfigList(
        config: const ListConfig(
          divider: Spacing.h10,
          padding: Pad(bottom: 64),
        ),
        child: TabBarView(
          controller: controller,
          children: data.values
              .map((it) => (_) => it)
              .map((it) => DelayView(keepAlive: true, builder: it))
              .toList(growable: false),
        ),
      ),
      bottomNavigationBar: SizedBox(height: 30,),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

}

class GiftPannel extends StatelessWidget {

  int type;

  GiftPannel({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: CustomScrollView(
        slivers: [
          _createTitle("己点亮", 10),
          const SizedBox(height: 10,).toSliver(),
          _createGridView(),

          const SizedBox(height: 20,).toSliver(),
          _createTitle("己点亮", 30),
          const SizedBox(height: 10,).toSliver(),
          _createGridView(),
        ],
      ),
    );
  }

  Widget _createTitle(String text, count) {
    return Text(
      "$text $count",
      style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal
      ),
    ).toSliver();
  }

  Widget _createGridView() {
    double ratio = type == 0 ? 110.0 / 137.0 : 110.0 / 116.0;
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            if(type == 0) {
              return _createGiftItem();
            }
            return _createDecorationItem();
          },
          childCount: 10
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 13,
          crossAxisSpacing: 10,
          childAspectRatio: ratio,
        )
    );
  }

  ///
  /// 礼物下面的Item
  ///
  Widget _createGiftItem() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // 背景
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(IMG.format("wd_pic_bg_lwq")),
        ),

        // 礼物图片, 用户名称, 进度等
        Column(
          children: [
            // 礼物图片
            Container(color: Colors.red, width: 76, height: 76,),
            SizedBox(height: 5,),
            // 礼物名称
            Expanded(
              child: Text(
                "西瓜少女",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                ),
              ),
            ),

            // 进度条上的文字
            SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    "2/10",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12
                    ),
                  ),
                ),
                Text(
                  "+1星",
                  style: TextStyle(
                      color: Color(0xFFF54390),
                      fontWeight: FontWeight.normal,
                      fontSize: 12
                  ),
                ),
                SizedBox(width: 10,)
              ],
            ),
            SizedBox(
              height: 6,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(30),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9F5284), Color(0xFFF54390)],
                      ),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),

        // 活动标签
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 26,
            height: 14,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(16),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              "活动",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: Colors.white
              ),
            ),
          ),
        )
      ],
    );
  }

  ///
  /// 礼物下面的Item
  ///
  Widget _createDecorationItem() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // 背景
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(IMG.format("wd_pic_bg_zs")),
        ),

        // 礼物图片, 用户名称, 进度等
        Column(
          children: [
            // 礼物图片
            Container(color: Colors.red, width: 86, height: 86,),
            SizedBox(height: 5,),
            // 礼物名称
            Expanded(
              child: Text(
                "西瓜少女",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),

        // 活动标签
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 26,
            height: 14,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(16),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              "活动",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
              ),
            ),
          ),
        )
      ],
    );
  }
}


