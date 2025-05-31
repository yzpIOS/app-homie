// ignore_for_file: constant_identifier_names

enum RoomState { None, Normal, Mini }

enum RoomHudState { None, Normal, Camera }

enum RoomType {
  err(-1, 'Err'),
  customize(1, '自定义'),
  guild(2, '公会'),
  square(3, '广场'),

  person(4, '个播'), // 个人直播
  ;

  final int code;
  final String label;

  const RoomType(this.code, this.label);

  static RoomType fromVal(int? val) {
    if (val is! int) return RoomType.err;

    return RoomType.values.firstWhere((it) => it.code == val, orElse: () => RoomType.err);
  }
}
