
/// 公会厅流水
class GuildRoomFlowModel {
  String? date;
  int? amount;

  GuildRoomFlowModel({this.date, this.amount});

  GuildRoomFlowModel.fromJson(Map<dynamic, dynamic> json) {
    date = json['date'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['amount'] = amount;
    return data;
  }
}