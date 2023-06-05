import 'package:app/common/theme.dart';
import 'package:app/store/im/chat_ctrl.dart';
import 'package:app/store/moment/moment_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/message/chat/chat_page.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/ui/moment/view_item/header.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

mixin MomentHeader implements IHeaderView<MomentDtoAdapter> {
  double get avatarSize => 50;

  @override
  Widget $header() {
    Widget child = Row(
      children: [
        Spacing.w10,
        AsyncAvatar(uid: vm.author, size: avatarSize),
        Spacing.w10,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserInfoCtrl.use(
                vm.author,
                builder: (it) {
                  return XText(
                    it?.showName() ?? '',
                    style: const TextStyle(fontSize: 14, color: AppPalette.c3, fontWeight: fw$Medium),
                  );
                },
              ),
              Spacing.h2,
              XText(
                vm.time?.fromNow() ?? '--',
                style: const TextStyle(fontSize: 10, color: AppPalette.c9),
              ),
            ],
          ),
        ),
        if (!OAuthCtrl.isSelf(vm.author)) $FollowView(),
        Spacing.w10,
      ],
    );

    child = Box(height: 50, child: child);

    return child;
  }

  Widget $FollowView() {
    return Obx(
      () => vm.more.isFollow
          ? XOutlinedBtn(
              label: '私聊',
              width: 60,
              height: 24,
              textStyle: const TextStyle(fontSize: 14, color: AppPalette.primary),
              onTap: () => ChatPage.to(SingleChatCtrl.fromUid(vm.author)),
            )
          : XTextBtn(
              label: '关注',
              width: 60,
              height: 24,
              textStyle: const TextStyle(fontSize: 14, color: Colors.white),
              onTap: vm.data.doFollow,
            ),
    );
  }
}
