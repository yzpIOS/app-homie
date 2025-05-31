/// 活动配置
class ActivityConfigModel {
  int? lotteryPrice;
  int? mode;
  int? id;

  ActivityConfigModel({this.lotteryPrice, this.mode, this.id});

  ActivityConfigModel.fromJson(Map<dynamic, dynamic> json) {
    lotteryPrice = json['lottery_price'];
    mode = json['mode'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lottery_price'] = this.lotteryPrice;
    data['mode'] = this.mode;
    data['id'] = this.id;
    return data;
  }
}
