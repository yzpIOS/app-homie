
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/common/nets/socket/client/custom_client.dart';
import 'package:app/common/nets/socket/server/custom_local_server.dart';

class ProtoParse {
  CustomClient share;

  CustomLocalServer local;

  ProtoParse({required this.share, required this.local});

  void inject() {
    // 服务端与flutter之间的通信
    register(CMD.S_CreateScene, S_CreateScene.fromBuffer);
    register(CMD.S_Role, S_Role.fromBuffer);
    register(CMD.S_Err, S_Err.fromBuffer);
    register(CMD.S_UpMike, S_UpMike.fromBuffer);
    register(CMD.S_JoinBroadcast, S_JoinBroadcast.fromBuffer);
    register(CMD.S_LeaveBroadcast, S_LeaveBroadcast.fromBuffer);
    register(CMD.S_InviteMikeBroadcast, S_InviteMikeBroadcast.fromBuffer);
    register(CMD.S_UpMikeBroadcast, S_UpMikeBroadcast.fromBuffer);
    register(CMD.S_DownMikeBroadcast, S_DownMikeBroadcast.fromBuffer);
    register(CMD.S_NoticeBroadcast, S_NoticeBroadcast.fromBuffer);
    register(CMD.S_AdministratorBroadcast, S_AdministratorBroadcast.fromBuffer);
    register(CMD.S_BlackBroadcast, S_BlackBroadcast.fromBuffer);
    register(CMD.S_CloseMikeBroadcast, S_CloseMikeBroadcast.fromBuffer);
    register(CMD.S_OpenBroadcast, S_OpenBroadcast.fromBuffer);
    register(CMD.S_AccMikeBroadcast, S_AccMikeBroadcast.fromBuffer);
    register(CMD.S_GiftPlay, S_GiftPlay.fromBuffer);
    register(CMD.S_MoreGiftPlay, S_MoreGiftPlay.fromBuffer);
    register(CMD.S_UpdateLevel, S_UpdateLevel.fromBuffer);
    register(CMD.S_UpdateCharmLevel, S_UpdateCharmLevel.fromBuffer);
    register(CMD.S_UpdateLevelAll, S_UpdateLevel_All.fromBuffer);
    register(CMD.S_LiveStopBroadcast, S_LiveStopBroadcast.fromBuffer);
    register(CMD.S_ApplyUpMikeBroadcast, S_ApplyUpMikeBroadcast.fromBuffer);
    register(CMD.S_ChatMessageBroadcast, S_ChatMessageBroadcast.fromBuffer);
    register(CMD.S_WorldChatMessageBroadcast, S_WorldChatMessageBroadcast.fromBuffer);
    register(CMD.S_GiveGiftByRoom, S_GiveGiftByRoom.fromBuffer);
    register(CMD.S_FloatingScreen, S_FloatingScreen.fromBuffer);
    register(CMD.S_MoreGiftFloatingScreen, S_MoreGiftFloatingScreen.fromBuffer);
    register(CMD.S_JoinScene, S_JoinScene.fromBuffer);
    register(CMD.S_GoToRoom, S_GoToRoom.fromBuffer);
    register(CMD.S_InFreeMikesArea, S_InFreeMikesArea.fromBuffer);
    register(CMD.S_GiveGiftByDynamic, S_GiveGiftByDynamic.fromBuffer);
    register(CMD.S_SaveUserCurrentDressUp, S_SaveUserCurrentDressUp.fromBuffer);
    register(CMD.S_UpdateRole, S_UpdateRole.fromBuffer);
    register(CMD.S_SyncRoomInfo, S_SyncRoomInfo.fromBuffer);
    register(CMD.S_UseProductAndSaveUserCurrentDressUp, S_UseProductAndSaveUserCurrentDressUp.fromBuffer);
    register(CMD.S_CameraSwitch, S_CameraSwitch.fromBuffer);
    register(CMD.S_PKRoomList, S_PKRoomList.fromBuffer);
    register(CMD.S_PKInvite, S_PKInvite.fromBuffer);
    register(CMD.S_PKInviteResult, S_PKInviteResult.fromBuffer);
    register(CMD.S_PKContinue, S_PKContinue.fromBuffer);
    register(CMD.S_LuckScreen, S_LuckScreen.fromBuffer);
    register(CMD.S_AllScreen, S_AllScreen.fromBuffer);
    register(CMD.S_TopThree, S_TopThree.fromBuffer);
    register(CMD.S_ClearScreenBroadcast, S_ClearScreenBroadcast.fromBuffer);
    // register(CMD.S_BanChatBroadcast, S_BanChatBroadcast.fromBuffer);

    // 客户端间的通信协仪
    register(BaseClient.CONNECT_VARIFY, C_Verify.fromBuffer);
    register(BaseClient.USER_HEART_BEAT, G_UFHeart.fromBuffer);
    register(CMD.C_GoAwayRoom, C_GoAwayRoom.fromBuffer);
    register(CMD.C_OutFreeMikesArea, C_OutFreeMikesArea.fromBuffer);
    register(CMD.C_PlazaToRoom, C_PlazaToRoom.fromBuffer);
    register(CMD.C_InFreeMikesArea, C_InFreeMikesArea.fromBuffer);
    register(CMD.S_OnlineList, S_OnlineList.fromBuffer);
  }

  ///
  /// 注册反序例化protobuf模型
  ///
  void register(int cmd, OnGeneratedMessage client) {
    share.registerFromBuffers(cmd, client);
    local.registerFromBuffers(cmd, client);
  }
}