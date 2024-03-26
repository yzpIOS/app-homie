

import 'dart:ui';

import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/room/game/turntable/turntable_record_dialog.dart';
import 'package:app/ui/room/game/turntable/turntable_rule_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TurntablePage extends StatefulWidget {

  const TurntablePage({super.key});

  static Future<void> showDialog() async {
    var lotteries = await Api.Activity.getLotteries();
    if(lotteries == null || lotteries["items"] == null) {
      return;
    }

    var list = await Api.Activity.getLotteryList();
    if(list["items"] == null) {
      return;
    }
    var dialog = TurntablePage();
    await Get.dialog(
      dialog,
      useSafeArea: false,
      routeSettings: dialog.toRouteSettings(),
    );
  }

  @override
  State<StatefulWidget> createState() => _TurntablePageState();
}


class _TurntablePageState extends State<TurntablePage> {

  int curSelectedIndex = 0;
  
  List<EdgeInsets> locations = [];

  double totalWidth = 66.0;
  
  @override
  void initState() {
    super.initState();
    double gap = 7.0;
    totalWidth = (326.0 - 26 * 2 - 9 * 2 - gap * 3) / 4.0;

    // 第一个
    locations.add(EdgeInsets.only(left: 9, top: 11));
    // 第二个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap), top: 11));
    // 第三个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 2, top: 11));
    // 第四个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 3, top: 11));

    // 第五个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 3, top: 11 + (totalWidth + gap)));
    // 第六个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 3, top: 11 + (totalWidth + gap) * 2));
    // 第七个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 3, top: 11 + (totalWidth + gap) * 3));


    // 第八个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 2, top: 11 + (totalWidth + gap) * 3));
    // 第九个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 1, top: 11 + (totalWidth + gap) * 3));
    // 第十个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 0, top: 11 + (totalWidth + gap) * 3));


    // 第十一个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 0, top: 11 + (totalWidth + gap) * 2));
    // 第十二个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 0, top: 11 + (totalWidth + gap) * 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(child: SizedBox()),

            // 转盘界面
            SizedBox(
              width: 326,
              height: 416,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  // tabBar
                  _createTabBar(),

                  // 内容
                  _createContentView(),

                  // 规则，中奖记录
                  _createRuleAndRecord(),
                ],
              ),
            ),

            // 底部按钮
            _createBottomButton(),

            // 跳过动画
            _createAnimationButton(),

            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget _createTabBar() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // common
          _createTabBButton("普通模式", 0, curSelectedIndex),
          // height level
          _createTabBButton("高级模式", 1, curSelectedIndex),
          // crazy level
          _createTabBButton("疯狂模式", 2, curSelectedIndex),
        ],
      ),
    );
  }

  ///
  /// 头部tab单个按钮
  ///
  Widget _createTabBButton(String label, int index, int selectedIndex) {
    // 背景图
    String imagePath;
    if(index == selectedIndex) {
      imagePath = IMG.format("room/game/turntable_pic_xz");
    } else {
      imagePath = IMG.format("room/game/turntable_pic_wxz");
    }

    // 文字样式
    TextStyle style;
    if(index == selectedIndex) {
      style = TextStyle(
        color: Color(0xffA953AB),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
    } else {
      style = TextStyle(
        color: Color(0xffC98FD7),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );
    }

    return GestureDetector(
      onTap: () {
        debugPrint("GestureDetector .......");
        curSelectedIndex = index;
        setState(() { });
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 100,
        height: 66,
        padding: EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            scale: 2
          )
        ),
        child: Text(
          label,
          style: style,
        ),
      ),
    );
  }


  Widget _createContentView() {
    return Positioned(
      left: 0,
      right: 0,
      top: 30,
      child: Container(
        width: 354,
        height: 397,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(IMG.format("room/game/turntable_pic_di")),
            )
        ),
        child: Stack(
          children: [

            _userInfo(),

            ..._createPrizeList(),
          ],
        ),
      ),
    );
  }

  ///
  /// 用户信息
  ///
  Widget _userInfo() {
    return Positioned(
      left: totalWidth + 26 + 7 + 9,
      top: totalWidth + 75 + 7 + 9,
      child: Container(
        width: totalWidth * 2 + 7,
        height: totalWidth * 2 + 7,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFFE3F9),width: 1,),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffCF93F5),
        ),
        child: Column(
          children: [
            Expanded(child: SizedBox()),

            // 充值按钮
            GestureDetector(
              child: Container(
                width: 104,
                height: 39,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  image: DecorationImage(
                    image: AssetImage(IMG.format("room/game/turntable_button_cz")),
                  )
                ),
                child: Text(
                  "去充值",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                ),
              ),
            ),

            // 余额
            SizedBox(height: 8,),
            XRichText(
              TextSpan(
                children: [
                  TextSpan(
                    text: '余额:200000 ',
                    style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$SemiBold),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: MoneyIcon(type: MoneyType.diamond, size: 14),
                  )
                ]
              )
            ),

            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget _createRuleAndRecord() {
    return Positioned(
      left: 11,
      top: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 规则 按钮
          GestureDetector(
            onTap: () async {
              var dialog = TurntableRuleDialog("aa");
              await Get.dialog(
                dialog,
                useSafeArea: false,
                routeSettings: dialog.toRouteSettings(),
              );
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 44,
              height: 23,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFF97F8),
                        Color(0xFFFF4CF2),
                      ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff890085).withAlpha(30),
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                    )
                  ]
              ),
              child: Text(
                "规则",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),


          // 中奖记录 按钮
          GestureDetector(
            onTap: () async {

              var dialog = TurntableRecordialog();
              await Get.dialog(
                dialog,
                useSafeArea: false,
                routeSettings: dialog.toRouteSettings(),
              );
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 66,
              height: 23,
              margin: EdgeInsets.only(left: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFF97F8),
                        Color(0xFFFF4CF2),
                      ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff890085).withAlpha(30),
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                    )
                  ]
              ),
              child: Text(
                "中奖记录",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// 礼物列表
  ///
  List<Widget> _createPrizeList() {
    return locations.map((e) {
      return Positioned(
        left: e.left + 26,
        top: e.top + 75,
        width: totalWidth,
        height: totalWidth,
        child: Image.network("http://images.homieyy.com/image/6330cf3e-584a-4a3e-a8f2-3a49c772f16f"),
      );
    }).toList();
  }

  ///
  /// 底部按钮组
  ///
  Widget _createBottomButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _createSingleBottomButton(
            "单购",
            "10紫钻",
            Color(0xff193883),
            0
        ),
        _createSingleBottomButton(
            "十连抽",
            "100紫钻",
            Color(0xffAB189A),
            0
        ),
        _createSingleBottomButton(
            "百连抽",
            "1000紫钻",
            Color(0xffCB5301),
            0
        ),
      ],
    );
  }


  ///
  /// 头部tab单个按钮
  ///
  Widget _createSingleBottomButton(String label, String prize, Color prizeTxtColor, int selectedIndex) {
    return GestureDetector(
      onTap: () {
        setState(() { });
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 108,
        height: 66,
        transformAlignment: Alignment.center,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(IMG.format("room/game/turntable_$label")),
                scale: 2
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 抽奖类型：单购，十连抽，百连抽
            Text(
              label,
              style: TextStyle(
                color: prizeTxtColor,
                fontSize: 16,
                height: 0.9,
                fontWeight: FontWeight.bold,
              ),
            ),

            // 价格
            SizedBox(height: 2,),
            Text(
              prize,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                height: 0.9,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  /// 跳过动画
  ///
  Widget _createAnimationButton() {
    return Container(
      height: 28,
      width: 128,
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffFFD9FB).withAlpha(60),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(IMG.format("room/game/turntable_icon_xz"), width: 17, height: 17,),
          SizedBox(width: 5,),
          Text("跳过动画", style: TextStyle(color: Colors.white, fontSize: 14),),
        ],
      ),
    );
  }
}