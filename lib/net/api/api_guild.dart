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
  Future guildFlowList({required PageNum page,int? startTimeStamp,int? endTimeStamp,String? roomNo}) {
    if(startTimeStamp != null && startTimeStamp! > 0 && endTimeStamp != null && endTimeStamp! > 0 && endTimeStamp < startTimeStamp){
      showToast("结束时间不能早于起始时间");
      return Future.value();
    }else{
      final Map map = {};
      if(startTimeStamp != null && startTimeStamp! > 0){
        map['start_time'] = startTimeStamp;
      }
      if(endTimeStamp != null && endTimeStamp! > 0){
        map['end_time'] = endTimeStamp;
      }
      if(roomNo != null && roomNo.isNotEmpty){
        map['room_no'] = roomNo;
      }
      return _doPost('statistics', data: page + map);
    }
  }
}
