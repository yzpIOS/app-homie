
class CMD {
  static const S_Err = 4;//错误码


  // 创建房间场景
  static const C_CreateScene = 2100; // 创建房间场景
  static const S_CreateScene = 2101; // 返回创建房间场景结果

  static const C_CloseScene = 2103; // 关闭房间场景
  static const S_CloseScene = 2104; // 关闭房间场景结果

  static const C_JoinScene = 2112; // 加入房间场景
  static const S_JoinScene = 2113; // 加入房间场景反馈结果

  static const C_OutScene = 2114; // 退出房间场景
  static const S_OutScene = 2115; // 退出房间场景反馈结果

  static const C_AccMikeClear = 2130; // 房间麦克风计数器清除

  static const C_UpMike = 2122; // 房间上麦
  static const C_OutMike = 2124; // 房间下麦


  static const C_SetNoticeMessage = 2140; // 设置房间公告

  // =========房间相关===========
  static const S_LiveBroadcast = 2200; // 房间开关播广播

  static const S_JoinBroadcast = 2200; // 加入房间广播 【对应旧mq类型:1】
  static const S_LeaveBroadcast = 2201; // 退出房间广播 【对应旧mq类型:2】
  static const S_InviteMikeBroadcast = 2202; // 邀请上麦广播 【对应旧mq类型：3】
  static const S_UpMikeBroadcast = 2203; // 上麦广播 【对应旧mq类型：4】
  static const S_DownMikeBroadcast = 2204; // 下麦麦广播 【对应旧mq类型：5】
  static const S_NoticeBroadcast = 2240; // 房间公告广播 【对应旧mq类型：6】

  static const S_GiftPlay = 3104; // 礼物播放广播(对应mq的8)
  static const S_AdministratorBroadcast = 2208; // 房间设置管理员广播 【对应旧mq类型：9】

  static const S_BlackBroadcast = 2250; // 房间黑名单广播【对应旧mq类型：11】
  static const S_CloseMikeBroadcast = 22010; // 禁麦广播 【对应旧mq类型：12】
  static const S_OpenBroadcast = 22011; // 开麦广播 【对应旧mq类型：13】
  static const S_ApplyUpMikeBroadcast = 22012; // 申请上麦 【对应旧mq类型：14】

  static const S_UpdateLevel = 3102; // 等级提升广播（对应mq的16）
  static const S_LiveStopBroadcast = 22015; // 房间关播广播【对应旧mq类型：17】
  static const S_AccMikeBroadcast = 2230; // 房间计数器广播, 18
  static const S_UpdateCharmLevel = 3103; // 魅力等级提升广播（对应mq的19）
  static const S_ChatMessageBroadcast = 2270; // 房间聊天信息广播


  static const S_FloatingScreen = 3105; // 礼物飘屏广播(对应mq的8，和礼物播放不同的mq通道)
  static const refuseUpMic = 22013; // 房间开关播广播
  static const msgTxt = 2206; // 礼物

  // =========礼物相关===========
  static const C_GiveGiftByRoom = 3100; // 直播间赠送礼物
  static const S_GiveGiftByRoom = 3101; // 直播间赠送礼物返回


  static const C_Role = 103;//请求角色
  static const S_Role = 104;//角色(性别=0表示无角色)
}