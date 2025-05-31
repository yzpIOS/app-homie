part of '../api.dart';

class ApiGuild extends ApiBase {
  const ApiGuild(super.path);

  /// 公会排行列表
  Future guildRankList({required PageNum page,String? roomNoOrRoomIdString}) {
    final Map map = {};
    if(roomNoOrRoomIdString != null && roomNoOrRoomIdString.isNotEmpty){
      map['no_or_name'] = roomNoOrRoomIdString;
    }
    return _doPost('rank/list', data: page + map);
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

  /// 公会厅流水列表
  Future guildRoomFlowList({required PageNum page,required String roomNo,int? startTimeStamp,int? endTimeStamp}) {
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
      if(roomNo.isNotEmpty){
        map['room_no'] = roomNo;
      }
      return _doPost('room/statistics', data: page + map);
    }
  }

  /// 公会主播列表
  Future guildAnchorList({required PageNum page}) {
    return _doPost('anchor/list', data: page + {});
  }

  /// 公会主播申请列表
  Future guildAnchorApplyList({required PageNum page}) {
    return _doPost('apply/list', data: page + {});
  }

  /// 处理公会主播申请
  Future handleGuildAnchorApply({required String userId,required bool isAgree}) {
    final Map map = {};
    map['status'] = isAgree ? 1 : 2;
    if(userId.isNotEmpty){
      map['public_id'] = userId;
    }
    return _doPost('apply/examine', data: map);
  }

  /// 公会主播申请数量
  Future getGuildAnchorApplyCount() {
    return _doPost('apply/total', data: {});
  }

  /// 改变房间直播状态
  Future changeGuildRoomLiveStatus({required int roomId,required bool isLive}) {
    return _doPost('room/on-off', data: {'room_id':roomId,'status':isLive ? 1 : 2});
  }

  /// 改变房间背景
  Future changeGuildRoomBackground({required int roomId,required String image}) {
    return _doPost('room/bg/edit', data: {'room_id':roomId,'image':image});
  }
}
