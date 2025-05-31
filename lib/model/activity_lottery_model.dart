/// 奖品
class ActivityLotteryModel {
  int? prizeType;
  int? prizeId;
  int? currency;
  int? price;
  String? prizeName;
  String? image;
  String? prizeImage;
  int? probability;
  int? count;

  ActivityLotteryModel(
      {this.prizeType,
        this.prizeId,
        this.currency,
        this.price,
        this.prizeName,
        this.image,
        this.prizeImage,
        this.probability,
        this.count
      });

  ActivityLotteryModel.fromJson(Map<dynamic, dynamic> json) {
    prizeType = json['prize_type'];
    prizeId = json['prize_id'];
    currency = json['currency'];
    price = json['price'];
    prizeName = json['prize_name'];
    image = json['image'];
    prizeImage = json['prize_image'];
    probability = json['probability'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prize_type'] = prizeType;
    data['prize_id'] = prizeId;
    data['currency'] = currency;
    data['price'] = price;
    data['prize_name'] = prizeName;
    data['image'] = image;
    data['prize_image'] = prizeImage;
    data['probability'] = probability;
    data['count'] = count;
    return data;
  }

  String getProbabilityString(){
    if(probability == null || probability == 0){
      return '0.00%';
    }else{
      double num = probability! / 100.0;
      //保留小数点后2位数
      return '${num.toStringAsFixed(2)}%';
    }
  }
}
