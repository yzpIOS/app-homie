part of '../api.dart';

class ApiRoomMsg extends ApiBase {
  const ApiRoomMsg(super.path);

  Future sendMessage({required int roomId, required String message}) {
    final data = {
      'room_id': roomId,
      'message': message,
    };

    return _doPost('room-chat', data: data);
  }
}
