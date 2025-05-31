import 'package:app/model/api/moment_dto.dart';
import 'package:app/model/enum/moment_attach_enum.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:media_kit/media_kit.dart';

abstract class IMomentDataAdapter<T> extends DataAdapter<T> {
  IMomentDataAdapter(super.data);

  int? get dynamicId => null;

  String? get author;

  MomentCount? get count;

  MomentMore? get more;

  MomentContent get content;

  List<Object>? get images;

  List<Map>? get topic;

  dynamic get video;

  DateTime? get time;

  Map? get liveState;
}

class MomentDtoAdapter extends IMomentDataAdapter<Rx<MomentDto>> {
  MomentDtoAdapter(super.data);

  MomentDto get _data => data();

  @override
  late final int dynamicId = content.id;

  @override
  String get author => _data.content.author;

  @override
  MomentCount get count => _data.count;

  @override
  MomentMore get more => _data.more;

  @override
  MomentContent get content => _data.content;

  @override
  Map? get liveState => _data.liveState;

  @override
  List<Map>? get images {
    final _tmp = content.media //
        ?.whereType<Map>()
        .where((it) => MomentAttachEnum.fromVal(it['type']) == MomentAttachEnum.image);

    return _tmp != null && _tmp.isNotEmpty ? _tmp.toList(growable: false) : null;
  }

  @override
  List<Map>? get topic => _data.topic;

  @override
  Map? get video {
    return content.media //
        ?.whereType<Map>()
        .firstWhereOrNull((it) => MomentAttachEnum.fromVal(it['type']) == MomentAttachEnum.video);
  }

  @override
  DateTime? get time => content.dateTime;
}
