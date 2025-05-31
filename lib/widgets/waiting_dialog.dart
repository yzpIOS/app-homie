import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;

class WaitingOverlay extends StatelessWidget {
  const WaitingOverlay() : super(key: const Key('WaitingOverlay'));

  @override
  Widget build(BuildContext context) {
    return GetX<WaitingCtrl>(
      builder: (it) {
        AppWaiting appWaiting = Get.find<AppWaiting>();
        appWaiting.text = it.text;
        return Offstage(
          offstage: it._offstage.isTrue,
          child: appWaiting,
        );
      },
    );
  }
}


class WaitingOverlay2 extends StatelessWidget {
  const WaitingOverlay2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<WaitingCtrl>(
      builder: (ctrl) {
        return AnimatedOpacity(
          opacity: ctrl.isShow ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: ctrl.isShow ? _buildContent(ctrl) : const SizedBox(),
        );
      },
    );
  }

  Widget _buildContent(WaitingCtrl ctrl) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 沙漏动画
              GetX<WaitingCtrl>(
                builder: (ctrl) => Transform.rotate(
                  angle: ctrl._rotation.value * (pi / 180),
                  child: Image.asset(
                    'assets/images/hourglass.png',  // 需要添加沙漏图片资源
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // 加载文本
              Text(
                ctrl.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppWaiting extends StatelessWidget {

  String text = "";

  AppWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    Widget child = DefaultTextStyle(
      style: const TextStyle(fontSize: 13, color: Color(0xFFEBEBF5)),
      child: Text(text),
    );

    const indicator = RepaintBoundary(
      child: CupertinoActivityIndicator(radius: 13, color: Color(0xFFEBEBF5)),
    );

    child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [indicator, Spacing.h8, child],
    );

    child = SizedBox(width: 96, height: 96, child: child);

    child = DecoratedBox(
      decoration: const ShapeDecoration(shape: AppShape.a10, color: Color(0xB2171717)),
      child: child,
    );

    child = AbsorbPointer(
      child: Center(child: child),
    );

    return child;
  }
}

class WaitingCtrl extends GetxService {
  final _offstage = RxBool(true);
  // 旋转角度控制
  final _rotation = RxDouble(0.0);
  String text = "请稍候";

  bool get isShow => !_offstage.value;

  show({String text = "请稍候"}) {
    this.text = text;
    _offstage.value = false;
        // 开始旋转动画
    _startRotation();
  }

 // hidden() => _offstage.value = true;
  hidden() {
    _offstage.value = true;
    _rotation.value = 0.0;  // 重置旋转角度
  }

  // 添加旋转动画方法
  void _startRotation() {
    Future.doWhile(() async {
      if (!isShow) return false;
      await Future.delayed(const Duration(milliseconds: 50));
      _rotation.value = (_rotation.value + 10) % 360;
      return true;
    });
  }
  @override
  void onReady() {
    Get.insertOverlay(const WaitingOverlay());
  }

  static WaitingCtrl get obj => Get.find();
}
