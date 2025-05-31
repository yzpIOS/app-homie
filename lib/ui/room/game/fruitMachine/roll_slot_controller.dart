import 'dart:async';
import 'package:app/tools.dart';
import 'package:flutter/cupertino.dart';

enum RollSlotControllerState { none,rolling,rollRandomly, stopped }

/// 滚动槽控制器
class RollSlotController extends ChangeNotifier {
  RollSlotControllerState _state = RollSlotControllerState.none;

  RollSlotControllerState get state => _state;

  int _topIndex = 0;
  int _centerIndex = 0;
  int _bottomIndex = 0;

  int get centerIndex => _centerIndex;
  int get bottomIndex => _bottomIndex;
  int get topIndex => _topIndex;

  final int? secondsBeforeStop;

  late Timer _stopAutomaticallyTimer;

  RollSlotController({
    this.secondsBeforeStop,
  });

  void startRoll(){
    if (_state.isRolling || _state.isRollRandomly) {
      return;
    }
    //logForDebug("RollSlotController startRoll");
    _state = RollSlotControllerState.rolling;
    notifyListeners();
  }

  void animateRandomly({
    required int topIndex,
    required int centerIndex,
    required int bottomIndex,
  }) {
    //logForDebug("RollSlotController animateRandomly");
    _topIndex = topIndex;
    _centerIndex = centerIndex;
    _bottomIndex = bottomIndex;
    _state = RollSlotControllerState.rollRandomly;
    if (secondsBeforeStop != null) {
      _setAutomaticallyStopTimer(secondsBeforeStop!);
    }
    notifyListeners();
  }

  void stop() {
    //logForDebug("RollSlotController stop");
    if (_state.isRollRandomly || _state.isRolling) {
      _state = RollSlotControllerState.stopped;
      notifyListeners();
    }
  }

  void _setAutomaticallyStopTimer(int stopDuration) {
    _stopAutomaticallyTimer = Timer.periodic(const Duration(seconds: 1), (count) {
      //logForDebug("RollSlotController automaticallyStopTimer");
      if (count.tick == secondsBeforeStop) {
        if (!_state.isStopped) {
          stop();
        }
        _stopAutomaticallyTimer.cancel();
      }
    });
  }
}

extension RollSlotControllerStateExt on RollSlotControllerState {
  bool get isNone => this == RollSlotControllerState.none;
  bool get isRolling => this == RollSlotControllerState.rolling;
  bool get isRollRandomly => this == RollSlotControllerState.rollRandomly;
  bool get isStopped => this == RollSlotControllerState.stopped;
}
