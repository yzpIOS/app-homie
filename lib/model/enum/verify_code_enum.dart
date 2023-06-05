// ignore_for_file: constant_identifier_names

enum VerifyCodeEnum {
  REGISTER_OR_LOGIN(1), // 注册新账号或登录
  // CHANGE_PASSWORD(2), // 登录状态下修改密码
  FIND_PASSWORD_CHANGE(3), // 非登录状态找回密码功能的修改密码
  // ANCHOR_CONFIRM(4), // 房间主播确认
  ;

  final int code;

  const VerifyCodeEnum(this.code);
}
