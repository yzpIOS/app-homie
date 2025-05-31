import 'dart:convert' as convert;
import 'package:app/3rd/tencent/im.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/im/chat_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/message/input/input_view.dart';
import 'package:app/ui/message/msg_adapter/data/base_adapter.dart';
import 'package:app/ui/message/msg_adapter/view/base_adapter.dart';
import 'package:app/ui/message/msg_adapter/view/user_adapter.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../store/im/conv_manager_ctrl.dart';
import '../../my/wealth_level_page.dart';

typedef ChatCtrlFactory = ChatCtrl Function();

class ChatPage extends StatelessWidget {
  static const routeName = '/Chat';

  const ChatPage({super.key});

  static void to(ChatCtrl callBack) async {

    // if(!(await OAuthCtrl.checkValid())) {
    //   return Future.value(0);
    // }
    Get.toNamed(routeName, arguments: callBack);
  }


  static void to2(ChatCtrlFactory callBack, UID uid, {bool needCheckValid = true}) async {
    // if(needCheckValid && !(await OAuthCtrl.checkValid())) {
    //   return Future.value(0);
    // }
    ChatCtrl chatCtrl = callBack.call();

    if(needCheckValid) {
      var result = await Api.Common.getImPermission();
      // 不能聊天，
      if(result["is_single_chat"] == null || result["is_single_chat"] == false) {
        int level = int.tryParse(result["level"] ?? "0") ?? 0;
        if(level >= 10) {
          showToast("加入公会，可主动私信");
          return;
        }
        // 那么判断有没有消息
        // 4、用户在不是主播以及财富等级未达到10级的情况下去主动私信，系统会给出
        // 【你的财富等级未满足10级，暂时未开通主动私信功能，弹窗下方增加一个等级说明，点击即可查看】提示。
        try {
          // 待待初始化完成
          ConvManagerCtrl convManagerCtrl = Get.find<ConvManagerCtrl>();
          bool hasMessage = await convManagerCtrl.haseMessage(uid);
          if(hasMessage == false) {
            CommonDialog.simpleText("你的财富等级未满足10级，暂时未开通主动私信功能", okText: "查看待级", confirm: () {
              Get.to(() => WealthLevelPage(uid: OAuthCtrl.uid ?? ""));
            });
            return;
          }
        } catch(e, s) {
          //debugPrint("aa");
        }
      }
    }

    Get.toNamed(routeName, arguments: chatCtrl);
  }

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
        backgroundColor: (_ctrl.type == TYPE_SYSTEM_MSG) ? const Color(0XFFF5F5F5) : null,
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
      final followOnlineData = _ctrl.followOnlineRx();

      if (_ctrl.conv.isSycConv || followOnlineData.isEmpty || followOnlineData['room_id'] == null || followOnlineData['room_id'] == 0) {
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
              child: NetImage(followOnlineData['image'] ?? '', fit: BoxFit.cover),
            ),
            Padding(
              padding: const Pad(left: 5, right: 2),
              child: Image.asset(IMG.format('chat/直播跟随'), width: 18, height: 18, scale: 3, fit: BoxFit.contain),
            ),
            Expanded(child: Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 14, color: AppPalette.txtDark, fontWeight: fw$Regular),
                children: [
                  const TextSpan(text: 'TA正在',),
                  TextSpan(text: '【${followOnlineData['room_name']}】', style: const TextStyle(fontSize: 14, color: AppPalette.primary, fontWeight: fw$Regular),),
                  const TextSpan(text: '嗨聊',),
                ],
              ),
              maxLines: 1,
            ),),
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
    final followOnlineData = _ctrl.followOnlineRx;

    //scene_id 场景id 0:广场
    if (followOnlineData['scene_id'] != null && followOnlineData['scene_id'] == 0) {
      Get.find<RoomManagerCtrl>().toSquare();
    } else {
      Get.find<RoomManagerCtrl>().toRoom(roomId: followOnlineData['room_id'] ?? followOnlineData['id']);
    }
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

        // 邀请入会
        var item = data[index];
        Map json;
        int type = 0;
        int subType = 0;
        try {
          json = convert.jsonDecode(item.cloudCustomData ?? "");
          type = int.tryParse(json!["type"]) ?? 0;

          json = convert.jsonDecode(json!["data"] ?? "");
          subType = int.tryParse(json!["subType"] ?? "0") ?? 0;
        } catch(e) {
        }
        if((type == TYPE_SYSTEM_MSG)) {
          // 邀请
          if(subType == SUBTYPE_INVITE_GUILD) {
            return SysMsgInviteGuild(TxtMsgAdapter(data[index]));
          }
          // 系统消息
          return SysMsgText(TxtMsgAdapter(data[index]));
        }

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
