
import 'package:app/model/api/user_address_model.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/types.dart';

class UserInfoModel {
  late UID uid;
  int? nuid;
  String? nickName;
  GenderEnum? gender;
  String? avatarUrl;
  String? account;
  UserAddressModel? address;
  String? desc;
  String? level;
  int? growthValue;
  String? identity;
  DateTime? birthDay;
  String? avatarExtra;
  int? realNameType;
  int? fansCount;
  int? followCount;
  int? accessCount;
  String? charmLevel;
  String? remarkName;
  int? charmGrowthValue;
  bool? showWinningLottery;
  String? starSign;
  String? location;
  String? ageShow;
  String? avatarFrame;
  String? voicePartyBackground;
  String? approachSpecialEffect;
  String? chatBubble;
  bool? openBackpack;

  UserInfoModel(
      {required this.uid,
        this.nickName,
        this.gender,
        this.avatarUrl,
        this.account,
        this.address,
        this.desc,
        this.level,
        this.growthValue,
        this.identity,
        this.birthDay,
        this.avatarExtra,
        this.realNameType,
        this.fansCount,
        this.followCount,
        this.accessCount,
        this.charmLevel,
        this.remarkName,
        this.charmGrowthValue,
        this.showWinningLottery,
        this.nuid,
        this.starSign,
        this.location,
        this.ageShow,
        this.avatarFrame,
        this.voicePartyBackground,
        this.approachSpecialEffect,
        this.chatBubble,
        this.openBackpack});

  UserInfoModel.fromJson(Map<dynamic, dynamic> json) {
    uid = json['uid'] ?? "";
    nickName = json['username'];
    gender = GenderEnum.fromCode(json['sex'] ?? 0)! ;
    avatarUrl = json['avatar_url'];
    account = json['public_id'];
    address = json['addr'] != null ? UserAddressModel.fromJson(json['addr']) : null;
    desc = json['description'];
    level = json['level'];
    growthValue = json['growth_value'];
    identity = json['identity'];
    int birth = json['data_birth'] ?? 0;
    birthDay = birth == 0 ? null : DateTime.fromMillisecondsSinceEpoch(birth);
    avatarExtra = json['avatar_extra'];
    realNameType = json['real_name_type'];
    fansCount = json['fans_count'];
    followCount = json['follow_count'];
    accessCount = json['access_user_count'];
    charmLevel = json['charm_level'];
    remarkName = json['remarks_name'];
    charmGrowthValue = json['charm_growth_value'];
    showWinningLottery = json['show_winning_lottery'];
    nuid = json['role_id'];
    starSign = json['star_sign'];
    location = json['location'];
    ageShow = json['age_show'];
    avatarFrame = json['avatar_frame'];
    voicePartyBackground = json['voice_party_background'];
    approachSpecialEffect = json['approach_special_effect'];
    chatBubble = json['chat_bubble'];
    openBackpack = json['open_backpack'];
  }

  UserInfoModel.fromApiJson({required UID userUid,required Map<dynamic, dynamic> json,}) {
    uid = userUid;
    nickName = json['username'];
    gender = GenderEnum.fromCode(json['sex'] ?? 0)! ;
    avatarUrl = json['avatar_url'];
    account = json['public_id'];
    address = json['addr'] != null ? UserAddressModel.fromJson(json['addr']) : null;
    desc = json['description'];
    level = json['level'];
    growthValue = json['growth_value'];
    identity = json['identity'];
    int birth = json['data_birth'] ?? 0;
    birthDay = birth == 0 ? null : DateTime.fromMillisecondsSinceEpoch(birth);
    avatarExtra = json['avatar_extra'];
    realNameType = json['real_name_type'];
    fansCount = json['fans_count'];
    followCount = json['follow_count'];
    accessCount = json['access_user_count'];
    charmLevel = json['charm_level'];
    remarkName = json['remarks_name'];
    charmGrowthValue = json['charm_growth_value'];
    showWinningLottery = json['show_winning_lottery'];
    nuid = json['role_id'];
    starSign = json['star_sign'];
    location = json['location'];
    ageShow = json['age_show'];
    avatarFrame = json['avatar_frame'];
    voicePartyBackground = json['voice_party_background'];
    approachSpecialEffect = json['approach_special_effect'];
    chatBubble = json['chat_bubble'];
    openBackpack = json['open_backpack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = this.uid;
    data['username'] = this.nickName;
    data['sex'] = this.gender != null ? this.gender!.code : 0;
    data['avatar_url'] = this.avatarUrl;
    data['public_id'] = this.account;
    data['addr'] = this.address?.toJson();
    data['description'] = this.desc;
    data['level'] = this.level;
    data['growth_value'] = this.growthValue;
    data['identity'] = this.identity;
    data['data_birth'] = this.birthDay == null ? 0 : this.birthDay?.millisecondsSinceEpoch;
    data['avatar_extra'] = this.avatarExtra;
    data['real_name_type'] = this.realNameType;
    data['fans_count'] = this.fansCount;
    data['follow_count'] = this.followCount;
    data['access_user_count'] = this.accessCount;
    data['charm_level'] = this.charmLevel;
    data['remarks_name'] = this.remarkName;
    data['charm_growth_value'] = this.charmGrowthValue;
    data['show_winning_lottery'] = this.showWinningLottery;
    data['role_id'] = this.nuid;
    data['star_sign'] = this.starSign;
    data['location'] = this.location;
    data['age_show'] = this.ageShow;
    data['avatar_frame'] = this.avatarFrame;
    data['voice_party_background'] = this.voicePartyBackground;
    data['approach_special_effect'] = this.approachSpecialEffect;
    data['chat_bubble'] = this.chatBubble;
    data['open_backpack'] = this.openBackpack;
    return data;
  }

  String get showName{
    if(remarkName != null && remarkName!.isNotEmpty){
      return remarkName!;
    }else if(nickName != null && nickName!.isNotEmpty){
      return nickName!;
    }else if(account != null && account!.isNotEmpty){
      return account!;
    }else{
      return uid;
    }
  }
}

extension UserInfoOnMap on Map {
  String showName() {
    String? tmp;
    tmp = this["remarks_name"];
    if (tmp != null && tmp.isNotEmpty) return tmp;
    tmp = this["username"];
    if (tmp != null && tmp.isNotEmpty) return tmp;
    tmp = this["account"];
    if (tmp != null && tmp.isNotEmpty) return tmp;
    return this["uid"];
  }
}
