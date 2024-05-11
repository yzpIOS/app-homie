import 'package:app/widgets.dart';

class RoomInfoModel {
  int? roomId;
  String? uid;
  String? roomName;
  String? roomNo;
  int? roomType;
  int? sceneId;
  int? hotValue;
  int? payStatus;
  int? privateStatus;
  int? mikeStatus;
  int? mikeNum;
  int? maxNum;
  String? image;
  int? status;
  String? startTime;
  int? weight;
  String? createdAt;
  int? onlineNum;
  int? classifyId;
  String? classifyName;
  List? classifyIconColor;

  RoomInfoModel(
      {this.roomId,
        this.uid,
        this.roomName,
        this.roomNo,
        this.roomType,
        this.sceneId,
        this.hotValue,
        this.payStatus,
        this.privateStatus,
        this.mikeStatus,
        this.mikeNum,
        this.maxNum,
        this.image,
        this.status,
        this.startTime,
        this.weight,
        this.createdAt,
        this.onlineNum,
        this.classifyId,
        this.classifyName,
        this.classifyIconColor});

  RoomInfoModel.fromJson(Map<dynamic, dynamic> json) {
    roomId = json['room_id'];
    uid = json['uid'];
    roomName = json['room_name'];
    roomNo = json['room_no'];
    roomType = json['room_type'];
    sceneId = json['scene_id'];
    hotValue = json['hot_value'];
    payStatus = json['pay_status'];
    privateStatus = json['private_status'];
    mikeStatus = json['mike_status'];
    mikeNum = json['mike_num'];
    maxNum = json['max_num'];
    image = json['image'];
    status = json['status'];
    startTime = json['start_time'];
    weight = json['weight'];
    createdAt = json['created_at'];
    onlineNum = json['online_num'];
    classifyId = json['classify_id'];
    classifyName = json['classify_name'];
    classifyIconColor = json['classify_icon_color'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room_id'] = roomId;
    data['uid'] = uid;
    data['room_name'] = roomName;
    data['room_no'] = roomNo;
    data['room_type'] = roomType;
    data['scene_id'] = sceneId;
    data['hot_value'] = hotValue;
    data['pay_status'] = payStatus;
    data['private_status'] = privateStatus;
    data['mike_status'] = mikeStatus;
    data['mike_num'] = mikeNum;
    data['max_num'] = maxNum;
    data['image'] = image;
    data['status'] = status;
    data['start_time'] = startTime;
    data['weight'] = weight;
    data['created_at'] = createdAt;
    data['online_num'] = onlineNum;
    data['classify_id'] = classifyId;
    data['classify_name'] = classifyName;
    data['classify_icon_color'] = classifyIconColor ?? [];
    return data;
  }

  List<Color> get classifyIconColorList {
    Color defaultColor = const Color(0xFFAEC4FF);
    if(classifyIconColor != null && classifyIconColor!.isNotEmpty){
      final colorList = <Color>[];
      for(String colorString in classifyIconColor!) {
         if(colorString.isNotEmpty) {
           colorList.add(Color(int.parse('0x$colorString')));
         }
      }
      if(colorList.isEmpty){
        //为空的时候添加默认颜色
        colorList.addAll([defaultColor,defaultColor]);
      }else if(colorList.length == 1){
        //只有一个的时候再添加一次
        colorList.add(colorList.first);
      }
      return colorList;
    }else{
      return [defaultColor,defaultColor];
    }
  }
}
