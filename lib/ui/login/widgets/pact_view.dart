import 'package:app/common/theme.dart';
import 'package:app/store/config_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/app_dialog.dart';
import 'package:app/widgets.dart';

abstract class IPact {
  late final RxBool pactRx = initRx();

  RxBool initRx() => RxBool(false);

  void agree() => pactRx(true);

  Widget $PactView() {
    return Row(
      children: [
        Obx(
          () => XRadio(
            value: pactRx(),
            onChanged: (_) => pactRx.toggle(),
          ),
        ),
        Spacing.w6,
        Flexible(
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 12),
            child: $PactTxt(),
          ),
        ),
      ],
    );
  }

  Widget $PactTxt();

  void alertSub({VoidCallback? doSub, bool fromLogin = true}) {
    if (pactRx.isTrue) {
      doSub?.call();
    } else {
      final dialog = AppDialog(
        title: null,
        content: $PactTxt(),
        actions: [
          CancelDialogAction(),
          OkDialogAction(
            title: '同意',
            onTap: () => Get.back(result: true),
          ),
        ],
      );

      Get.dialog(dialog, useSafeArea: false).then((val) {
        if (val == true) {
          agree();

          // 来自登录, 同意后才进行初始化
          if(fromLogin) {
            OAuthCtrl.ins.initPrivacy();
          }

          doSub?.call();
        }
      });
    }
  }
}

class _AtApp extends IPact {
  @override
  Widget $PactTxt() {
    return GetBuilder<ConfigCtrl>(
      initState: (state) => state.controller?.doRefresh(),
      builder: (ctrl) {
        return StyledText(
          text: '我已阅读并同意<c>《<a1>用户协议</a1>》及《<a2>隐私政策</a2>》</c>',
          tags: {
            'c': StyledTextTag(style: const TextStyle(color: AppPalette.primary)),
            'a1': StyledTextActionTag((val, __) => ctrl.onTapLink(val!, 'user_protocol')),
            'a2': StyledTextActionTag((val, __) => ctrl.onTapLink(val!, 'privacy_policy')),
          },
          style: const TextStyle(color: AppPalette.c9),
        );
      },
    );
  }
}

class _FreezeAccountApp extends IPact {
  @override
  Widget $PactTxt() {
    return GetBuilder<ConfigCtrl>(
      initState: (state) => state.controller?.doRefresh(),
      builder: (ctrl) {
        return StyledText(
          text: '我已阅读并同意<c>《<a1>HOMIE注销须知</a1>》</c>',
          tags: {
            'c': StyledTextTag(style: const TextStyle(color: AppPalette.primary)),
            'a1': StyledTextActionTag((val, __) => ctrl.onTapLink(val!, 'cancel_notice')),
          },
          style: const TextStyle(color: AppPalette.c9),
        );
      },
    );
  }
}

class Pact {
  Pact._();

  static final IPact app = _AtApp();
  static final IPact freezeAccount = _FreezeAccountApp();
}
