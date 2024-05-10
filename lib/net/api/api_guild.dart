part of '../api.dart';

class ApiGuild extends ApiBase {
  const ApiGuild(super.path);

  /// 公会排行列表
  Future guildRankList({required PageNum page}) {
    return _doPost('rank/list', data: page + {});
  }

  // /// 检查用户是否加入公会
  // Future checkUserIsExistGuild({required String guildNumber}) {
  //   return _doPost('current/role', data:guildNumber.isNotEmpty ? {"guild_no": guildNumber} : {});
  // }

  /// 公会详情
  Future getGuildInfo({required String guildNumber}) {
    return _doPost('detail', data: {"guild_no": guildNumber});
  }

  /// 申请加入公会
  Future applyJoinGuild({required String guildNumber}) {
    return _doPost('apply/join', data: {"guild_no": guildNumber});
  }
}
