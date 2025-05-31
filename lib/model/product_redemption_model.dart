

class ProductRedemptionModel {
  String? name;
  String? image;
  int? redemptionNeedCount;
  int? haveRedemptionCardCount;


  ProductRedemptionModel({this.name, this.image, this.redemptionNeedCount,this.haveRedemptionCardCount});

  ProductRedemptionModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    image = json['image'];
    redemptionNeedCount = json['redemption_need_count'];
    haveRedemptionCardCount = json['have_redemption_card_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['redemption_need_count'] = this.redemptionNeedCount;
    data['have_redemption_card_count'] = this.haveRedemptionCardCount;
    return data;
  }
}