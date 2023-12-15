import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/chat/msg_adapter/data/base_msg_data.dart';
import 'package:app/ui/room/chat/msg_adapter/data/user_msg_data.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class BaseMsgView<T extends BaseMsgData> extends ViewAdapter<T> {
  const BaseMsgView(super.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget child = msgView(context);

    child = Padding(
      padding: const Pad(left: 4, right: 8, vertical: 3),
      child: child,
    );

    child = Material(
      color: AppPalette.room,
      shape: AppShape.a6,
      textStyle: const TextStyle(fontSize: 12, color: Colors.white, height: 1),
      child: child,
    );

    child = Align(
      alignment: Alignment.centerLeft,
      child: child,
    );

    return child;
  }

  Widget msgView(BuildContext context) {
    return Env.isDebug ? XText('${vm.data}') : const XText('--');
  }
}

class NoticeMsgView extends BaseMsgView<BaseMsgData<String>> {
  const NoticeMsgView(super.vm, {super.key});

  @override
  Widget msgView(BuildContext context) {
    return XRichText(
      TextSpan(
        text: '房间公告：',
        children: [
          TextSpan(
            text: vm.data,
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

// 系统消息视图
class SystemMsgView extends BaseMsgView<BaseMsgData<String>> {
  const SystemMsgView(super.vm, {super.key});

  @override
  Widget msgView(BuildContext context) {
    InlineSpan span = TextSpan(
      children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Image.asset(
            IMG.format('room/系统消息铃铛'),
            width: 14,
            height: 14,
            scale: 3,
            fit: BoxFit.contain,
          ),
        ),
        const WidgetSpan(child: Spacing(width: 2, flex: null)),
        const TextSpan(
          text: '系统消息：',
          style: TextStyle(color: AppPalette.colorY),
        ),
        TextSpan(
          text: vm.data,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );

    return RichText(text: span, maxLines: null,);
  }
}

class SimpleTextMsg extends BaseMsgView<LocalMsgData> {

  const SimpleTextMsg(super.vm, {super.key});

  @override
  Widget msgView(BuildContext context) {
    InlineSpan span = TextSpan(
      children: [
        TextSpan(
          text: vm.data,
          style: const TextStyle(color: AppPalette.colorY),
        ),
      ],
    );

    return RichText(text: span, maxLines: null,);
  }
}