import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/cupertino.dart';

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

  String text = "请稍候";

  bool get isShow => !_offstage.value;

  show({String text = "请稍候"}) => _offstage.value = false;

  hidden() => _offstage.value = true;

  @override
  void onReady() {
    Get.insertOverlay(const WaitingOverlay());
  }

  static WaitingCtrl get obj => Get.find();
}
