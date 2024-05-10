part of '../api.dart';

class ApiGuild extends ApiBase {
  const ApiGuild(super.path);

  /// 公会排行列表
  Future guildRankList({required PageNum page}) {
    return _doPost('rank/list', data: page + {});
  }

  /// 公会详情
  Future getGuildInfo({required String guildNumber}) {
    return _doPost('detail', data: {"guild_no": guildNumber});
  }

  /// 申请加入公会
  Future applyJoinGuild({required String guildNumber}) {
    return _doPost('apply/join', data: {"guild_no": guildNumber});
  }

  /// 公会流水列表
  Future guildFlowList({required PageNum page,String? startTime,String? endTime}) {
    final Map map = {};
    if(startTime != null && startTime.isNotEmpty){
      map['start_time'] = startTime;
    }
    if(endTime != null && endTime.isNotEmpty){
      map['end_time'] = endTime;
    }
    return _doPost('statistics', data: page + map);
  }
}
