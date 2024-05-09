part of '../api.dart';

class ApiGuild extends ApiBase {
  const ApiGuild(super.path);

  /// 公会排行列表
  Future guildRankList({
    required PageNum page
  }) {
    return _doPost('rank/list', data: page + {});
  }
}