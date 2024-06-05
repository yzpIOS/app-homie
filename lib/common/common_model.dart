class DailyTaskAllItems {
  int? code;
  String? reqId;
  String? msg;
  Data? data;

  DailyTaskAllItems({this.code, this.reqId, this.msg, this.data});

  DailyTaskAllItems.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    reqId = json['req_id'];
    msg = json['msg'];
    data = json != null ? new Data.fromJson(json) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['req_id'] = this.reqId;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<DailyTaskItems>? dailyTaskItems;
  List<DailyTaskLivenessItems>? dailyTaskLivenessItems;
  List<Items>? items;
  Data({this.dailyTaskItems, this.dailyTaskLivenessItems, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['daily_task_items'] != null) {
      dailyTaskItems = <DailyTaskItems>[];
      json['daily_task_items'].forEach((v) {
        dailyTaskItems!.add(new DailyTaskItems.fromJson(v));
      });
    }
    if (json['daily_task_liveness_items'] != null) {
      dailyTaskLivenessItems = <DailyTaskLivenessItems>[];
      json['daily_task_liveness_items'].forEach((v) {
        dailyTaskLivenessItems!.add(new DailyTaskLivenessItems.fromJson(v));
      });
    }

    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dailyTaskItems != null) {
      data['daily_task_items'] =
          this.dailyTaskItems!.map((v) => v.toJson()).toList();
    }
    if (this.dailyTaskLivenessItems != null) {
      data['daily_task_liveness_items'] =
          this.dailyTaskLivenessItems!.map((v) => v.toJson()).toList();
    }

    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DailyTaskItems {
  int? id;
  String? title;
  String? desc;
  String? cover;
  int? type;
  int? value;
  int? addLiveness;
  int? prizeId;
  int? prizeType;
  int? count;
  int? scheduleValue;
  bool? isReceive;
  bool? isReceived;
  String? prizeImage;

  DailyTaskItems(
      {this.id,
        this.title,
        this.desc,
        this.cover,
        this.type,
        this.value,
        this.addLiveness,
        this.prizeId,
        this.prizeType,
        this.count,
        this.scheduleValue,
        this.isReceive,
        this.isReceived,
        this.prizeImage});

  DailyTaskItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    cover = json['cover'];
    type = json['type'];
    value = json['value'];
    addLiveness = json['add_liveness'];
    prizeId = json['prize_id'];
    prizeType = json['prize_type'];
    count = json['count'];
    scheduleValue = json['schedule_value'];
    isReceive = json['is_receive'];
    isReceived = json['is_received'];
    prizeImage = json['prize_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['cover'] = this.cover;
    data['type'] = this.type;
    data['value'] = this.value;
    data['add_liveness'] = this.addLiveness;
    data['prize_id'] = this.prizeId;
    data['prize_type'] = this.prizeType;
    data['count'] = this.count;
    data['schedule_value'] = this.scheduleValue;
    data['is_receive'] = this.isReceive;
    data['is_received'] = this.isReceived;
    data['prize_image'] = this.prizeImage;
    return data;
  }
}

class DailyTaskLivenessItems {
  int? id;
  String? name;
  String? receiveCover;
  int? value;
  int? prizeId;
  int? prizeType;
  int? count;
  int? scheduleValue;
  String? notReceiveCover;
  String? receivedCover;
  bool? isReceive;
  bool? isReceived;
  String? prizeImage;
  String? prizeName;

  DailyTaskLivenessItems(
      {this.id,
        this.name,
        this.receiveCover,
        this.value,
        this.prizeId,
        this.prizeType,
        this.count,
        this.scheduleValue,
        this.notReceiveCover,
        this.receivedCover,
        this.isReceive,
        this.isReceived,
        this.prizeImage,
        this.prizeName});

  DailyTaskLivenessItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    receiveCover = json['receive_cover'];
    value = json['value'];
    prizeId = json['prize_id'];
    prizeType = json['prize_type'];
    count = json['count'];
    scheduleValue = json['schedule_value'];
    notReceiveCover = json['not_receive_cover'];
    receivedCover = json['received_cover'];
    isReceive = json['is_receive'];
    isReceived = json['is_received'];
    prizeImage = json['prize_image'];
    prizeName = json['prize_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['receive_cover'] = this.receiveCover;
    data['value'] = this.value;
    data['prize_id'] = this.prizeId;
    data['prize_type'] = this.prizeType;
    data['count'] = this.count;
    data['schedule_value'] = this.scheduleValue;
    data['not_receive_cover'] = this.notReceiveCover;
    data['received_cover'] = this.receivedCover;
    data['is_receive'] = this.isReceive;
    data['is_received'] = this.isReceived;
    data['prize_image'] = this.prizeImage;
    data['prize_name'] = this.prizeName;
    return data;
  }

}


class Items {
  int? id;
  String? title;
  String? desc;
  String? cover;
  int? type;
  int? value;
  int? prizeId;
  int? prizeType;
  int? count;
  int? scheduleValue;
  bool? isReceive;
  bool? isReceived;
  String? prizeImage;

  Items(
      {this.id,
        this.title,
        this.desc,
        this.cover,
        this.type,
        this.value,
        this.prizeId,
        this.prizeType,
        this.count,
        this.scheduleValue,
        this.isReceive,
        this.isReceived,
        this.prizeImage});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    cover = json['cover'];
    type = json['type'];
    value = json['value'];
    prizeId = json['prize_id'];
    prizeType = json['prize_type'];
    count = json['count'];
    scheduleValue = json['schedule_value'];
    isReceive = json['is_receive'];
    isReceived = json['is_received'];
    prizeImage = json['prize_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['cover'] = this.cover;
    data['type'] = this.type;
    data['value'] = this.value;
    data['prize_id'] = this.prizeId;
    data['prize_type'] = this.prizeType;
    data['count'] = this.count;
    data['schedule_value'] = this.scheduleValue;
    data['is_receive'] = this.isReceive;
    data['is_received'] = this.isReceived;
    data['prize_image'] = this.prizeImage;
    return data;
  }
}


/// 直播间在线人数
class OnlineModel {
  int? code;
  String? reqId;
  String? msg;
  List<OnlineData>? data;

  OnlineModel({this.code, this.reqId, this.msg, this.data});

  OnlineModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    reqId = json['req_id'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <OnlineData>[];
      json['data'].forEach((v) {
        data!.add(OnlineData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['req_id'] = this.reqId;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnlineData {
  String? uid;
  int? roleId;
  String? username;
  String? avatarUrl;
  int? type;
  int? adminType;
  String? level;
  int? mikeStatus;
  int? chatStatus;

  OnlineData(
      {this.uid,
        this.roleId,
        this.username,
        this.avatarUrl,
        this.type,
        this.adminType,
        this.level,
        this.mikeStatus,
        this.chatStatus});

  OnlineData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    roleId = json['role_id'];
    username = json['username'];
    avatarUrl = json['avatar_url'];
    type = json['type'];
    adminType = json['admin_type'];
    level = json['level'];
    mikeStatus = json['mike_status'];
    chatStatus = json['chat_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['role_id'] = this.roleId;
    data['username'] = this.username;
    data['avatar_url'] = this.avatarUrl;
    data['type'] = this.type;
    data['admin_type'] = this.adminType;
    data['level'] = this.level;
    data['mike_status'] = this.mikeStatus;
    data['chat_status'] = this.chatStatus;
    return data;
  }
}
