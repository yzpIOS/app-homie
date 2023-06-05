import 'package:get/get.dart';

enum SysConvEnum {
  like('1', '赞'),
  at('2', '评论和@'),
  guest('3', '我的访客'),
  follow('4', '新的关注'),
  news('5', '系统消息'),
  notice('6', '官方通知'),
  dressUp('7', '装扮'),
  gift('8', '礼物'),
  ;

  final String val;
  final String label;

  const SysConvEnum(this.val, this.label);

  static SysConvEnum? fromVal(String? val) {
    if (val == null) return null;

    return SysConvEnum.values.firstWhereOrNull((it) => it.val == val);
  }
}
