import 'package:json_annotation/json_annotation.dart';

class EpochDateTimeConverter implements JsonConverter<DateTime?, int?> {
  const EpochDateTimeConverter();

  @override
  DateTime? fromJson(int? json) {
    return json == null || json == 0 ? null : DateTime.fromMillisecondsSinceEpoch(json);
  }

  @override
  int? toJson(DateTime? object) {
    return object?.millisecondsSinceEpoch;
  }
}
