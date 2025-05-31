import 'dart:io';

import 'package:app/3rd/tencent/im.dart';
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/model/conv.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/ready_ctrl_mixin.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/im/message_manager_ctrl.dart';
import 'package:app/store/im/tool/chat_scroll_mixin.dart';
import 'package:app/store/im/tool/conv_creator.dart';
import 'package:app/store/sound_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/gift/gift_send_logic.dart';
import 'package:app/ui/gift/gift_sheet.dart';
import 'package:app/ui/message/chat/chat_app_bar.dart';
import 'package:app/ui/message/input/ext/export.dart';
import 'package:app/ui/message/input/input_ctrl.dart';
import 'package:app/ui/message/input/input_view.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message_receipt.dart';

import 'package:fixnum/fixnum.dart';
mixin GetConvMixin {
  abstract final Either<V2TimConversation, ConvCreator> _conv;

  late final ChatConv conv;

  @mustCallSuper
  Future<void> _initConv() async {
    conv = await verifyConv(
      await _conv.fold((l) => ChatConv.from(l), (r) => r.create()),
    );
  }

  FutureOr<ChatConv> verifyConv(final ChatConv conv) {
    return conv..onlyViewRx(conv.convId.startsWith('service_'));
  }
}

mixin GroupMixin on GetConvMixin {
  late final String groupId;

  @override
  Future<void> _initConv() async {
    await super._initConv();

    groupId = conv.convId;
  }
}

const int TYPE_SYSTEM_MSG = 5;
const int SUBTYPE_INVITE_GUILD = 2;

