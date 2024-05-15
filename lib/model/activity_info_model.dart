
import 'package:app/model/activity_config_model.dart';

/// 活动信息
class ActivityInfoModel {
  String? image;
  int? type;
  String? rule;
  List<ActivityConfigModel>? lotteryItemList;

  ActivityInfoModel({this.image, this.type, this.rule,this.lotteryItemList});

  ActivityInfoModel.fromJson(Map<dynamic, dynamic> json) {
    image = json['image'];
    type = json['type'];
    rule = json['rule'];
    lotteryItemList = json['lottery_item_list'] != null ? (json['lottery_item_list'] as List).map((i) => ActivityConfigModel.fromJson(i)).toList() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['type'] = type;
    data['rule'] = rule;
    if(lotteryItemList != null && lotteryItemList!.isNotEmpty){
      data['lottery_item_list'] = lotteryItemList!.map((v) => v.toJson()).toList();
    }else{
      data['lottery_item_list'] = [];
    }
    return data;
  }
}