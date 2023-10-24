import 'package:app/3rd/tencent/im.dart';
import 'package:app/common/theme.dart';
import 'package:app/model/conv.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/x_input_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_sdk/models/user_status_type.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_status.dart';

abstract class ChatAppBar extends StatelessWidget {
  final ChatConv conv;

  const ChatAppBar(this.conv, {super.key});
}

mixin _ActionMixin implements ChatAppBar {
  final VoidCallback? toSetting = null;

  Widget? get iconSetting {
    final uid = conv.userId ?? '';
    if (uid.startsWith('service_')) {
      return null;
    }
    /// wyxtodo
    return false
        ? XOutlinedBtn(
      label: '已关注',
      width: 60,
      height: 24,
      textStyle: const TextStyle(fontSize: 12, color: AppPalette.primary),
      // onTap: () => doFollow(false, () => setState(() => data['is_follow'] = false)),
    )
        : XTextBtn(
      label: '关注',
      width: 60,
      height: 24,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white),
      // onTap: () => doFollow(true, () => setState(() => data['is_follow'] = true)),
    );
    // return null;

    return conv.onlyViewRx() || toSetting == null //
        ? null
        : 'ic_menu_2'.toSvgAction(onPressed: toSetting);
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
    // 系统消息只显示标题
    if (uid.startsWith('service_')) {
      return $MuteView(child:
        FutureBuilder(
          future: Future.value(conv.conv),
          builder: (_, snapshot) => XText(snapshot.data?.showName ?? ''),
        )
      );
    }

    // 单聊消息显示 在线状态、昵称、修改备注按钮
    return $MuteView(
      child: FutureBuilder<List<V2TimUserStatus>>(
        future: IM.getUserStatus(userIDList: [uid]),
        builder: (_, snapshot) {
          bool isOnline = true;//是否在线
          // if (snapshot.hasData) {
          //   if (snapshot.data!.isNotEmpty) {
          //     V2TimUserStatus? userStatus = snapshot.data?.first;
          //     isOnline = (userStatus?.statusType == UserStatusType.V2TIM_USER_STATUS_ONLINE);
          //   }
          // }
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isOnline) Image.asset(IMG.format('chat/在线'), width: 34, height: 16, scale: 3, fit: BoxFit.contain),
              if (isOnline) Spacing.w4,
              OpacityButton(
                onTap: () {
                  var config = InputCfg(title: '修改备注', emptyCallBack: true);
                  XInputPage.go(config).onType<String?>((name) async {
                    if(config.flag == false) {
                      return;
                    }
                    if(name == null || name.isEmpty == true) {
                      var userInfo = await UserInfoCtrl.ins.findByUidOrNull(uid, useNet: true);
                      name = userInfo?.nickName;
                    }
                    simpleSub(
                      Api.UserInfo.remarkName(uid: uid, name: name ?? ""),
                      callback: () {
                        UserInfoCtrl.doUpdate(
                          uid,
                          rebuild: (val) => val.copyWith(remarkName: name ?? ""),
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
              Spacing.blank,
            ],
          );
        },
      )
    );
  }

  @override
  VoidCallback? get toSetting => () {
        //TODO
      };
}
