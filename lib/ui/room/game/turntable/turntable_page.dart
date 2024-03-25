

import 'dart:ui';

import 'package:app/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TurntablePage extends StatefulWidget {

  const TurntablePage({super.key});

  static Future<void> showDialog() async {
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            SizedBox(
              width: 326,
              height: 600,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  // tabBar
                  _createTabBar(),
                  // 内容
                  _createContentView(),
                ],
              ),
            ),

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
        curSelectedIndex = index;
        setState(() { });
      },
      behavior: HitTestBehavior.opaque,
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
            Container(
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

            // 余额
            Row(
              children: [
                Expanded(
                  child: Text(
                    "剩余紫钻:20000000",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14
                    ),
                  ),
                ),
              ],
            ),


            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

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
}


class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    super.key,
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    super.child,
  });

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderInnerShadow renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  late double blur;
  late Color color;
  late double dx;
  late double dy;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx,
      size.height - dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx, dy);
    context.paintChild(child!, offset);
    context.canvas..restore()..restore()..restore();
  }
}