abstract class ChatCtrl extends GetxController
    with
        GetConvMixin,
        AutoScrollMixin,
        EndScrollMixin,
        BusGetLifeMixin,
        ReadyMixin,
        ReadyCtrlMixin,
        GetDisposableMixin,
        GetSingleTickerProviderStateMixin {
  final kPageSize = 20;


  int? type = 0;

  int? subType = 0;

  final msgManager = Get.find<MessageManagerCtrl>();
  final isMuteRx = false.obs;

  final oldMsgRx = RxList<V2TimMessage>();
  final newMsgRx = RxList<V2TimMessage>();

  final selectRx = Rxn<Set<String>>();

  final fullRx = Rx(true);

  final followOnlineRx = RxMap();//用户跟随关注信息数据

  late final List<V2TimMessage> msgList = CombinedListView([oldMsgRx, newMsgRx]);

  abstract final ChatAppBar appBar;
  abstract final InputConfig inputConfig;

  @override
  void onInit() async {
    super.onInit();

    await _init();

    /// 非系统消息，请求用户跟随关注信息数据
    if (!conv.isSycConv) {
      var userInfo = await UserInfoCtrl.ins.findByUidOrNull(conv.userId!, useNet: true);
      if (userInfo?.nuid != null) {
        /// 获取用户跟随关注信息
        /// follow_status	integer 是否有关注用户 1.是，0.否
        final followOnlineData = await Api.UserInfo.followOnline(nuid: Int64(userInfo!.nuid!));
        if (followOnlineData != null) {
          followOnlineRx.value = followOnlineData;
        }

        /// 是否在线
        C_RoleOnline c_roleOnline = C_RoleOnline();
        c_roleOnline.roleIdList.add(Int64(userInfo!.nuid!));
        S_RoleOnline? result = await SocketCtrl.ins.sendByteAsyncServer(
            CMD.C_RoleOnline,
            datas: c_roleOnline.writeToBuffer(),
            resCmd: CMD.S_RoleOnline
        );
        List<RoleOnline>? items = result?.items;
        if(result?.items.isEmpty == true) {
          return;
        }
        var roomOwnerInfo = result?.items.first;
        if(roomOwnerInfo != null) {
          followOnlineRx['userIsOnline'] = (roomOwnerInfo.state == RoleOnlineState.RoleOnlineStateOn);
        }
      }
    }

    final convCtrl = Get.find<ConvManagerCtrl>();
    final convId = conv.convId;

    //设置当前会话的所有消息已读
    convCtrl.markUserConvAsRead(conv.userId!);

    bindWorker(
      Worker(
        () async => convCtrl.markConvOut(convId),
        '退出会话',
      ),
    );

    convCtrl.markConvIn(convId);
  }

  //
  void changeCameraSwitch() async {

  }

  @override
  void onClose() {
    //关闭正在播放的语音
    Get.find<SoundCtrl>().player.pause();

    super.onClose();
  }

  @override
  Future<bool> onEndScroll() async {
    final target = oldMsgRx.firstOrNull ?? newMsgRx.firstOrNull;

    final result = //
        await msgManager //
            .fetchMsg(conv, target: target, limit: kPageSize)
            .minTime(const Duration(milliseconds: 618));

    if (target != null) {
      final index = result.indexWhere((it) => it.equal(target));

      if (index == -1) {
        addOldMsg(result);
      } else {
        addOldMsg(result.take(index)); //去重
      }
    } else {
      addOldMsg(result);
    }

    return result.length >= kPageSize;
  }

  @override
  Future<bool> onTopScroll() async {
    final target = newMsgRx.lastOrNull ?? oldMsgRx.lastOrNull;

    final result = //
        await msgManager //
            .fetchMsg(conv, target: target, limit: kPageSize, queryNew: true)
            .minTime(const Duration(milliseconds: 618));

    if (target != null) {
      final index = result.indexWhere((it) => it.equal(target));

      if (index == -1) {
        addNewMsg(result);
      } else {
        addNewMsg(result.skip(index + 1)); //去重
      }
    } else {
      addNewMsg(result);
    }

    return result.length >= kPageSize;
  }

  @mustCallSuper
  Future<void> _init() async {
    try {
      await _initConv();

      if (isClosed) return;

      _initMsg();

      if (isClosed) return;

      markReady();
    } catch (e, s) {
      markFail(e, s);

      rethrow;
    }
  }

  Future<void> _initMsg() async {
    bindWorker(
      ever<bool>(keyboardRx, (b) {
        if (b) animeToEnd();
      }),
    );

    on<NewMsgEvent>(
      test: (it) {
        return it.msg.convId == conv.convId;
      },
      (event) async {
        final msg = event.msg;

        if (!isClosed) {
          final items = addNewMsg(msg);
          // 设置为已读  IM.chat.sendMessageReadReceipts(messageIDList: []);
          // conv.markMessageAsRead;
          Get.find<ConvManagerCtrl>().markUserConvAsRead(conv.userId!);

          if (items != null && (autoRx.isTrue || msg.isSend)) animeToEnd();
        }
      },
    );

    /// 收到消息已读回执
    on<C2CReadReceiptEvent>(
        test: (it) {
          for (V2TimMessageReceipt element in it.receiptList) {
            return element.userID == conv.userId!;
          }
          return false;
        },
            (event) {
          if (isClosed) {
            return;
          }
          [newMsgRx, oldMsgRx].any((data) {
            for (var i = 0; i < data.length; ++i) {
              final item = data[i];

              if (item.isPeerRead == false) {
                item.isPeerRead = true;
              }
            }

            data.refresh();
            return true;
          });
        }
    );

    on<MsgStateEvent>(
      test: (it) => it.msg.convId == conv.convId,
      (event) {
        final msg = event.msg;

        [newMsgRx, oldMsgRx].any((data) {
          for (var i = 0; i < data.length; ++i) {
            final item = data[i];

            if (item.equal(msg)) {
              data
                ..[i] = msg
                ..refresh();

              return true;
            }
          }

          return false;
        });
      },
    );

    final result = await msgManager.fetchMsg(conv, limit: kPageSize);

    if (result.length < kPageSize) {
      xlog('初始化数据不足一页', type: LogType.IM);

      setFetchFlag(fetchTop: false, fetchBottom: false);
    }

    addNewMsg(result);
  }

  Iterable<V2TimMessage>? addNewMsg(data) {
    if (data is V2TimMessage) {
      if (_msgFilter(data)) {

        // if (data.elemType == MessageElemType.V2TIM_ELEM_TYPE_TEXT) {
        //   int msgLength = newMsgRx().length;
        //   if (msgLength > 0) {
        //     V2TimMessage? lastMsg;
        //     newMsgRx().reversed.forEach((a) {
        //       if (a.isSelf == false) {
        //         lastMsg ??= a;
        //         return;
        //       }
        //     });
        //     if (lastMsg != null) {
        //       bool hasMatch = FiltrationChatText.receivedNewMessageMatches(lastMsg!, data);
        //       if (hasMatch) {
        //         data.textElem!.text = '*';
        //         // newMsgRx.refresh();
        //       }
        //     }
        //   }
        // }

        newMsgRx.add(data);

        return [data];
      }
    } else if (data is Iterable<V2TimMessage>) {
      final _data = data.where(_msgFilter);

      newMsgRx.addAll(_data);

      return _data;
    } else {
      assert(false, data);
    }

    return null;
  }

  void addOldMsg(Iterable<V2TimMessage> data) {
    oldMsgRx.insertAll(0, data.where(_msgFilter));
  }

  void assignMsgData(Iterable<V2TimMessage> data) {
    newMsgRx
      ..clear()
      ..refresh();

    oldMsgRx
      ..assignAll(data.where(_msgFilter))
      ..refresh();
  }

  bool _msgFilter(V2TimMessage data) {
    switch (data.elemType) {
      case MessageElemType.V2TIM_ELEM_TYPE_TEXT:
      case MessageElemType.V2TIM_ELEM_TYPE_IMAGE:
      case MessageElemType.V2TIM_ELEM_TYPE_SOUND:
      case MessageElemType.V2TIM_ELEM_TYPE_VIDEO:
      case MessageElemType.V2TIM_ELEM_TYPE_LOCATION:
      case MessageElemType.V2TIM_ELEM_TYPE_FILE:
      case MessageElemType.V2TIM_ELEM_TYPE_CUSTOM:
        return true;
      default:
        return false;
    }
  }
}

