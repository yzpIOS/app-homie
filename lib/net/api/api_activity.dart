part of '../api.dart';

class ApiActivity extends ApiBase {
  const ApiActivity(super.path);

  Future sign() {
    return _doPost('baily-sign');
  }

  Future list() {
    return _doPost('baily-sign/list');
  }

  Future myList() {
    return _doPost('acc-sign/list');
  }

  Future accSign(int id) {
    return _doPost('acc-sign', data: {'acc_daily_sign_id': id});
  }

  ///
  /// 查询每日任务
  /// http://192.168.1.131:3000/project/34/interface/api/7385
  ///
  Future dailyTaskQuery(){
    return _doPost("daily_task/query");
  }

  ///
  /// 领取任务奖励
  /// http://192.168.1.131:3000/project/34/interface/api/7385
  ///
  Future taskReceive({required int? id, required int taskType}){
    return _doPost("task/receive",data: {"id": id,'task_type':taskType});
  }
  ///
  /// 查询成长任务
  /// http://192.168.1.131:3000/project/34/interface/api/7385
  ///
  Future growUpTaskQuery({required int? offset, required int limit}){
    return _doPost("grow_up_task/query",data: {"offset":offset,"limit":limit});
  }

  ///
  /// 一键领取任务奖励
  /// http://192.168.1.131:3000/project/34/interface/api/7413
  ///
  Future oneKeyReceive({required int taskType}){
    return _doPost("task/one_key_receive",data: {'task_type':taskType});
  }

  ///
  /// 获取活动
  /// http://192.168.1.156:20000/project/15/interface/api/2126
  ///
  Future getBanner() {
    return _doPost("advertisement/list");
  }

  ///
  /// 查询拉新活动规则
  /// http://192.168.1.156:20000/project/15/interface/api/2275
  ///
  Future queryLotteryRule() async {
    return _doPost("pull_newcomers/query");
  }

  ///
  /// 剩余开红包次数
  ///
  Future queryLeftOpenCount() async {
    return _doPost("pull_newcomers/red_pkg/query");
  }

  ///
  /// 拆红包
  ///
  Future openEnvelope() async {
    return _doPost("pull_newcomers/red_pkg/open");
  }

  ///
  /// 邀请列表
  ///
  Future inviteList({required PageNum page}) async {
    return _doPost("pull_newcomers/invite/query", data: page + {});
  }

  ///
  /// 奖励列表
  ///
  Future prizeList({required PageNum page}) async {
    return _doPost("pull_newcomers/winning/query", data: page + {});
  }

  ///
  /// 滚动数据
  ///
  Future rollList() async {
    return _doPost("pull_newcomers/red_pkg/rolle_data");
  }

  ///
  /// 获取列表
  ///
  Future getLotteries() async {
    return _doPost("lottery/query");
  }

  ///
  /// 获取奖品列表
  ///
  Future getLotteryList(dynamic id) async {
    return _doPost("lottery/prize_pool/query", data: {"id": id});
  }

  ///
  /// 开始
  ///
  Future getStartSpin(dynamic id, int count) async {
    return _doPost("lottery/use", data: {"id": id, "count": count});
  }

  ///
  /// 获取记录
  ///
  Future getLotteryRecord(dynamic id) async {
    return _doPost("lottery/user/winning", data: {"id": id});
  }

  /// 获取水果机奖品列表
  Future getFruitMachineLotteryList() async {
    return _doPost("lottery/fruit_machine/prize_pool/query", data: {});
  }
}
