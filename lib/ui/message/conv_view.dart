import 'package:app/3rd/tencent/im.dart';
import 'package:app/common/theme.dart';
import 'package:app/store/im/chat_ctrl.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/message/chat/chat_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConvView extends GetView<ConvManagerCtrl> {
  final GlobalKey<RefreshIndicatorState>? refreshKey;

  const ConvView([this.refreshKey]);

  @override
  Widget build(BuildContext context) {
    final special = context.watch<SpecialTextSpanBuilder?>();

    Widget child = SimpleRxListView<V2TimConversation>(
      controller.convRx,
      doRefresh: controller.doRefresh,
      padding: const Pad(bottom: 64),
      divider: const Divider(indent: 60),
      itemBuilder: (_, item, __) => _ItemView(data: item, convManagerCtrl:controller, special: special),
    );

    child = ConfigListState(
      buildEmptyView: ([arg]) => TipsView(tips: '还没有人给你发消息哦~', doRefresh: arg),
      child: child,
    );

    child = RefreshIndicator(
      key: refreshKey,
      onRefresh: controller.doRefresh,
      child: child,
    );

    return child;
  }
}

class _ItemView extends StatelessWidget {
  final V2TimConversation data;
  final SpecialTextSpanBuilder? special;

  final ConvManagerCtrl convManagerCtrl;

  const _ItemView({required this.data, required this.convManagerCtrl, this.special});

  @override
  Widget build(BuildContext context) {
    final unRead = data.unreadCount ?? 0;
    final message = data.lastMessage;
    final msgTime = message?.msgTime;
    final isOnlineState = convManagerCtrl.isOnlineState(data.userID!);//是否直播中

    Widget child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: DefaultTextStyle.merge(
                style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
                child: $TitleView(),
              ),
            ),
            Spacing.w16,
            if (msgTime != null)
              XText(
                msgTime.fromNow(),
                style: const TextStyle(fontSize: 10),
              ),
          ],
        ),
        Spacing.h4,
        Row(
          children: [
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                alignment: Alignment.centerLeft,
                child: XText(
                  message?.simpleMsg ?? '',
                  specialTextSpanBuilder: special,
                ),
              ),
            ),
            if (unRead > 0) $UnReadView(unRead),
          ],
        ),
      ],
    );

    child = Row(
      children: [
        Spacing.w10,
        $AvatarView(isOnlineState),
        Spacing.w10,
        Expanded(child: child),
        Spacing.w10,
      ],
    );

    child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: AppPalette.c9),
      child: child,
    );

    child = Box(
      height: 80,
      child: InkWell(
        child: child,
        // onLongPress: () {
        //   IM.conv.deleteConversation(conversationID: data.convId);
        // },
        onTap: () {
          switch (data.type) {
            case ConversationType.V2TIM_C2C:
              // 打开聊天
              ChatPage.to(SingleChatCtrl.fromUid(data.userID!));
              break;
            default:
              showToast('当前版本不支持');
          }
        },
      ),
    );

    return child;
  }

  Widget $AvatarView(bool isOnlineState) {
    const double size = 40;

    Widget? child;

    if (data.isSysConv) {
      child = AvatarView(data.faceUrl, size: size);
    } else {
      switch (data.type) {
        case ConversationType.V2TIM_C2C:
          child = AsyncAvatar(uid: data.userID!, size: size, isShowOnline: isOnlineState,);
          break;
        case ConversationType.V2TIM_GROUP:
          break;
      }
    }

    return Box(width: isOnlineState ? size + 6 : size, height: isOnlineState ? size + 6 : size, child: child);
  }

  Widget $TitleView() {
    if (!data.isSysConv) {
      switch (data.type) {
        case ConversationType.V2TIM_C2C:
          return UserInfoCtrl.use(data.userID!, builder: (it) => XText(it?.showName() ?? ''));
        case ConversationType.V2TIM_GROUP:
          break;
        case ConversationType.CONVERSATION_TYPE_INVALID:
          break;
      }
    }

    return XText(data.showName ?? '--');
  }

  Widget $UnReadView(int count) {
    return Container(
      width: count >= 10 ? 24 : 16,
      height: 16,
      decoration: const ShapeDecoration(color: Color(0xFFFF0049), shape: XStadiumBorder()),
      alignment: Alignment.center,
      child: XText(
        count > 99 ? '99+' : '$count',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
