
/// 公会流水
class GuildFlowModel {
  int? roomId;
  String? roomNo;
  String? roomName;
  int? amount;

  GuildFlowModel({this.roomId, this.roomNo, this.roomName, this.amount});

  GuildFlowModel.fromJson(Map<dynamic, dynamic> json) {
    roomId = json['room_id'];
    roomNo = json['room_no'];
    roomName = json['room_name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['room_id'] = roomId;
    data['room_no'] = roomNo;
    data['room_name'] = roomName;
    data['amount'] = amount;
    return data;
  }
}
