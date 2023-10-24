import 'package:app/3rd/tencent/im.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/store/im/chat_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/message/input/input_view.dart';
import 'package:app/ui/message/msg_adapter/view/base_adapter.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ChatPage extends StatelessWidget {
  static const routeName = '/Chat';

  const ChatPage({super.key});

  static void to(ChatCtrl ctrl) => Get.toNamed(routeName, arguments: ctrl);

  static void replaceChat(ChatCtrl ctrl) {
    bool close = false;

    bool predicate(Route<dynamic> route) {
      if (close) return true;

      close = ModalRoute.withName(routeName)(route);

      return false;
    }

    Get.offAllNamed(routeName, arguments: ctrl, predicate: predicate);
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.args<ChatCtrl>()!;

    return Provider<ChatCtrl>.value(
      value: ctrl,
      child: GetBuilder<ChatCtrl>(
        init: ctrl,
        global: false,
        builder: (it) => ChatView(it),
        dispose: (it) => it.controller?.onDelete(),
      ),
    );
  }
}

class ChatView extends StatefulWidget {
  final ChatCtrl ctrl;

  const ChatView(this.ctrl, {super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> with BusStateMixin {
  late final _ctrl = widget.ctrl;

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    final safePop = context.safePop;
    final closePage = context.closePage;

    void subGroupEvent(String? groupId) {
      if (groupId != null) {
        bool test(GroupEvent event) => event.groupId == groupId;

        Function(dynamic) onKicked(String msg) {
          return (_) {
            Get.alertDialog(msg).whenComplete(closePage);
          };
        }

        on<GroupDismissedEvent>(
          onKicked('当前群聊已解散'),
          test: test,
        );

        //TODO
        // on<GroupKickedOffEvent>(
        //   onKicked('你已被移出会话'),
        //   test: (it) => test(it) && AuthCtrl.isSelf(it.to),
        // );

        on<GroupQuitedEvent>((_) => closePage(), test: test);
      }
    }

    try {
      await _ctrl.ready;

      subGroupEvent(_ctrl.typeIf<GroupMixin>()?.groupId);
    } catch (e) {
      if (isEmpty(e)) {
        safePop();
      } else {
        Get.alertDialog('$e').whenComplete(safePop);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget builder() {
      return Scaffold(
        body: Obx(() {
          final b = _ctrl.fullRx();

          Widget child = $Body();

          if (b) {
            child = Column(
              children: [
                IntrinsicHeight(child: _ctrl.appBar),
                $Online(),
                Expanded(child: child),
              ],
            );
          }

          return child;
        }),
        bottomNavigationBar: _ctrl.conv.isSycConv ? null : $Bnb(),
      );
    }

    return _ctrl.readyBuild(builder: builder);
  }

  Widget $Body() => _DataView(_ctrl);

  Widget $Bnb() {
    Widget child = Obx(
      () {
        return AnimatedCrossFade(
          crossFadeState: _ctrl.selectRx.isNull() ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: _ctrl.conv.onlyViewRx() ? Spacing.blank : InputView(_ctrl.inputConfig),
          //TODO secondChild: SelectBottomBar(_ctrl),
          secondChild: Spacing.blank,
          duration: kTabScrollDuration,
          sizeCurve: Curves.easeOutCubic,
          firstCurve: Curves.easeOutCubic,
          secondCurve: Curves.easeOutCubic,
        );
      },
    );

    return Material(elevation: 4, color: Colors.white, child: child);
  }

  Widget $Online() {
    return Obx(() {
      final onlineData = _ctrl.onlineRx();

      if (_ctrl.conv.isSycConv || onlineData.isEmpty) {
        return Spacing.blank;
      }

      return Container(
        decoration: const ShapeDecoration(color: Color(0xCCF5F1FF), shape: AppShape.a6),
        padding: const Pad(horizontal: 10),
        margin: const Pad(horizontal: 20, top: 10),
        height: 40,
        child: Row(
          children: [
            Container(
              decoration: const ShapeDecoration(shape: AppShape.a4),
              clipBehavior: Clip.antiAlias,
              width: 26,
              height: 26,
              child: NetImage('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F89e0676b-c0c3-4959-bbed-bc1cf0470250%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1700646496&t=2e25b271b55d8dc7d6e76dce6e8e4f05', fit: BoxFit.cover),
            ),
            Padding(
              padding: const Pad(left: 5, right: 2),
              child: Image.asset(IMG.format('chat/直播跟随'), width: 18, height: 18, scale: 3, fit: BoxFit.contain),
            ),
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 14, color: AppPalette.txtDark, fontWeight: fw$Regular),
                children: [
                  const TextSpan(text: 'TA正在',),
                  TextSpan(text: '【${onlineData['room_name']}】', style: const TextStyle(fontSize: 14, color: AppPalette.primary, fontWeight: fw$Regular),),
                  const TextSpan(text: '嗨聊',),
                ],
              ),
            ),
            Spacing.exp,
            XTextBtn(
              label: '去找TA',
              width: 52,
              height: 20,
              textStyle: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: fw$Regular),
              onTap: toRoom,
            ),
          ],
        ),
      );
    });
  }

  /// 跳转直播间
  void toRoom() {
    Get.find<RoomManagerCtrl>().toRoom(roomId: 82);
  }
}

class _DataView extends StatelessWidget {
  final ChatCtrl controller;

  const _DataView(this.controller);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollNotification>(
      onNotification: controller.onScroll,
      child: Align(
        alignment: Alignment.topCenter,
        child: Obx(() => $DataView(controller.msgList)),
      ),
    );
  }

  Widget $DataView(List<V2TimMessage> data) {
    final length = data.length, count = length + 2;

    Widget itemBuilder(int i) {
      if (i == 0) {
        return $Loading(controller.topLoading);
      } else if (i == count - 1) {
        return $Loading(controller.bottomLoading);
      } else {
        final index = length - (i - 1) - 1;

        return BaseMsgAdapter.from(data[index]);
      }
    }

    return ScrollablePositionedList.separated(
      physics: const ClampingScrollPhysics(),
      reverse: true,
      shrinkWrap: true,
      itemScrollController: controller.scroll,
      itemPositionsListener: controller.posListener,
      itemCount: count,
      itemBuilder: (_, i) => itemBuilder(i),
      separatorBuilder: (_, i) {
        return i == 0 || i == count - 2 ? Spacing.blank : Spacing.h12;
      },
    );
  }

  Widget $Loading(RxBool loadingRx) {
    const loading = SizedBox(
      width: 56,
      height: 2,
      child: LinearProgressIndicator(),
    );

    return Box(
      height: 16,
      alignment: Alignment.center,
      child: Obx(() => loadingRx() ? loading : Spacing.blank),
    );
  }
}
