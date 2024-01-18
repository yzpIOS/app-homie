
import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/broadcast_queue_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/slide_animated_view.dart';
import 'package:flutter/material.dart';

class InvitePrizeAnimateView extends StatelessWidget {
  static Map<UniqueKey, OverlayEntry> _views = {};
  static int _startId = 0;

  Map curData;

  InvitePrizeAnimateView(this.curData, {super.key});

  ///
  /// 开始播放动画
  static Future<void> startRolling() async {
    _startId = DateTime.now().millisecondsSinceEpoch;
    _innerStartRolling(_startId);
  }

  static Future<void> _innerStartRolling(int startId) async {
    if(_startId != startId) {
      return;
    }
    Map? data = await Api.Activity.rollList();
    if(data == null || data.isEmpty || !data.containsKey("items")) {
      await Future.delayed(const Duration(seconds: 5));
      // 开如动画
      _innerStartRolling(startId);
      return;
    }
    List list = data["items"];
    if(list == null || list.isEmpty) {
      await Future.delayed(const Duration(seconds: 5));
      // 开如动画
      _innerStartRolling(startId);
      return;
    }

    for(int index = 0; index < list.length; index ++) {
      if(_startId != startId) {
        return;
      }
      // 播放动画
      await doAnime(startId, AnimeEntity(
        child: InvitePrizeAnimateView(list[index]),
        dock: const Tuple3(1.0, 0.0, -1.0),
        times: const Tuple3(Duration(seconds: 1), Duration(milliseconds: 5400), Duration(milliseconds: 400)),
        offsetTop: 305,
      ));
      await Future.delayed(const Duration(seconds: 1));
    }
    // 开如动画
    _innerStartRolling(startId);
  }

  static Future<void> doAnime(int startId, AnimeEntity data) async {
    if(_startId != startId) {
      return;
    }
    final key = UniqueKey();

    Widget child = SlideAnimatedView(
      onFinish: () async => _views[key]?.remove(),
      dock: data.dock,
      times: data.times,
      child: data.child,
    );

    child = Positioned(
      key: key,
      left: 0,
      right: 0,
      top: 306,
      child: child,
    );
    _views[key] = await Get.insertOverlay(child);

    // 等待上一个横幅
    return await Future.delayed(data.times.value1 + data.times.value2);
  }

  static void clearAnimate() {
    _startId = DateTime.now().millisecondsSinceEpoch;
    _views.forEach((key, value) {
      try {
        _views[key]?.remove();
      } catch(e) {
      }
    });
    _views.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 51,
          padding: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFF000FF).withAlpha(125),
                    Color(0xFF9600FF).withAlpha(125),
                  ]
              ),
              border: Border.all(
                  color: Color(0xFFFFBCF9),
                  width: 1
              )
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 圆形头像
              const SizedBox(width: 3,),
              createAvatar(),

              // 名字，等信息
              SizedBox(width: 5,),
              createRightInfo(),
            ],
          ),
        )
      ],
    );
  }

  Widget createAvatar() {
    return Container(
      width: 43,
      height: 43,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(100)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: NetImage(""),
      ),
    );
  }

  Widget createRightInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        userInfo(),
        createPrizeInfo(),
      ],
    );
  }

  Widget userInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            (curData["user_name"] ?? ""),
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              decoration: TextDecoration.none
            ),
          ),
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.symmetric(
                horizontal: 4.5,
                vertical: 3
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100)
            ),
            child: Text(
              curData["time"] ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget createPrizeInfo() {
    return Flexible(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "领取",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                decoration: TextDecoration.none
              )
            ),

            TextSpan(
              text: curData["desc"] ?? "",
              style: TextStyle(
                color: Color(0xFFFFED35),
                fontWeight: FontWeight.w500,
                fontSize: 12,
                decoration: TextDecoration.none
              )
            ),

            TextSpan(
              text: "钻石",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                decoration: TextDecoration.none
              )
            ),
          ]
        )
      ),
    );
  }
}