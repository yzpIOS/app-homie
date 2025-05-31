import 'dart:convert';
import 'dart:io';

import 'package:app/3rd/tencent/im.dart';
import 'package:app/model/enum/sys_conv_enum.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:flutter/widgets.dart';

abstract class _Adapter<T> {
  final V2TimMessage msg;

  _Adapter(this.msg);

  String get msgId => msg.msgID!;

  late final JMap localExt = () {
    final json = msg.localCustomData;

    if (json != null && json.isNotEmpty) {
      try {
        return jsonDecode(json);
      } catch (e, s) {
        errLog(e, s);
      }
    }

    return <String, dynamic>{};
  }();

  void updateLocalExt(String k, dynamic v) {
    localExt[k] = v;

    final json = jsonEncode(localExt);

    IM.chat.setLocalCustomData(msgID: msgId, localCustomData: json);
  }

  abstract final T body;
}

mixin _SizeMixin<T> on _Adapter<T> {
  late final _ratio = Get.pixelRatio;

  late final size = () {
    Size? sizeGet(Tuple2<num?, num?> data) {
      final width = data.value1, height = data.value2;

      if (width != null && height != null && width > 0 && height > 0) {
        return Size(width / _ratio, height / _ratio);
      }

      return null;
    }

    return sizeGet(_localSize) ?? sizeGet(_attachSize);
  }();

  Tuple2<num?, num?> get _localSize {
    final Map? size = localExt['size'];

    return Tuple2(size?['width'], size?['height']);
  }

  Tuple2<num?, num?> get _attachSize;
}

class MsgAdapter<T> extends _Adapter<T> {
  final bool isSend;
  final int status;
  final bool isPeerRead;

  MsgAdapter(super.msg)
      : status = msg.status!,
        isSend = msg.isSend,
        isPeerRead = msg.isPeerRead!;

  @override
  T get body => throw 'Err';
}

class TxtMsgAdapter extends MsgAdapter<V2TimTextElem> {
  TxtMsgAdapter(super.msg);

  String get txt {
    return body.text!;
    // return msg.userID != null && msg.userID!.startsWith('service_') ? body.text! : FiltrationChatText.filterChat(body.text!);
  }

  @override
  V2TimTextElem get body => msg.textElem!;
}


class ExtMsgAdapter extends MsgAdapter<V2TimTextElem> {
  final Map ext;
  final SysConvEnum type;

  ExtMsgAdapter(super.msg, {required this.type, required String json}) : ext = jsonDecode(json);

  String get txt => body.text!;

  @override
  V2TimTextElem get body => msg.textElem!;
}

class ImgMsgAdapter extends MsgAdapter<V2TimImageElem> with _SizeMixin {
  ImgMsgAdapter(super.msg);

  File? get localFile {
    return body.path?.let(File.new);
  }

  String get thumbUrl {
    return body.imageList!.last!.url!;
  }

  String get originalUrl {
    return body.imageList!.first!.url!;
  }

  @override
  V2TimImageElem get body => msg.imageElem!;

  @override
  Tuple2<num?, num?> get _attachSize {
    final biggest = body.imageList?.first;

    return Tuple2(biggest?.width, biggest?.height);
  }
}

class VideoMsgAdapter extends MsgAdapter<V2TimVideoElem> with _SizeMixin {
  VideoMsgAdapter(super.msg);

  File? get localFile {
    return body.videoPath?.let(File.new);
  }

  List<File?> get localThumb {
    return [
      body.snapshotPath?.let(File.new),
      body.localSnapshotUrl?.let(File.new),
    ];
  }

  @override
  V2TimVideoElem get body {
    return msg.videoElem!;
  }

  @override
  Tuple2<num?, num?> get _attachSize {
    return Tuple2(body.snapshotWidth, body.snapshotHeight);
  }
}

class VoiceMsgAdapter extends MsgAdapter<V2TimSoundElem> {
  VoiceMsgAdapter(super.msg);

  File? get localFile {
    return body.path?.let(File.new);
  }

  Duration get dur {
    return Duration(milliseconds: body.duration ?? 0);
  }

  @override
  V2TimSoundElem get body => msg.soundElem!;
}
