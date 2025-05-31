import 'package:json_annotation/json_annotation.dart';

class MediaConverter implements JsonConverter<List?, Map?> {
  const MediaConverter();

  @override
  List? fromJson(Map? json) {
    final data = json?['media_items'];

    return data is List ? data : null;
  }

  @override
  Map? toJson(List? object) => throw UnimplementedError();
}
