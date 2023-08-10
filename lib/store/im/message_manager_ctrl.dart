import 'dart:convert';
import 'dart:io';

import 'package:app/3rd/tencent/im.dart';
import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/model/conv.dart';
import 'package:app/net/api.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/local_notify_ctrl.dart';
import 'package:app/store/user/setting_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:fnv/fnv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_compress/video_compress.dart';

mixin class _SenderMixin {
  Stream<V2TimMessage> sendImage(ChatConv conv, Either<List<String>, List<AssetEntity>> data) {
    Stream<(File, Size?)> ifPath(List<String> data) {
      return Stream.fromIterable(data).map((it) => (File(it), null));
    }

    Stream<(File, Size?)> ifAsset(List<AssetEntity> data) {
      return Stream.fromIterable(data).asyncMap((it) async => ((await it.originFile)!, it.size));
    }

    Future<V2TimMessage> itemBuilder((File, Size?) data) async {
      final api = IM.chat.createImageMessage(
        imagePath: data.$1.path,
      );

      final size = await ImageHelp.getSize(data.$1, orElse: data.$2);

      final ext = {
        if (size != null) //
          'size': {'width': size.width, 'height': size.height},
      };

      return api.doSend(conv, localExt: ext);
    }

    return data.fold(ifPath, ifAsset).asyncMap(itemBuilder);
  }

  Stream<V2TimMessage> sendVideo(ChatConv conv, Either<List<String>, List<AssetEntity>> data) {
    Stream<(File, Size?)> ifPath(List<String> data) {
      return Stream.fromIterable(data).map((it) => (File(it), null));
    }

    Stream<(File, Size?)> ifAsset(List<AssetEntity> data) {
      return Stream.fromIterable(data).asyncMap((it) async => ((await it.originFile)!, it.size));
    }

    Future<V2TimMessage> itemBuilder((File, Size?) data) async {
      final path = data.$1.path;

      final result = await Future.wait(
        [
          VideoCompress.getMediaInfo(path),
          VideoCompress.getFileThumbnail(path, quality: 80),
        ],
      );

      final info = result[0] as MediaInfo;
      final thumb = result[1] as File;

      final api = IM.chat.createVideoMessage(
        videoFilePath: path,
        type: 'mp4',
        duration: info.duration!.toInt(),
        snapshotPath: thumb.path,
      );

      final size = await ImageHelp.getSize(thumb, orElse: data.$2);

      final ext = <String, dynamic>{
        if (size != null) //
          'size': {'width': size.width, 'height': size.height},
      };

      return api.doSend(conv, localExt: ext);
    }

    return data.fold(ifPath, ifAsset).asyncMap(itemBuilder);
  }

  Future<V2TimMessage> sendVoice(ChatConv conv, Tuple2<File, Duration> data) {
    final file = data.value1;

    final api = IM.chat.createSoundMessage(
      soundPath: file.path,
      duration: data.value2.inMilliseconds,
    );

    return api.doSend(conv);
  }

  Future<V2TimMessage> sendText(ChatConv conv, String text) {
    final api = IM.chat.createTextMessage(
      text: text,
    );

    return api.doSend(conv);
  }
}

mixin class _MsgNotifyMixin {
  late final _convCtrl = Get.find<ConvManagerCtrl>();
  late final _userCtrl = Get.find<UserInfoCtrl>();
  late final _notifyCtrl = Get.find<LocalNotifyCtrl>();
  late final _settingCtrl = Get.find<SettingCtrl>();

  void _showNotify(V2TimMessage msg) async {
    if (msg.isSend == true) return;

    if (_convCtrl.canLocalNotify(msg.convId) && await Permission.notification.isGranted) {
      final userId = msg.userID;
      final groupId = msg.groupID;

      if (userId != null && userId.isNotEmpty) {
        final uidIntVal = fnv1a_32_s(userId);

        if (userId.startsWith('service_')) {
          _showImLocalNotify(
            id: uidIntVal,
            title: '系统通知',
            body: msg.textElem?.text ?? '',
          );
        } else {
          final info = await _userCtrl.findByUidOrNull(userId, useNet: true);

          _showImLocalNotify(
            id: uidIntVal,
            title: info?.showName() ?? msg.nickName ?? msg.sender ?? '',
            body: msg.simpleMsg,
          );
        }
      } else if (groupId != null && groupId.isNotEmpty) {
        //TODO
        // _showImLocalNotify(
        //   id: hashCode,
        //   title: msg.nickName ?? msg.sender ?? '',
        //   body: msg.simpleMsg,
        // );
      } else {
        assert(false, '未处理的业务 -> $msg');
      }
    }
  }

  void _showImLocalNotify({required int id, required String title, required String body}) {
    final playSound = _settingCtrl.boolValGet('消息通知-声音');
    final enableVibration = _settingCtrl.boolValGet('消息通知-震动');

    _notifyCtrl.showImLocalNotify(
      id: id,
      title: title,
      body: body,
      playSound: playSound,
      enableVibration: enableVibration,
    );
  }
}

