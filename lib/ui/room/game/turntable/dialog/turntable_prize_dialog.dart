
import 'package:app/common/theme.dart';
import 'package:app/model/activity_lottery_model.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/room/game/turntable/views/turnable_prize_item.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

class TurntablePrizeDialog extends StatefulWidget {

  List<ActivityLotteryModel> items;

  MovieEntity? movieEntity;

  TurntablePrizeDialog( {required this.items,required this.movieEntity,super.key});

  static Future<void> showDialog(List<ActivityLotteryModel> items) async {
    items.sort((a, b) {
      int value1 = (a.price ?? 0);
      int value2 = (b.price ?? 0);
      return value2 - value1;
    });

    // MovieEntity movieEntity = await SVGAParser.shared.decodeFromAssets('assets/烟花.svga');
    var dialog = TurntablePrizeDialog(items:items,movieEntity: null);
    await Get.dialog(
      dialog,
      useSafeArea: false,
      routeSettings: dialog.toRouteSettings(),
    );
  }

  @override
  State<StatefulWidget> createState() => _TurntablePrizeDialogState();
}

class _TurntablePrizeDialogState extends State<TurntablePrizeDialog> with TickerProviderStateMixin {

  int index = 0;

  _AnimeHelp? anime = null;

  @override
  void initState() {
    super.initState();
    if(widget.movieEntity != null) {
      anime = _AnimeHelp(this, widget.movieEntity!);
    }

    delay(milliseconds:300,callBack: () async {
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Image.asset(IMG.format("room/game/turntable_prize_background")),
            ),

            Positioned(
              left: 15,
              right: 15,
              top: 190,
              bottom: 133,
              child:GridView(
                padding: Pad(horizontal: 20, bottom: AppSize.safeBottom, top: 0),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 6.5,
                  crossAxisSpacing: 6.5,
                ),
                children:
                widget.items.map(_itemBuilder).toList(growable: false),
              ) // _SimpleWnRecord(widget.items),
            ),

            // 价格
            // createPrize(),
            // // 恭喜
            // createCongratulations(),

            createTotalInfo(),

            createBottomButton(),

            // 烟花
            createFireWorks(),
          ],
        ),
      ),
    );
  }

  Widget _itemBuilder(ActivityLotteryModel activityLotteryModel){
    return TurnablePrizeItem(activityLotteryModel:activityLotteryModel);
  }


  Widget createTotalInfo() {
    int totalAmount = 0;
    int totalMoney = 0;
    widget.items.forEach((element) {
      totalAmount += element.count ?? 0;
      totalMoney += (element.price ?? 0) * (element.count ?? 0);
    });
    return Positioned(
      bottom: 88,
      left: 35.0,
      right: 35.0,
      height: 45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(width: double.infinity, height: 1,),
          XRichText(
            TextSpan(
              children: [
                const TextSpan(
                    text: "共 ",
                  style: TextStyle(
                    color: Color(0xFFFF6DB6),
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                  )
                ),
                TextSpan(
                    text: "$totalAmount",
                    style: const TextStyle(
                        color: Color(0xFFE30071),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    )
                ),
                const TextSpan(
                    text: " 件礼物",
                    style: TextStyle(
                        color: Color(0xFFFF6DB6),
                        fontWeight: FontWeight.normal,
                        fontSize: 14
                    )
                ),
              ]
            )
          ),

          XRichText(
            TextSpan(
              children: [
                const TextSpan(
                  text: '总价值 ',
                  style: TextStyle(
                      color: Color(0xFFFF6DB6),
                      fontWeight: FontWeight.normal,
                      fontSize: 14
                  )
                ),
                TextSpan(
                    text: "$totalMoney ",
                    style:const TextStyle(
                        color: Color(0xFFE30071),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    )
                ),
                const WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: MoneyIcon(type: MoneyType.diamond, size: 16),
                )
              ]
            )
          ),
        ],
      ),
    );
  }

  Widget createBottomButton() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 20,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: 169,
          height: 54,
          padding:const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(IMG.format("room/game/turntable_button_qd")),
              )
          ),
          child:const Text(
            "确定",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24
            ),
          ),
        ),
      ),
    );
  }

  Widget createFireWorks() {
    if(anime?.ctrl == null) {
      return const SizedBox();
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