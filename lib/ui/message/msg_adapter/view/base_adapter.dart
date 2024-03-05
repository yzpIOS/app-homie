import 'dart:convert';

import 'package:app/3rd/tencent/im.dart';
import 'package:app/model/enum/sys_conv_enum.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

import 'package:app/ui/message/msg_adapter/data/base_adapter.dart';
import 'package:app/ui/message/msg_adapter/view/user_adapter.dart';

typedef AdapterCreate = ViewAdapter Function(V2TimMessage msg);

final _createMap = <int, AdapterCreate>{
  MessageElemType.V2TIM_ELEM_TYPE_TEXT: (it) {
    final json = it.cloudCustomData;

    if (json != null && json.isNotEmpty) {
      try {
        final data = jsonDecode(json);

        if (data is Map) {
          final type = SysConvEnum.fromVal(data['type']);

          if (type != null) {
            final adapter = ExtMsgAdapter(it, type: type, json: data['data']);

            switch (type) {
              case SysConvEnum.dressUp:
                return DressUpMsg(adapter);
              case SysConvEnum.gift:
                return GiftMsg(adapter);
              default:
            }
          }
        }
      } catch (e, s) {
        errLog(e, s);
      }

      xlog('数据错误 -> $json');
    }

    return TxtMsg(TxtMsgAdapter(it));
  },
  MessageElemType.V2TIM_ELEM_TYPE_IMAGE: (it) => ImgMsg(ImgMsgAdapter(it)),
  MessageElemType.V2TIM_ELEM_TYPE_VIDEO: (it) => VideoMsg(VideoMsgAdapter(it)),
  MessageElemType.V2TIM_ELEM_TYPE_SOUND: (it) => VoiceMsg(VoiceMsgAdapter(it)),
};

class BaseMsgAdapter<T extends MsgAdapter> extends ViewAdapter<T> {
  const BaseMsgAdapter(super.vm, {super.key});

  static ViewAdapter from(V2TimMessage msg) {

    if(Env.isDebug) {
      return InviteGuildMsg(TxtMsgAdapter(msg));
    }


    final create = _createMap[msg.elemType];

    return create == null //
        ? BaseMsgAdapter(MsgAdapter(msg))
        : create(msg);
  }

  @override
  Widget build(BuildContext context) {
    return Env.isDebug ? XText('${vm.msg.toJson()}') : const XText('[版本过低]');
  }
}
