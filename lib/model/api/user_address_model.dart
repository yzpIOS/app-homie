/// 用户地址
class UserAddressModel {
  int? country;
  int? province;
  int? city;
  int? district;

  UserAddressModel({this.country, this.province, this.city, this.district});

  UserAddressModel.fromJson(Map<dynamic, dynamic> json) {
    country = json['country'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = this.country;
    data['province'] = this.province;
    data['city'] = this.city;
    data['district'] = this.district;
    return data;
  }
}
