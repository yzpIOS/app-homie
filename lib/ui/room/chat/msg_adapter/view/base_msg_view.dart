import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/chat/msg_adapter/data/base_msg_data.dart';
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
