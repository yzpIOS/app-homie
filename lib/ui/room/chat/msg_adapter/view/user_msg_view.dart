import 'package:app/common/theme.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/ui/room/chat/msg_adapter/data/user_msg_data.dart';
import 'package:app/ui/room/chat/msg_adapter/view/base_msg_view.dart';
import 'package:app/ui/room/user/room_user_info_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

abstract class _UserMsgView<T extends UserMsgData> extends BaseMsgView<T> {
  const _UserMsgView(super.vm, {super.key});

  InlineSpan richText(SpecialTextSpanBuilder? special, UserInfoDto info);

  static const _spacer = WidgetSpan(child: Spacing(width: 5, flex: null));

  @override
  Widget msgView(BuildContext context) {
    final special = context.watch<SpecialTextSpanBuilder?>();

    return UserInfoCtrl.use(
      vm.uid,
      builder: (it) => it == null ? Spacing.blank : _builder(special, it),
    );
  }

  Widget _builder(SpecialTextSpanBuilder? special, UserInfoDto info) {

    void showUserDialog() {
      RoomUserInfoDialog.show(uid: vm.uid, nuid: vm.nuid, msg: vm.typeIf<TxtMsgData>());
    };

    InlineSpan span = TextSpan(
      text: info.showName(),
      style: const TextStyle(color: AppPalette.colorY),
      recognizer: TapGestureRecognizer() //
        ..onTap = showUserDialog,
    );

    final level = info.level;

    span = TextSpan(
      children: [
        if (level != null)
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: showUserDialog,
              child: Padding(
                padding: const Pad(right: 4),
                child: WealthyLevelView(level: level, height: 10),
              ),
            ),
          ),
        span,
        _spacer,
        richText(special, info),
      ],
    );

    //TODO maxLines
    return RichText(text: span, maxLines: 4);
  }
}

class TxtMsgView extends _UserMsgView<TxtMsgData> {
  const TxtMsgView(super.vm, {super.key});

  @override
  InlineSpan richText(special, info) {
    final txt = vm.data;

    return special?.build(txt) ?? TextSpan(text: txt);
  }
}

class UserInMsgView extends _UserMsgView<UserInMsgData> {
  const UserInMsgView(super.vm, {super.key});

  @override
  InlineSpan richText(special, info) {
    return const TextSpan(
      text: '进入了房间',
      style: TextStyle(color: AppPalette.colorY),
    );
  }
}

class GiftMsgView extends _UserMsgView<GiftMsgAdapter> {
  const GiftMsgView(super.vm, {super.key});

  @override
  InlineSpan richText(special, info) {
    return TextSpan(
      children: [
        const TextSpan(text: '给 '),
        TextSpan(text: vm.users[vm.acceptUid]?.showName() ?? '--'),
        const TextSpan(text: ' 送出了'),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GiftImgState(
            child: NetImage(vm.giftCover, width: 16, height: 16),
          ),
        ),
        TextSpan(text: 'x${vm.giftCount}'),
      ],
      style: const TextStyle(color: AppPalette.colorY),
    );
  }
}
