
class CMD {
  static const S_Err = 4;//错误码

  static const C_UpdateRole = 124; // 更新角色数据
  static const S_UpdateRole = 125; // 更新角色数据响应

  // ==== 大厅相关 ====
  static const C_GoToRoom = 300; //靠近建筑后，请求播放直播间语音
  static const S_GoToRoom = 301; //下发直播间相关信息

  // 创建房间场景
  static const C_RoomEnterComplete = 2000; // 房间加载完成后通知后端可以同步信息，同步初始化信息到 S_SyncRoomInfo
  static const S_SyncRoomInfo = 2001; 			// 同步房间初始化信息数据

  static const C_CreateScene = 2100; // 创建房间场景=======对接完成
  static const S_CreateScene = 2101; // 返回创建房间场景结果=======对接完成

  static const C_CloseScene = 2103; // 关闭房间场景=======对接完成
  static const S_CloseScene = 2104; // 关闭房间场景结果=======对接完成

  static const C_JoinScene = 2112; // 加入房间场景=======对接完成
  static const S_JoinScene = 2113; // 加入房间场景反馈结果=======对接完成

  static const C_OutScene = 2114; // 退出房间场景, 只是退出场景，rtc还在=======对接完成
  static const S_OutScene = 2115; // 退出房间场景反馈结果=======对接完成

  static const C_AccMikeClear = 2130; // 房间麦克风计数器清除=======对接完成

  static const C_UpMike = 2122; // 房间上麦=======对接完成
  static const S_UpMike = 2123; // 房间上麦反馈结果=======对接完成
  static const C_OutMike = 2124; // 房间下麦=======对接完成

  static const C_BanMike = 2126; // 房间禁麦=======对接完成
  static const S_BanMike = 2127; // 房间禁麦反馈结果=======对接完成

  static const C_ChatMessage = 2180; // 房间聊天=======对接完成


  static const C_SetNoticeMessage = 2140; // 设置房间公告

  static const C_SetAdministrator = 2152; // 房间设置管理员
  static const S_SetAdministrator = 2153; // 房间设置管理员反馈结果

  static const C_SetBlack = 2162; // 设置房间黑名单
  static const S_SetBlack = 2163; //  设置房间黑名单反馈结果


  // =========房间相关===========
  static const S_LiveBroadcast = 2200; // 房间开关播广播

  static const S_JoinBroadcast = 2210; // 加入房间广播 【对应旧mq类型:1】）=======对接完成
  static const S_LeaveBroadcast = 2211; // 退出房间广播 【对应旧mq类型:2】）=======对接完成
  static const S_InviteMikeBroadcast = 2222; // 邀请上麦广播 【对应旧mq类型：3】
  static const S_UpMikeBroadcast = 2220; // 上麦广播 【对应旧mq类型：4】）=======对接完成
  static const S_DownMikeBroadcast = 2221; // 下麦麦广播 【对应旧mq类型：5】=======对接完成
  static const S_NoticeBroadcast = 2240; // 房间公告广播 【对应旧mq类型：6】
  static const S_MsgText = 2240; // 房间公告广播 【对应旧mq类型：7】）=======对接完成
  static const S_ChatMessageBroadcast = 2270; // 房间聊天信息广播 【对应旧mq类型：7】
  static const S_GiftPlay = 3104; // 礼物播放广播(对应mq的8)=======对接完成
  static const S_AdministratorBroadcast = 2280; // 房间设置管理员广播 【对应旧mq类型：9】=======对接完成

  static const S_BlackBroadcast = 2250; // 房间黑名单广播【对应旧mq类型：11】=======对接完成
  static const S_CloseMikeBroadcast = 2223; // 禁麦广播 【对应旧mq类型：12】
  static const S_OpenBroadcast = 2224; // 开麦广播 【对应旧mq类型：13】
  static const S_ApplyUpMikeBroadcast = 2225; // 申请上麦 【对应旧mq类型：14】

  static const S_UpdateLevel = 3102; // 等级提升广播（对应mq的16）
  static const S_LiveStopBroadcast = 2201; // 房间关播广播【对应旧mq类型：17】
  static const S_AccMikeBroadcast = 2230; // 房间计数器广播, 18=======对接完成
  static const S_UpdateCharmLevel = 3103; // 魅力等级提升广播（对应mq的19）=======对接完成


  static const S_FloatingScreen = 3105; // 礼物飘屏广播(对应mq的8，和礼物播放不同的mq通道)=======对接完成
  static const refuseUpMic = 22013; // 房间开关播广播
  static const msgTxt = 2206; // 礼物

  // =========礼物相关===========
  static const C_GiveGiftByRoom = 3100; // 直播间赠送礼物=======对接完成
  static const S_GiveGiftByRoom = 3101; // 直播间赠送礼物返回=======对接完成

  static const C_GiveGiftByDynamic = 3106; // 动态赠送礼物
  static const S_GiveGiftByDynamic = 3107; // 直动态赠送礼物返回值
  static const C_GiveGiftByIm = 3109; // 聊天赠送礼物
  static const S_GiveGiftByIm = 3110; // 聊天赠送礼物返回值


  static const C_SaveUserCurrentDressUp = 4100; // 保存用户当前装扮
  static const S_SaveUserCurrentDressUp = 4101; // 保存用户当前装扮响应


  static const C_Role = 103;//请求角色
  static const S_Role = 104;//角色(性别=0表示无角色)

  static const C_Verify = 10000;//连接验证

  static const C_GoAwayRoom = 12000; //远离建筑后，请求结束直播间语音 【服务端暂时不需要】
  static const S_GoAwayRoom = 12001; //离开建筑结果【服务端暂时不需要】

  static const C_InFreeMikesArea =12002; //发送进入自由组麦区域=======对接完成
  static const S_InFreeMikesArea =12003; //下发进入自由组麦区域=======对接完成

  static const C_OutFreeMikesArea = 12006;//发送退出自由组麦区域
  static const S_OutFreeMikesArea = 12007;//下发退出自由组麦区域

  static const C_PlazaToRoom = 12004; //发送从大厅切到其他房间（场景）消息
  static const S_PlazaToRoom = 12005; //下发从大厅切到其他房间（场景）消息

  static const C_PushPreload=12020;//告诉flutter推送要预加载的商品id列表
  static const S_PushPreload=12021;//告诉unity可以预加载哪些商品
}