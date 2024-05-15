/// 奖品
class ActivityLotteryModel {
  int? prizeType;
  int? prizeId;
  int? currency;
  int? price;
  String? prizeName;
  String? image;
  int? probability;

  ActivityLotteryModel(
      {this.prizeType,
        this.prizeId,
        this.currency,
        this.price,
        this.prizeName,
        this.image,
        this.probability});

  ActivityLotteryModel.fromJson(Map<dynamic, dynamic> json) {
    prizeType = json['prize_type'];
    prizeId = json['prize_id'];
    currency = json['currency'];
    price = json['price'];
    prizeName = json['prize_name'];
    image = json['image'];
    probability = json['probability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prize_type'] = this.prizeType;
    data['prize_id'] = this.prizeId;
    data['currency'] = this.currency;
    data['price'] = this.price;
    data['prize_name'] = this.prizeName;
    data['image'] = this.image;
    data['probability'] = this.probability;
    return data;
  }
}
