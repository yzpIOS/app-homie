/// 公会角色
class GuildRoleModel {
  String? guildNo;
  String? anchorLedgerRatio;
  int? anchorType;

  GuildRoleModel({this.guildNo, this.anchorLedgerRatio, this.anchorType});

  GuildRoleModel.fromJson(Map<dynamic, dynamic> json) {
    guildNo = json['guild_no'];
    anchorLedgerRatio = json['anchor_ledger_ratio'];
    anchorType = json['anchor_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['guild_no'] = guildNo;
    data['anchor_ledger_ratio'] = anchorLedgerRatio;
    data['anchor_type'] = anchorType;
    return data;
  }
}