mixin _MsgMixin on GetxController, GetDisposableMixin {
  @override
  void onInit() {
    super.onInit();

    final listener = V2TimAdvancedMsgListener(
      onMessageDownloadProgressCallback: (event) {
        final curr = event.currentSize;
        final total = event.totalSize;

        xlog(() => '文件进度回调 -> [${event.msgID}] ${(curr / total).toStringAsPrecision(1)}', type: LogType.IM);
      },
      onRecvMessageExtensionsChanged: (msgID, extensions) {
        xlog(() => '扩展属性改变 -> $msgID,$extensions', type: LogType.IM);
      },
      onRecvMessageExtensionsDeleted: (msgID, extensionKeys) {
        xlog(() => '扩展属性被删除 -> $msgID,$extensionKeys', type: LogType.IM);
      },
      onRecvMessageModified: (msg) {
        xlog(() => '内容被修改 -> $msg', type: LogType.IM);

        MsgStateEvent(msg).fire();
      },
      onRecvMessageRevoked: (msgID) {
        xlog(() => '消息撤回 -> $msgID', type: LogType.IM);
      },
      onRecvNewMessage: (msg) {
        xlog(() => '新消息 -> $msg', type: LogType.IM);

        NewMsgEvent(msg).fire();

        _showNotify(msg);
      },
      onSendMessageProgress: (msg, progress) {
        xlog(() => '消息进度 -> $msg,$progress', type: LogType.IM);

        MsgStateEvent(msg).fire();
      },
    );

    IM.chat.addAdvancedMsgListener(listener: listener);

    bindWorker(
      Worker(
        () => IM.chat.removeAdvancedMsgListener(listener: listener),
        'DeleteMsgListener',
      ),
    );
  }

  void _showNotify(V2TimMessage msg);
}

class MessageManagerCtrl extends GetxController
    with
        BusGetLifeMixin, //
        GetDisposableMixin,
        _MsgMixin,
        _SenderMixin,
        _MsgNotifyMixin {
  Future<List<V2TimMessage>> fetchMsg(ChatConv conv, {required int limit, V2TimMessage? target, bool? queryNew}) async {
    try {
      final result = await asyncTrack(
        '加载IM消息',
        type: LogType.IM,
        action: () async {
          final getType = //
              queryNew == true
                  ? HistoryMsgGetTypeEnum.V2TIM_GET_LOCAL_NEWER_MSG
                  : HistoryMsgGetTypeEnum.V2TIM_GET_LOCAL_OLDER_MSG;

          final api = IM.chat.getHistoryMessageList(
            userID: conv.userId,
            groupID: conv.groupId,
            lastMsgID: target?.msgID,
            count: limit,
            getType: getType,
          );

          return await api.dataGet.then((val) => val.reversed.toList(growable: false));
        },
      );

      xlog('获取本地消息[${conv.convId}] => [${result.length}]条', type: LogType.IM);

      return result;
    } catch (e, s) {
      errLog(e, s);

      return [];
    }
    //</editor-fold>
  }
}

extension on Future<V2TimValueCallback<V2TimMsgCreateInfoResult>> {
  Future<V2TimMessage> doSend(ChatConv conv, {JMap? localExt}) async {
    Map<String, dynamic> mapData = await Api.UserInfo.blackListIsIn(conv.userId!) as Map<String, dynamic>;
    if (mapData['is_in'] == true) {
      throw const LogicException(-1, '消息已发出，但被对方拒收了');
    }

    final resp = await dataGet;

    final group = conv.groupId ?? '';
    final uid = conv.userId ?? '';

    final json = localExt?.let(jsonEncode);

    IM.chat
        .sendMessage(id: resp.id!, groupID: group, receiver: uid, localCustomData: json) //
        .then((val) => MsgStateEvent(val.data!).fire());

    return resp.messageInfo!.also((it) {
      it.localCustomData = json;
    });
  }
}
