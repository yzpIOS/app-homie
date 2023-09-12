
import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GiftListDialog extends StatefulWidget {

  UID uid;
  NUID? nuid;

  GiftListDialog({required this.uid, this.nuid});

  @override
  State<StatefulWidget> createState() => _GiftListDialogState();

}

class _GiftListDialogState extends State<GiftListDialog> with SingleTickerProviderStateMixin {

  Map data = {
    "礼物": GiftPannel(type: 0,),
    "装饰": GiftPannel(type: 1,),
  };

  // 点亮礼物
  List? lighten;
  // 没点亮礼物
  List? notLighten;

  late final controller = TabController(vsync: this, length: data.length);

  @override
  void initState() {
    super.initState();
    Api.UserInfo.getWallGift(uid: widget.uid).then((value) {
      var mapValue = value as Map;
      lighten = mapValue.containsKey("lighten_items") ? mapValue["lighten_items"] : null;
      notLighten = mapValue.containsKey("not_lighten_items") ? mapValue["not_lighten_items"] : null;
      setState(() { });
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: const Color(0xFF312753),
  //     appBar: xAppBar(
  //       bgColor: const Color(0xFF312753),
  //       title: xAppBar$TabBar(
  //         data.keys,
  //         controller: controller,
  //         alignment: Alignment.center,
  //         labelColor: const Tuple2(AppPalette.primary, Color(0xFF999999))
  //       ),
  //       automaticallyImplyLeading: false,
  //     ),
  //     body: ConfigList(
  //       config: const ListConfig(
  //         divider: Spacing.h10,
  //         padding: Pad(bottom: 64),
  //       ),
  //       child: TabBarView(
  //         controller: controller,
  //         children: data.values
  //             .map((it) => (_) => it)
  //             .map((it) => DelayView(keepAlive: true, builder: it))
  //             .toList(growable: false),
  //       ),
  //     ),
  //     bottomNavigationBar: SizedBox(height: 30,),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF312753),
      body: GiftPannel(type: 0, lighten: lighten, notLighten: notLighten,),
      bottomNavigationBar: const SizedBox(height: 30,),
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
  // 点亮礼物
  List? lighten;
  // 没点亮礼物
  List? notLighten;

  GiftPannel({required this.type, this.lighten, this.notLighten});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: CustomScrollView(
        slivers: [
          _createTitle("己点亮", lighten?.length ?? 0),
          const SizedBox(height: 10,).toSliver(),
          if(lighten != null && (lighten?.length ?? 0) > 0)
            _createGridView(lighten!),

          const SizedBox(height: 20,).toSliver(),
          _createTitle("未点亮", notLighten?.length ?? 0),
          const SizedBox(height: 10,).toSliver(),
          if(notLighten != null && (notLighten?.length ?? 0) > 0)
            _createGridView(notLighten!),
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

  Widget _createGridView(List data) {
    double ratio = type == 0 ? (110.0 / 137.0) : (110.0 / 116.0);
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            if(type == 0) {
              return _createGiftItem(data[index]);
            }
            return _createDecorationItem(data[index]);
          },
          childCount: data.length
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
  Widget _createGiftItem(Map data) {
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
            const SizedBox(height: 5,),
            // 礼物名称
            Expanded(
              child: Text(
                data["name"],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                ),
              ),
            ),

            // 进度条上的文字
            const SizedBox(height: 5,),
            Row(
              children: [
                const SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    "${data["accept_count"]}/${data["lighten_need_count"]}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12
                    ),
                  ),
                ),
                // Text(
                //   "+1星",
                //   style: TextStyle(
                //       color: Color(0xFFF54390),
                //       fontWeight: FontWeight.normal,
                //       fontSize: 12
                //   ),
                // ),
                const SizedBox(width: 10,)
              ],
            ),
            SizedBox(
              height: 6,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(30),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
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
            child: const Text(
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
  Widget _createDecorationItem(Map data) {
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
            const SizedBox(height: 5,),
            // 礼物名称
            const Expanded(
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
            child: const Text(
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


