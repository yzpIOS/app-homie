
///主播
class AnchorModel {
  int? roleId;
  String? username;
  String? avatarUrl;
  int? sex;
  String? phone;
  int? intoTime;
  String? publicId;
  int? ledgerRatio;
  int? status;
  int? anchorType;

  AnchorModel(
      {this.roleId,
        this.username,
        this.avatarUrl,
        this.sex,
        this.phone,
        this.intoTime,
        this.publicId,
        this.ledgerRatio,
        this.status,
        this.anchorType});

  AnchorModel.fromJson(Map<dynamic, dynamic> json) {
    roleId = json['role_id'];
    username = json['username'];
    avatarUrl = json['avatar_url'];
    sex = json['sex'];
    phone = json['phone'];
    intoTime = json['into_time'];
    publicId = json['public_id'];
    ledgerRatio = json['ledger_ratio'];
    status = json['status'];
    anchorType = json['anchor_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role_id'] = roleId;
    data['username'] = username;
    data['avatar_url'] = avatarUrl;
    data['sex'] = sex;
    data['phone'] = phone;
    data['into_time'] = intoTime;
    data['public_id'] = publicId;
    data['ledger_ratio'] = ledgerRatio;
    data['status'] = status;
    data['anchor_type'] = anchorType;
    return data;
  }

  String get intoTimeString {
    if(intoTime != null && intoTime! > 0){
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(intoTime! * 1000);
      String formattedDate = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
      return formattedDate;
    }else{
      return "";
    }
  }
}
