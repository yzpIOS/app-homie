import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class AcceptChallengeDialog extends StatefulWidget {
  final String msg;
  final void Function(bool isAccept)? callback;

  const AcceptChallengeDialog({super.key, required this.msg, this.callback,});

  static Future<void> show(String msg, {void Function(bool isAccept)? callback}) async {
    await Get.dialog(
      useSafeArea: false,
      barrierColor: Colors.transparent,
      AcceptChallengeDialog(msg: msg, callback: callback),
    );
  }

  @override
  State<AcceptChallengeDialog> createState() => _AcceptChallengeDialogState();
}

class _AcceptChallengeDialogState extends State<AcceptChallengeDialog> {
  final timeRx = Rxn<(int, DateTime)>((10, DateTime.now()));

  @override
  Widget build(BuildContext context) {
    Widget child = $BodyView();

    child = Box(
      width: 300,
      padding: const Pad(top: 20),
      child: child,
    );

    child = Material(
      color: const Color(0x4D000000),
      borderRadius: AppBorderRadius.a10,
      textStyle: const TextStyle(fontSize: 14, color: Colors.black),
      child: child,
    );

    child = Align(
      alignment: Alignment.center,
      child: child,
    );

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
    //timeRx((10, DateTime.now()));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.msg != null)
          Box(
            padding: const Pad(bottom: 10),
            child: Text(
              widget.msg,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$SemiBold),
            ),
          ),
        Box(
          height: 0.5,
          child: Container(color: AppPalette.cc,),
        ),
        Row(
          children: [
            Expanded(child:
              MaterialButton(
                onPressed:  () {
                  if (widget.callback != null) {
                    widget.callback!(false);
                  } else {
                    Get.back();
                  }
                },
                child: const Text(
                  '取消',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: AppPalette.cc, fontWeight: fw$Regular),
                ),
              ),
            ),
            Container(width: 0.5 , height: 75, color: AppPalette.cc,),
            Expanded(child:
              MaterialButton(
                onPressed: () {
                  if (widget.callback != null) {
                    widget.callback!(true);
                  } else {
                    Get.back();
                  }
                },
                child: Obx(() {
                  final time = timeRx();

                  if (time == null) {
                    return const Text(
                      '接受（10s)',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Regular),
                    );
                  }

                  return TimeBuilder.countdown(
                    start: time.$2,
                    seconds: time.$1 + 1,
                    builder: (_, __, s, isFinished, {required int countdown}) {
                      if (isFinished) {
                        if (widget.callback != null) {
                          widget.callback!(false);
                        } else {
                          Get.back();
                        }
                      }

                      return Text(
                        '接受（${countdown}s)',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Regular),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
