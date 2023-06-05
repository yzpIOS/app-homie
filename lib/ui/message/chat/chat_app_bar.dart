import 'package:app/model/conv.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/x_input_page.dart';
import 'package:app/widgets.dart';

abstract class ChatAppBar extends StatelessWidget {
  final ChatConv conv;

  const ChatAppBar(this.conv, {super.key});
}

mixin _ActionMixin implements ChatAppBar {
  final VoidCallback? toSetting = null;

  Widget? get iconSetting {
    return null;

    // return conv.onlyViewRx() || toSetting == null //
    //     ? null
    //     : 'ic_menu_2'.toSvgAction(onPressed: toSetting);
  }

  dynamic _actions() => iconSetting;
}

mixin _TitleMixin {
  Widget _titleBuilder(BuildContext context);
}

mixin _MuteMixin {
  abstract final RxBool isMuteRx;

  Widget $MuteView({required Widget child}) {
    return Obx(() {
      if (isMuteRx()) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: child),
            Spacing.w4,
            SvgView(SVG.$('chat/conv/静音')),
          ],
        );
      }

      return child;
    });
  }
}

abstract class _AppBar extends ChatAppBar with _TitleMixin, _ActionMixin, _MuteMixin {
  @override
  final RxBool isMuteRx;

  _AppBar(super.conv, this.isMuteRx, {super.key});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return xAppBar(
      title: Builder(builder: _titleBuilder),
      actions: _actions(),
    );
  }
}

class ChatAppBar$User extends _AppBar {
  final UID uid;

  ChatAppBar$User(super.conv, super.isMuteRx, {super.key}) : uid = conv.userId ?? '';

  @override
  Widget _titleBuilder(BuildContext context) {
    return $MuteView(
      child: uid.startsWith('service_')
          ? FutureBuilder(
              future: Future.value(conv.conv),
              builder: (_, snapshot) => XText(snapshot.data?.showName ?? ''),
            )
          : OpacityButton(
              onTap: () {
                XInputPage.go(InputCfg(title: '修改备注')).onNotNull((name) {
                  simpleSub(
                    Api.UserInfo.remarkName(uid: uid, name: name),
                    callback: () {
                      UserInfoCtrl.doUpdate(
                        uid,
                        rebuild: (val) => val.copyWith(remarkName: name),
                      );
                    },
                  );
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: UserInfoCtrl.use(
                      uid,
                      builder: (it) => XText(it?.showName() ?? ''),
                    ),
                  ),
                  SvgView(SVG.$('chat/备注'), width: 24, height: 24),
                ],
              ),
            ),
    );
  }

  @override
  VoidCallback? get toSetting => () {
        //TODO
      };
}
