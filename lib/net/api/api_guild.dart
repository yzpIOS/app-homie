part of '../api.dart';

class ApiGuild extends ApiBase {
  const ApiGuild(super.path);

  /// 公会排行列表
  Future guildRankList({
    required PageNum page
  }) {
    return _doPost('rank/list', data: page + {});
  }

  /// 检查用户是否加入公会
  Future checkUserIsExistGuild({
    required String guildNumber
  }) {
    return _doPost('current/role', data:  {"guild_no":guildNumber});
  }
}