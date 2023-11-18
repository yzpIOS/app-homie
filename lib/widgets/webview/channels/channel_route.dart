
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';
import 'package:dartz/dartz.dart';

import 'base_bridge.dart';

class ChannelRoute extends BaseJsBridge {

  @override
  Future<bool> callMethod(ComposeModel composeModel) {
    // 返回上一页
    if(composeModel.type == "back") {
      Get.back();
      return Future.value(true);
    }

    // 获取用户信息
    if(composeModel.type == "getUserInfo") {
      callJsMethod(composeModel, result: {"token": OAuthCtrl.token, "role_id": OAuthCtrl.nUid.toInt()});
      return Future.value(true);
    }

    // 去充值
    if(composeModel.type == "toCharge") {
      Get.to(() => RechargePage(hasShowUnityView: false,));
      return Future.value(true);
    }

    callJsMethod(composeModel);
    return Future.value(true);
  }

}