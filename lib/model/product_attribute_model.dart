

class ProductAttributeModel {
  int? id;
  String? key;
  String? value;

  ProductAttributeModel({this.id, this.key, this.value});

  ProductAttributeModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}