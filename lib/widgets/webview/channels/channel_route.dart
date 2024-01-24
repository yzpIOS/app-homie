
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/backpack/v1/backpack_page.dart';
import 'package:app/ui/my/wallet/exchange_page.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';
import 'package:app/ui/my/wallet/wallet_page.dart';
import 'package:dartz/dartz.dart';

import 'base_bridge.dart';

class ChannelRoute extends BaseJsBridge {

  @override
  Future<bool> callMethod(ComposeModel composeModel) async {
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
      await Get.to(() => RechargePage(hasShowUnityView: false,));
      callJsMethod(composeModel);
      return Future.value(true);
    }

    // 去钱包
    if(composeModel.type == "toWallet") {
      await Get.to(() => const WalletPage());
      callJsMethod(composeModel);
      return Future.value(true);
    }

    // 去兑换紫砖
    if(composeModel.type == "toExchange") {
      await Get.to(() => const ExchangePage());
      callJsMethod(composeModel);
      return Future.value(true);
    }

    // 去背包
    if(composeModel.type == "toBackPage") {
      await Get.to(() => const BackpackPage());
      callJsMethod(composeModel);
      return Future.value(true);
    }

    // 去直播间
    if(composeModel.type == "toRoom") {
      var roomId = composeModel.getData("roomId");
      if(roomId == null || roomId.isEmpty) {
        callJsMethod(composeModel);
        return Future.value(true);
      }
      RoomManagerCtrl.ins.toRoom(roomId: roomId);
      callJsMethod(composeModel);
    }

    return Future.value(true);
  }

}