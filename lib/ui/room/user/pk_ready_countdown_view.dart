import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:app/tools.dart';
import 'package:flutter/material.dart';

class PKReadyCountDownDialog extends StatefulWidget {
  final Map data;
  final VoidCallback? callback;

  const PKReadyCountDownDialog({super.key, required this.data, this.callback,});

  static Future<void> show(Map data, {VoidCallback? callback}) async {
    await Get.dialog(
      useSafeArea: false,
      // barrierColor: Colors.transparent,
      PKReadyCountDownDialog(data: data, callback: callback),
    );
  }

  @override
  State<PKReadyCountDownDialog> createState() => _PKReadyCountDownDialogState();
}

class _PKReadyCountDownDialogState extends State<PKReadyCountDownDialog> {
  @override
  Widget build(BuildContext context) {
    Widget child = $BodyView();

    // child = Box(
    //   // width: 300,
    //   padding: const Pad(top: 20),
    //   child: child,
    // );

    child = Material(
      color: const Color(0x4D000000),
      textStyle: const TextStyle(fontSize: 14, color: Colors.black),
      child: child,
    );

    // child = Align(
    //   alignment: Alignment.center,
    //   child: child,
    // );

    child = MediaQuery.removeViewInsets(
      context: context,
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      child: child,
    );

    child = AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOutCubic,
      child: child,
    );

    return child;
  }

  Widget $BodyView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: AppSize.safeTop + 82,
        ),
        const Box(
          child: Text(
            '即将进入决斗场',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: fw$SemiBold),
          ),
        ),
        Box(
          height: 100.5,
          child: Container(),
        ),
        XOutlinedBtn(
          width: 90,
          height: 34,
          label: '我知道了',
          side: const BorderSide(color: Colors.white),
          textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        )
      ],
    );
  }
}
