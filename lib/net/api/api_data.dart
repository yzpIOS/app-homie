part of '../api.dart';

class ApiData extends ApiBase {

  ApiData(): super("");

  Future<void> create(int type, {Map? data}) async {
    data = data ?? {};

    // 平台ID
    if(!data.containsKey("platID")) {
      data["platID"] = await Env.platformId;
    }

    // 渠道号
    if(!data.containsKey("channel")) {
      data["channel"] = Env.channelCode;
    }

    // 时间戳
    if(!data.containsKey("time")) {
      data["time"] = DateTime.now().millisecondsSinceEpoch;
    }

    // 用户ID
    if(!data.containsKey("uID") && OAuthCtrl.isLogin) {
      data["uID"] = OAuthCtrl.uid;
    }

    // 角色ID
    if(!data.containsKey("rID") && OAuthCtrl.isLogin) {
      data["rID"] = OAuthCtrl.nUid.toInt();
    }

    // 性别
    if(!data.containsKey("sex") && OAuthCtrl.isLogin) {
      data["sex"] = OAuthCtrl.sex.toInt();
    }

    // 名称
    if(!data.containsKey("showName") && OAuthCtrl.isLogin) {
      data["showName"] = OAuthCtrl.showName;
    }


    _doPost("/v1/data/app_event/create", data: {
      "event_type":type,
      "params_json":converter.jsonEncode(data)
    });
  }
}