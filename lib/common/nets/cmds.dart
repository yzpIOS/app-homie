
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


  static const S_LiveBroadcast = 2200; // 房间开关播广播
  static const S_OnlineBroadcast = 2210; // 房间进出广播
  static const S_MikeBroadcast = 2220; // 房间上/下/禁麦广播
  static const S_AccMikeBroadcast = 2230; // 房间计数器广播
  static const S_NoticeBroadcast = 2240; // 房间公告广播
  static const S_BlackBroadcast = 2250; // 房间黑名单广播
//	S_AnchorBroadcast = 2260; // 主播广播
  static const S_ChatMessageBroadcast = 2270; // 房间聊天信息广播

  static const C_Role = 103;//请求角色
  static const S_Role = 104;//角色(性别=0表示无角色)
}