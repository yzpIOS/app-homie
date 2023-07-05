// ignore_for_file: constant_identifier_names

import 'package:app/tools.dart';

// unity 发送消息到 flutter
enum Unity2AppEnum {
  FLUTTER_DEBUG,
  UTF_INIT_START, // 初始化完成通知
  UTF_SELECTED_GENDER, // 选角场景
  UTF_DETECT_BUILDING, // 靠近的建筑
  UTF_GET_ONMICROPJONE_INFO_GUILD, // 获取公会场景麦上信息
  UTF_ROLE_INFOPANEL, // 资料卡
  UTF_NETWORK_DISCONNECT, // 离线
  ;

  static Unity2AppEnum? fromName(String? val) {
    if (val == null) return null;

    return Unity2AppEnum.values.firstWhereOrNull((it) => it.name == val);
  }
}

// flutter 发送消息到 unity
enum App2UnityEnum {
  FTU_TEST, // 测试
  FTU_LOAD_SCENE, // 进入房间
  FTU_JOIN_GAME, // 加入游戏
  FTU_ALL_GOODS_LIST, //所有商品列表
  FTU_DRESSUP_CLOTH, //换上或者脱下当前商品列表
  FTU_CLEAR_CLOTH, //脱下所有装扮
  FTU_CALCULATE_CLOTH, //计算穿着的结果
  FTU_GENDER_CLOTHING_SCENE, //在换装场景中推送角色性别
  FTU_ROLE_SPEAK_GUILD_SCENE, //公会场景中谁在麦上说话
  FTU_PICTURE_ENTER, //进入拍照、录屏模式
  FTU_PICTURE_EXIT, //退出拍照、录屏模式
  FTU_PICTURE_JPG, //拍照
  FTU_PICTURE_REPLAY_START, //录屏-开始
  FTU_PICTURE_REPLAY_STOP, //录屏-结束
  FTU_IPUTFIELDCONTENT, //输入框内容
  FTU_GIVEGIFT, //送出礼物
  FTU_PLAY_MOTION, //播放指定动作
  FTU_NEW_SOCKET_INFO, // 告诉unity flutter相关的socket信息
  ;
}
