
import 'package:app/types.dart';

/// 认证信息
class AuthInfoModel {
   String? token;
   UID? uid;
   NUID? nuid;
   int? sex;
   int? realNameType;
   String? showName;

   AuthInfoModel({this.token, this.uid, this.nuid,this.sex, this.realNameType,this.showName});

   AuthInfoModel.fromJson(Map<dynamic, dynamic> json) {
     token = json['token'];
     uid = json['uid'];
     nuid = json['nuid'];
     sex = json['sex'];
     realNameType = json['real_name_type'];
     showName = json['show_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['uid'] = uid;
    data['nuid'] = nuid;
    data['sex'] = sex;
    data['real_name_type'] = realNameType;
    data['show_name'] = showName;
    return data;
  }
}
