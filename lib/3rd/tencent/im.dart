import 'package:app/3rd/tencent/keys.dart';
import 'package:app/event/event.dart';
import 'package:app/tools.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimSDKListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/log_level_enum.dart';
import 'package:tencent_cloud_chat_sdk/enum/message_elem_type.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_callback.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_status.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_value_callback.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';

export 'package:tencent_cloud_chat_sdk/enum/V2TimAdvancedMsgListener.dart';
export 'package:tencent_cloud_chat_sdk/enum/V2TimConversationListener.dart';
export 'package:tencent_cloud_chat_sdk/enum/conversation_type.dart';
export 'package:tencent_cloud_chat_sdk/enum/history_msg_get_type_enum.dart';
export 'package:tencent_cloud_chat_sdk/enum/message_elem_type.dart';
export 'package:tencent_cloud_chat_sdk/enum/message_status.dart';
export 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
export 'package:tencent_cloud_chat_sdk/models/v2_tim_image_elem.dart';
export 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';
export 'package:tencent_cloud_chat_sdk/models/v2_tim_sound_elem.dart';
export 'package:tencent_cloud_chat_sdk/models/v2_tim_text_elem.dart';
export 'package:tencent_cloud_chat_sdk/models/v2_tim_video_elem.dart';
export 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';
export 'package:tencent_im_sdk_plugin_platform_interface/models/v2_tim_msg_create_info_result.dart';
export 'package:tencent_im_sdk_plugin_platform_interface/models/v2_tim_value_callback.dart';

class IM {
  IM._();
 /// 核心管理器：
  static final $ = TencentImSDKPlugin.v2TIMManager;
/// 消息管理器：
  static final chat = $.v2TIMMessageManager;
/// 会话管理器：
  static final conv = $.v2ConversationManager;
/// 用户管理器：
  static final user = $.v2TIMFriendshipManager;

  static Future<void> init() {
    return $.initSDK(
      sdkAppID: appId,
      showImLog: canLog(LogType.IM),
      loglevel: LogLevelEnum.V2TIM_LOG_NONE,
      listener: V2TimSDKListener(
        onConnecting: () => xlog('正在连接到腾讯云服务器', type: LogType.IM),
        onConnectSuccess: () => xlog('已经成功连接到腾讯云服务器', type: LogType.IM),
        onConnectFailed: (code, error) => xlog('连接腾讯云服务器失败', type: LogType.IM),
        onUserStatusChanged: (userStatusList) => xlog('用户状态变更', type: LogType.IM),
        onSelfInfoUpdated: (info) => xlog('当前用户的资料发生了更新', type: LogType.IM),
        onKickedOffline: () {
          const NoAuthEvent('异地登录').fire();
        },
        onUserSigExpired: () {
          const NoAuthEvent('登录已经过期').fire();
        },
      ),
    );
  }

  /// 查询用户在线状态
  static Future<List<V2TimUserStatus>> getUserStatus({
    required List<String> userIDList,
  }) async {
    final res = await $.getUserStatus(userIDList: userIDList);
    if (res.code == 0) {
      return res.data ?? [];
    } else {
      return [];
    }
  }
}

extension XMessage on V2TimMessage {
  String get simpleMsg {
    switch (elemType) {
      case MessageElemType.V2TIM_ELEM_TYPE_NONE:
        break;
      case MessageElemType.V2TIM_ELEM_TYPE_TEXT:
        // String text = textElem?.text ?? (Env.isDebug ? 'Err' : '');
        // return userID != null && userID!.startsWith('service_') ? text : FiltrationChatText.filterChat(text);
        return textElem?.text ?? (Env.isDebug ? 'Err' : '');
      case MessageElemType.V2TIM_ELEM_TYPE_IMAGE:
        return '[图片]';
      case MessageElemType.V2TIM_ELEM_TYPE_SOUND:
        return '[语音]';
      case MessageElemType.V2TIM_ELEM_TYPE_VIDEO:
        return '[视频]';
      case MessageElemType.V2TIM_ELEM_TYPE_FILE:
        return '[文件]';
      case MessageElemType.V2TIM_ELEM_TYPE_LOCATION:
        return '[位置]';
      case MessageElemType.V2TIM_ELEM_TYPE_CUSTOM:
        break;
      case MessageElemType.V2TIM_ELEM_TYPE_FACE:
        break;
      case MessageElemType.V2TIM_ELEM_TYPE_GROUP_TIPS:
        break;
      case MessageElemType.V2TIM_ELEM_TYPE_MERGER:
        break;
      default:
        assert(false, this);
    }

    return '[版本过低]';
  }

  bool get isSend => isSelf == true;

  String get convId {
    return userID?.let((it) => 'c2c_$it') ?? groupID?.let((it) => 'group_$it') ?? 'Err';
  }

  DateTime? get msgTime => timestamp?.toDateTime(isMilli: false);

  bool equal(V2TimMessage target) {
    final msgId1 = msgID;
    final msgId2 = target.msgID;

    if ((msgId1 == null || msgId1.isEmpty) || (msgId2 == null || msgId2.isEmpty)) {
      return id == target.id;
    } else {
      return msgId1 == msgId2;
    }
  }
}

extension XConversation on V2TimConversation {
  String get convId => conversationID;

  bool get isSysConv {
    final uid = userID;

    return uid != null && uid.startsWith('service_');
  }
}

extension XValueCallback<T> on Future<V2TimValueCallback<T>> {
  Future<T> get dataGet async => dataOrNull.then((val) => val!);

  Future<T?> get dataOrNull {
    return then((val) {
      if (val.code != 0) throw val.desc;

      return val.data;
    });
  }
}

extension Callback<T> on Future<V2TimCallback> {
  Future<void> get isOk {
    return then((val) {
      if (val.code != 0) throw val.desc;
    });
  }
}
