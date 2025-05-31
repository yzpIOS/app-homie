

class ProductSkuModel {
  int? id;
  int? price;
  int? effectiveTime;
  String? effectiveTimeTxt;

  ProductSkuModel({this.id, this.price, this.effectiveTime,this.effectiveTimeTxt});

  ProductSkuModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    price = json['price'];
    effectiveTime = json['effective_time'];
    effectiveTimeTxt = json['effective_time_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['effective_time'] = this.effectiveTime;
    data['effective_time_txt'] = this.effectiveTimeTxt;
    return data;
  }
}