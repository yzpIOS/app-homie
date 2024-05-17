
import 'package:app/common/utils/en.dart';
import 'package:app/ui/gift/gift_send_logic.dart';
import 'package:app/ui/gift/gift_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import '../../../tools.dart';
import '../../common/orientation_sheet.dart';
import '../../my/wallet/recharge_page.dart';

class ContinueMagicBall extends StatefulWidget {

  final GiftSendLogic giftSendLogic;
  final Offset offset;

  final Size size;

  double parentOffset = 0;

  int count = 3;

  ContinueMagicBall({
    required this.giftSendLogic,
    required this.offset,
    required this.size,
    required this.parentOffset,
    super.key
  });

  @override
  State<StatefulWidget> createState() => _ContinueMagicBall();

  static void showBottom(GiftSendLogic giftSendLogic, Offset? offset, Size? size, double parentOffset, int count) {
    OrientationSheet.show(
      child: ContinueMagicBall(
        giftSendLogic: giftSendLogic,
        offset: offset ?? Offset(10, Get.height - 150),
        size: size ?? Size(74, 90),
        parentOffset: parentOffset,
      ),
      direction: SheetOrientation.bottom,
      decoration: null,
      constraints: BoxConstraints(minHeight: parentOffset, maxHeight: parentOffset),
      dur: Duration.zero,
    );
    // Get.showBottomSheet(
    //   ,
    //   bgColor: Colors.transparent,
    //   enterBottomSheetDuration: Duration.zero,
    // );
  }
}

class _ContinueMagicBall extends State<ContinueMagicBall> {

  int _preSendTime = DateTime.now().millisecondsSinceEpoch;
  late int _totalSendCount = widget.count;

  int interval = 1500;

  @override
  void initState() {
    super.initState();
    _preSendTime = DateTime.now().millisecondsSinceEpoch;
    _totalSendCount = widget.count;

    startCountDown();
  }

  void startCountDown() {
    Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
      if(!mounted) {
        //debugPrint("startCountDown destroy");
        return;
      }

      var curTime = DateTime.now().millisecondsSinceEpoch;
      if(_preSendTime == 0 || curTime - _preSendTime < interval) {
        //debugPrint("记录点击次数时间55555： = ${curTime - _preSendTime}");
        startCountDown();
        return;
      }
      //debugPrint("记录点击次数4444 = ${curTime - _preSendTime}");
      _handleBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    double position = 0.0;
    if(widget.offset.dy + widget.size.height > widget.parentOffset) {
      position = 0;
    } else if(widget.offset.dy  < - widget.size.height) {
      position = 0;
    } else {
      position = widget.offset.dy;
    }

    return Container(
      width: double.infinity,
      height: widget.parentOffset,
      color: Colors.black.withAlpha(80),
      child: Stack(
        children: [
          Positioned(
            width: widget.size.width,
            height: widget.size.height,
            left: widget.offset.dx,
            top: position,
            child: GiftItemView(
              data: widget.giftSendLogic.selectRx.value ?? {},
              selectRx: Rxn(widget.giftSendLogic.selectRx.value),
              callBack: (map) {},),
          ),


          Positioned(
            bottom: 0,
            right: 13,
            child: GestureDetector(
              onTap: () {
                handle();
              },
              behavior: HitTestBehavior.opaque,
              child: Column(
                children: [
                  _createLeftNumber(),
                  Image.asset(IMG.format("room/魔法星球连击"), width: 106, height: 106,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void handle() {
    var data = widget.giftSendLogic.selectRx.value;
    if(data == null) {

      //debugPrint("记录点击次数3333");
      _handleBack();
      return;
    }
    final whenErr = {
      11001: (_) {
        //TODO 判断货币
        Get.simpleDialog(msg: '余额不足'.en(), okLabel: '去充值'.en()).then((val) {
          if (val == '去充值'.en()) {
            Get.to(() => RechargePage(hasShowUnityView: false,));
          }
        });
      },
    };

    simpleTry<int>(() => widget.giftSendLogic.doSend(data, 1),
        whenErr: whenErr,
        callback: (resp) {
          widget.giftSendLogic.onDone(data, resp);
          // 魔法星球
          var curTime = DateTime.now().millisecondsSinceEpoch;
          if(_preSendTime == 0 || curTime - _preSendTime < interval) {
            //debugPrint("记录点击次数111 = ${curTime - _preSendTime}");
            _totalSendCount += 1;
            setState(() { });
          } else {
            //debugPrint("记录点击次数222 = ${curTime - _preSendTime}");
            _handleBack();
          }
          _preSendTime = curTime;
        },
        codeCallBack: (code, e) {
        }
    );
  }

  ///
  /// 用户头像或者是礼物图片
  ///
  Widget _createLeftNumber() {
    Characters number = "${_totalSendCount}".characters;
    double totalLeft = 13.5;
    List<Widget> numbers = [];
    for(int index = 0; index < number.length; index ++) {
      numbers.insert(0, Container(
        margin: EdgeInsets.only(left: totalLeft,),
        child: Image.asset(
          IMG.format("room/magic_start_planet_${number.characterAt(index)}"),
          width: number.characterAt(index).toString() == '1' ? 14.5 : 18,
          height: 24,
        ),
      ));
      totalLeft += (number.characterAt(index).toString() == "1" ? 12.5 : 18);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // X
        if(numbers.isNotEmpty)
          Container(
            width: totalLeft,
            margin: EdgeInsets.only(top: 38),
            height: 21,
            child: Stack(
              children: [
                // X
                Container(
                  margin: EdgeInsets.only(top: 5,),
                  child: Image.asset(
                    IMG.format("room/magic_start_planet_x"),
                    width: 16.5,
                    height: 15,
                  ),
                ),
                ...numbers
              ],
            ),
          ),
      ],
    );
  }

  bool hasCallBack = false;

  void _handleBack() {
    if(hasCallBack) {
      return;
    }
    hasCallBack = true;
    Get.back();
  }
}