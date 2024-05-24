class ProductLabelModel {
  String? name;
  String? icon;
  bool? isBuy;

  ProductLabelModel({this.name, this.icon, this.isBuy});

  ProductLabelModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    isBuy = json['is_buy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['is_buy'] = this.isBuy;
    return data;
  }
}