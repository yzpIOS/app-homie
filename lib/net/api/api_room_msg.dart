part of '../api.dart';

class ApiRoomMsg extends ApiBase {
  const ApiRoomMsg(super.path);

  ///
  /// 房间信息发送
  ///
  Future sendMessage({required int roomId, required String message}) {
    // 创建信息
    C_ChatMessage c_chatMessage = C_ChatMessage.create();
    c_chatMessage.message = message;
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
}
