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
}
