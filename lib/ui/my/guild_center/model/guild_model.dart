/// 公会信息
class GuildModel {
  String? guildNo;
  String? icon;
  String? guildName;
  int? anchorNum;
  String? introduction;
  int? level;
  int? value;
  int? rank;
  String? createAt;
  int? masterUid;
  String? masterUsername;
  String? anchorLedgerRatio;
  String? masterAvatar;

  GuildModel(
      {this.guildNo,
        this.icon,
        this.guildName,
        this.anchorNum,
        this.introduction,
        this.level,
        this.value,
        this.rank,
        this.createAt,
        this.masterUid,
        this.masterUsername,
        this.anchorLedgerRatio,
        this.masterAvatar});

  GuildModel.fromJson(Map<dynamic, dynamic> json) {
    guildNo = json['guild_no'];
    icon = json['icon'];
    guildName = json['guild_name'];
    anchorNum = json['anchor_num'];
    introduction = json['introduction'];
    level = json['level'];
    value = json['value'];
    rank = json['rank'];
    createAt = json['create_at'];
    masterUid = json['master_uid'];
    masterUsername = json['master_username'];
    anchorLedgerRatio = json['anchor_ledger_ratio'];
    masterAvatar = json['master_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guild_no'] = guildNo;
    data['icon'] = icon;
    data['guild_name'] = guildName;
    data['anchor_num'] = anchorNum;
    data['introduction'] = introduction;
    data['level'] = level;
    data['value'] = value;
    data['rank'] = rank;
    data['create_at'] = createAt;
    data['master_uid'] = masterUid;
    data['master_username'] = masterUsername;
    data['anchor_ledger_ratio'] = anchorLedgerRatio;
    data['master_avatar'] = masterAvatar;
    return data;
  }
}
