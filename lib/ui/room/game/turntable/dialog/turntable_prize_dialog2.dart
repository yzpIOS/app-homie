
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

class TurntablePrizeDialog2 extends StatefulWidget {

  RxList items;

  MovieEntity? movieEntity;

  TurntablePrizeDialog2(this.items, this.movieEntity, {super.key});

  static Future<void> showDialog2(S_BlindBox? event) async {
    if(event == null) {
      return;
    }
    var listItem = [];
    event.items.forEach((element) {
      listItem.add({
        "price": element.price.toInt(),
        "prize_image": element.cover,
        "count": element.count,
        "prize_name": element.name,
        "currency": element.currency,
        "blindBoxId": event.blindBoxId.toInt(),
        "blindBoxCount": event.blindBoxCount.toInt(),
      });
    });
    showDialog(RxList(listItem));
  }

  static Future<void> showDialog(RxList items) async {
    items.sort((a, b) {
      int value1 = (a["price"] ?? 0);
      int value2 = (b["price"] ?? 0);
      return value2 - value1;
    });

    // MovieEntity movieEntity = await SVGAParser.shared.decodeFromAssets('assets/烟花.svga');
    var dialog = TurntablePrizeDialog2(items, null);
    await Get.dialog(
      dialog,
      useSafeArea: false,
      routeSettings: dialog.toRouteSettings(),
    );
  }

  @override
  State<StatefulWidget> createState() => _TurntablePrizeDialogState();
}

class _TurntablePrizeDialogState extends State<TurntablePrizeDialog2> with TickerProviderStateMixin {

  int index = 0;

  _AnimeHelp? anime = null;

  @override
  void initState() {
    super.initState();
    if(widget.movieEntity != null) {
      anime = _AnimeHelp(this, widget.movieEntity!);
    }

    delay(300, () async {
      await anime?.doStart(
        callback: () async {
          anime?.dispose();
          anime = null;
          setState(() { });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        if(widget.items.isEmpty) {
          return SizedBox();
        }
        var item = widget.items.first;
        return Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // 价格
              createPrize(item),
              // 恭喜
              createCongratulations(item),
              // 底部按钮
              createBottomButton(item),
              // 烟花
              createFireWorks(),
            ],
          ),
        );
      }),
    );
  }

  Widget createPrize(Map item) {
    return Container(
      width: 378,
      height: 386,
      child: Stack(
        alignment: Alignment.center,
        children: [

          Image.asset(IMG.format("room/game/turntable_icon_shine")),

          Positioned(
            top: (386 - 165) / 2,
            left: 0,
            right: 0,
            child: Image.network(item["prize_image"], width: 165, height: 165,),
          ),

          // 数量
          Positioned(
            top: (386 - 165) / 2 + 30,
            left: (378 - 165) / 2 + 120,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: Color(0xffFFD9F2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                "x${item["count"].toString()}",
                style: TextStyle(
                    color: Color(0xffFF3291),
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
              ),
            ),
          ),


          // 名字
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            margin: EdgeInsets.only(top: 150),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(60),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              item["prize_name"],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createCongratulations(Map item) {
    int currency = item["currency"];

    String currencyName = "";
    if(currency == MoneyType.diamond.val) {
      currencyName = MoneyType.diamond.label;
    } else {
      currencyName = MoneyType.gold.label;
    }
    return Positioned(
      top: 15,
      child: Column(
        children: [
          // 恭喜获得
          Image.asset(IMG.format("room/game/turntable_pic_gx"),width: 266, height: 75,),

          // 总价格
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(60),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              "礼物总价值${(item["count"] ?? 0) * (item["price"] ?? 0)}${currencyName}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createBottomButton(Map item) {
    return GestureDetector(
      onTap: () async {
        if(index >= widget.items.length - 1) {
          Get.back();
          return;
        }
        index += 1;
        setState(() { });
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 169,
        height: 54,
        padding: EdgeInsets.only(top: 5),
        margin: EdgeInsets.only(top: 333),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(IMG.format("room/game/turntable_button_qd")),
            )
        ),
        child: Text(
          "确定",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24
          ),
        ),
      ),
    );
  }

  Widget createFireWorks() {
    if(anime?.ctrl == null) {
      return SizedBox();
    }
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: 0,
      child: RepaintBoundary(
        child: SVGAImage(
          anime!.ctrl,
          fit: BoxFit.cover,
          clearsAfterStop: false,
          allowDrawingOverflow: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    anime?.dispose();
    anime = null;
    SocketCtrl.ins.blindBox = null;
  }
}



class _AnimeHelp {
  final SVGAAnimationController ctrl;

  _AnimeHelp(TickerProvider vsync, MovieEntity entity)
      : ctrl = SVGAAnimationController(vsync: vsync)..videoItem = entity;

  late final frames = ctrl.frames;
  late final dur = ctrl.duration ?? const Duration(seconds: 1);
  late final step = (frames - 20) / frames;

  bool _isDispose = false;

  Future<void> doStart({required Future Function() callback}) async {
    bool running = true;

    final anim = Future.doWhile(
          () async {
        await ctrl.animateTo(step, duration: dur * step).orCancel;
        return running;
      },
    );

    try {
      if (_isDispose) return;

      running = false;

      await anim;
      if (_isDispose) return;

      await ctrl.fling().orCancel.catchError((_) {});
      if (_isDispose) return;

      await callback();
    } finally {
      if (!_isDispose) ctrl.reset();
    }
  }

  void dispose() {
    _isDispose = true;

    ctrl
      ..stop()
      ..dispose();
  }
}
