/// 公会信息
class GuildModel {
  String? guildNo;
  String? icon;
  String? guildName;
  int? anchorNum;
  String? introduction;
  int? value;
  int? level;
  int? rank;
  String? createAt;

  GuildModel(
      {this.guildNo,
        this.icon,
        this.guildName,
        this.anchorNum,
        this.introduction,
        this.value,
        this.level,
        this.rank,
        this.createAt});

  GuildModel.fromJson(Map<dynamic, dynamic> json) {
    guildNo = json['guild_no'];
    icon = json['icon'];
    guildName = json['guild_name'];
    anchorNum = json['anchor_num'];
    introduction = json['introduction'];
    value = json['value'];
    level = json['level'];
    rank = json['rank'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guild_no'] = guildNo;
    data['icon'] = icon;
    data['guild_name'] = guildName;
    data['anchor_num'] = anchorNum;
    data['introduction'] = introduction;
    data['value'] = value;
    data['level'] = level;
    data['rank'] = rank;
    data['create_at'] = createAt;
    return data;
  }
}
