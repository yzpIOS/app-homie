
/// Model for guild level info
class GuildLevelInfoModel {
  late String levelString;
  late String fireString;
  late String userCountString;
  late String levelImageName;

  GuildLevelInfoModel({
    required this.levelString,
    required this.fireString,
    required this.userCountString,
    required this.levelImageName,
  });

  GuildLevelInfoModel.fromJson(Map<String, dynamic> json) {
    levelString = json['levelString'];
    fireString = json['fireString'];
    userCountString = json['userCountString'];
    levelImageName = json['levelImageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['levelString'] = levelString;
    data['fireString'] = fireString;
    data['userCountString'] = userCountString;
    data['levelImageName'] = levelImageName;
    return data;
  }
}