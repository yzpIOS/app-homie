import 'package:app/common/theme.dart';
import 'package:app/model/enum/verify_code_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/foundation.dart';

class SmsVerifyView extends StatefulWidget {
  final RxnString tokenRx;
  final VerifyCodeEnum type;
  final ValueListenable<TextEditingValue> number;

  const SmsVerifyView({
    super.key,
    required this.number,
    required this.type,
    required this.tokenRx,
  });

  @override
  State<SmsVerifyView> createState() => _SmsVerifyViewState();
}

class _SmsVerifyViewState extends State<SmsVerifyView> {
  final timeRx = Rxn<(int, DateTime)>();

  String get number => widget.number.value.text.trim();

  @override
  Widget build(BuildContext context) {
    final child = Obx(() {
      final time = timeRx();

      if (time == null) {
        return const XText('获取验证码');
      }

      return TimeBuilder.countdown(
        start: time.$2,
        seconds: time.$1 + 1,
        builder: (_, __, s, isFinished, {required int countdown}) {
          if (isFinished) post(timeRx.nil);

          return XText('${countdown}S');
        },
      );
    });

    return Obx(() {
      return OpacityButton(
        onTap: _doSend,
        child: DefaultTextStyle.merge(
          style: TextStyle(fontSize: 15,
              color: (timeRx() == null) ? AppPalette.primary : AppPalette.c9, fontWeight: fw$Bold),
          child: Row(
            children: [
              const Box(width: 1, height: 12, color: AppPalette.cc),
              Expanded(
                child: Center(child: child),
              ),
            ],
          ),
        ),
      );
    });
  }

  void _doSend() {
    if (!timeRx.isNull()) return;

    if (number.isEmpty) {
      showToast('请输入验证码接收号码');

      return;
    }

    simpleSub(
      Api.UserAuth.sms(phone: number, type: widget.type),
      msg: '已发送',
      callback1: (resp) {
        if (resp case {'token': String token, 'cooldown': int countdown}) {
          widget.tokenRx(token);

          timeRx((countdown, DateTime.now()));
        }
      },
    );
  }
}
