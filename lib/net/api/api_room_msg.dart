part of '../api.dart';

class ApiRoomMsg extends ApiBase {

  // 聊天类型，1.房间内聊天，2.世界聊天；默认，房间内聊天
  int type = 1;

  ApiRoomMsg(super.path);

  ///
  /// 房间信息发送
  ///
  Future sendMessage({required int roomId, required String message}) {
    // 打开调试界面
    if(openDebugView(message)) {
      return Future.value(1);
    }

    // 创建信息
    C_ChatMessage c_chatMessage = C_ChatMessage.create();
    c_chatMessage.message = message;
    c_chatMessage.type = type;
    // 发送信息
    SocketCtrl.ins.sendSever(
      CMD.C_ChatMessage,
      message: c_chatMessage,
    );
    return Future.value(1);


    final data = {
      'room_id': roomId,
      'message': message,
    };

    return _doPost('room-chat', data: data);
  }

  void switchWorld() {
    type = 2;
  }

  void switchRoom() {
    type = 1;
  }
}