class ChatMsgSender extends MsgSender with TxtSender, ImageSender, GiftSender, CallSender, VoiceSender {
  final ChatConv _conv;
  final VoidCallback _toEnd;
  final ValueChanged _msgAdd;
  final MessageManagerCtrl _msgManager;

  ChatMsgSender(ChatCtrl target)
      : _conv = target.conv,
        _toEnd = target.animeToEnd,
        _msgAdd = target.addNewMsg,
        _msgManager = target.msgManager;

  void $AddMsg(task) async {
    assert(task is Future<V2TimMessage> || task is Stream<V2TimMessage>, '数据错误 => [$task]');

    try {
      dynamic msgOut;

      if (task is Future<V2TimMessage>) {
        msgOut = await task;
      } else if (task is Stream<V2TimMessage>) {
        msgOut = await task.toList();
      }

      if (msgOut != null) {
        _msgAdd(msgOut);

        _toEnd();

        //加载单聊记录
        int send_at = DateTime.now().millisecondsSinceEpoch;
        await Api.Common.imSingleChatLoad(accept_uid: _conv.userId, send_at: send_at);
      }
    } on LogicException catch (e) {
      showToast(e.msg);
    } catch (e, s) {
      errLog(e, s);
    }
  }

  @override
  void callVoice() {
    //TODO
  }

  @override
  void callVideo() {
    //TODO
  }

  @override
  void sendImage(AssetEntity data) {
    $AddMsg(
      _msgManager.sendImage(_conv, Right([data])),
    );
  }

  @override
  void sendVideo(AssetEntity data) {
    $AddMsg(
      _msgManager.sendVideo(_conv, Right([data])),
    );
  }

  @override
  void sendVoice(Tuple2<File, Duration> data) {
    $AddMsg(
      _msgManager.sendVoice(_conv, data),
    );
  }

  @override
  void sendTxt(String data) {
    $AddMsg(
      _msgManager.sendText(_conv, data),
    );
  }

  @override
  void sendGift() {
    GiftSheet.show(giftSendLogic:GiftSend2ImUser(_conv.userId!));
  }
}

class SingleChatCtrl extends ChatCtrl {

  @override
  final Either<V2TimConversation, ConvCreator> _conv;

  SingleChatCtrl(this._conv);

  SingleChatCtrl.fromUid(UID uid) : _conv = Right(SingleChatConvCreator(uid));

  @override
  late final InputConfig inputConfig = InputConfig.userChat(
    conv.userId!,
    InputCtrl(ChatMsgSender(this), hint: '输入新消息'),
  );

  @override
  Future<void> _init() async {
    await super._init();

    final uid = conv.convId;
    if (!uid.startsWith('service_')) Get.find<UserInfoCtrl>().loadByNet(uid);

    bindWorker(
      Worker(
        conv.markMessageAsRead,
        '会话已读',
      ),
    );
  }

  @override
  ChatAppBar get appBar => ChatAppBar$User(conv, followOnlineRx, isMuteRx);
}

extension<T> on Future<T> {
  Future<T> minTime(Duration dur) {
    return Future.wait([this, Future.delayed(dur)]).then((it) => it[0]);
  }
}
