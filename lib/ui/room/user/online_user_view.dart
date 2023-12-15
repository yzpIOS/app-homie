import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/charm_level_view.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/ui/room/persion/person_room_mic_ctrl.dart';
import 'package:app/ui/room/user/room_user_sheet.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/my_tab_indicator.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/room/user/room_user_item_view.dart';
import 'package:fixnum/fixnum.dart';

class OnlineUserPage extends StatefulWidget {
  final int roomId;

  const OnlineUserPage({super.key, required this.roomId});

  @override
  State<OnlineUserPage> createState() => _OnlineUserPageState();
}

class _OnlineUserPageState extends State<OnlineUserPage> with SingleTickerProviderStateMixin {

  final data = <String, Widget>{};

  late TabController  controller;

  @override
  void initState() {
    super.initState();
    data["在线列表"] = OnlineUserView(widget.roomId);
    data["魅力榜"] = _TabViewWidget(widget.roomId, () {
      return CharmUserView(widget.roomId);
    });
    data["财富榜"] = _TabViewWidget(widget.roomId, () {
      return WealthUserView(widget.roomId);
    });

    controller = TabController(vsync: this, length: data.length);;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 17,),
        Text(
          "房间成员",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18
          ),
        ),
        Container(
          color: Color(0XFFE4E7EE),
          width: double.infinity,
          height: 1,
          margin: EdgeInsets.only(top: 17),
        ),

        Expanded(
          child: OrientationSheet.scaffold(
            title: '房间成员',
            needDivider: false,
            titleWidget: xAppBar$TabBar(
              data.keys,
              controller: controller,
              alignment: Alignment.center,
              needPadding: false,

            ),
            body: TabBarView(
              controller: controller,
              children: data.values
                  .map((it) => (_) => it)
                  .map((it) => DelayView(keepAlive: true, builder: it))
                  .toList(growable: false),
            ),
          ),
        )
      ],
    );
  }
}


///
/// 在线用户列表
///
class OnlineUserView extends SimplePageView<Map> {
  final int roomId;

  OnlineUserView(this.roomId, {super.key});

  late final _ctrl = sceneCtrl<RoomCtrl>();
  late final myRole = _ctrl.getRole(OAuthCtrl.uid);

  @override
  Future fetchPage(PageNum page) => Api.Room.onlineUser(page: page, roomId: roomId);

  @override
  BaseConfig get config {
    return const ListConfig(
      divider: Divider(indent: 18 + 70, endIndent: 10),
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final uid = item['uid'];//用户字符id
    final nuid = Int64(item['role_id']);//角色id
    final role = _ctrl.getRole(uid);
    final dataUserIsSelf = OAuthCtrl.isSelf(uid);//这条数据用户是否是我本人
    final dataUserIsOwner = role.isOwner;//这条数据用户是否是房主
    final dataUserIsManager = role.isManager;//这条数据用户是否是管理员
    /// 房主能对管理员、普通用户进行"添加"“移除”"封禁"管理员的操作
    /// 管理员能对普通用户进行“封禁”操作
    var isShowEditManagerAction = (myRole.isOwner && !dataUserIsSelf && !dataUserIsOwner);
    var isShowEditBlackListAction = (myRole.isManager && !dataUserIsSelf && !dataUserIsOwner && myRole != role);

    // 是否在个人直播间
    var isPersonRoom = _ctrl is PersonRoomCtrl;
    // 用户是否在mic上
    var isUserOnMic = false;
    PersonRoomMicCtrl? personRoomMicCtrl = null;
    if(isPersonRoom) {
      personRoomMicCtrl = ((_ctrl as PersonRoomCtrl?)?.getRoomMicCtrl() as PersonRoomMicCtrl?);
      isUserOnMic = personRoomMicCtrl?.isUserOnMic(uid) ?? false;
    }

    /// 添加或移除管理员
    Widget $EditManagerView() {
      return dataUserIsManager
          ? XOutlinedBtn(
        label: '移除',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: AppPalette.primary),
        onTap: () async {
          await Api.Room.setManager(roomId: roomId, uid: uid, isAdd: false);
          controller.updateItem(index, item);
        },
      )
          : XTextBtn(
        label: '添加',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        onTap: () async {
          await Api.Room.setManager(roomId: roomId, uid: uid, isAdd: true);
          controller.updateItem(index, item);
        },
      );
    }

    /// 拉黑用户
    Widget $EditBlackListView() {
      return XTextBtn(
        label: '封禁',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        onTap: () async {
          await Api.Room.setBlock(roomId: roomId, uid: uid, isAdd: true);
          controller.removeItem(item);
        },
      );
    }

    Widget child = Row(
      children: [
        Spacing.w10,
        Expanded(
          child: RoomUserItemView(
            uid: uid,
            role: role,
            padding: const Pad(left: 10, right: 20),
          ),
        ),
        if (isShowEditManagerAction) $EditManagerView(),
        Spacing.w6,
        if (isShowEditBlackListAction) $EditBlackListView(),
        Spacing.w6,
        // // 在线
        // if(isPersonRoom && isUserOnMic) TickDownMic(),
        // // 没有在线
        // if(isPersonRoom && !isUserOnMic) InvideOnMic(),
        Spacing.w20,
      ],
    );

    child = InkWell(
      child: child,
      onTap: () => RoomUserSheet.show(uid, nuid),
    );

    return child;
  }
}

typedef ViewManufacture = Widget Function();

class _TabViewWidget extends StatefulWidget {
  final int roomId;

  final ViewManufacture viewManufacture;

  _TabViewWidget(this.roomId, this.viewManufacture);

  @override
  State<StatefulWidget> createState() => _TabViewState();
}


class _TabViewState extends State<_TabViewWidget> with SingleTickerProviderStateMixin {

  final data = <String, Widget>{};

  late TabController  controller;

  @override
  void initState() {
    super.initState();
    data["日榜"] = widget.viewManufacture.call();
    data["周榜"] = widget.viewManufacture.call();
    data["月榜"] = widget.viewManufacture.call();

    controller = TabController(vsync: this, length: data.length);;
  }

  @override
  Widget build(BuildContext context) {

    return OrientationSheet.scaffold(
      title: '房间成员',
      needDivider: false,
      titleWidget: Container(
        width: 192,
        height: 26,
        decoration: BoxDecoration(
          color: Color(0XFFBD7CE5).withAlpha(26),
          borderRadius: BorderRadius.circular(100)
        ),
        child: xAppBar$TabBar(
          data.keys,
          controller: controller,
          alignment: Alignment.center,
          needPadding: false,
          needDownLine: false,
          isScrollable: false,
          fontSize: 12,
          height: 26,
          kItemHeight: 26,
          labelPadding: 20,
          decoration: MyUnderlineTabIndicator(
            borderRadius: BorderRadius.circular(100),
            insets: EdgeInsets.symmetric(horizontal: 8),
          ),
          labelColor:const Tuple2(Colors.white, Color(0XFF666666)),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: data.values
            .map((it) => (_) => it)
            .map((it) => DelayView(keepAlive: true, builder: it))
            .toList(growable: false),
      ),
    );
  }

}


///
/// 魅力等级排行
///
class CharmUserView extends SimplePageView<Map> {
  final int roomId;

  CharmUserView(this.roomId, {super.key});

  late final _ctrl = sceneCtrl<RoomCtrl>();
  late final myRole = _ctrl.getRole(OAuthCtrl.uid);

  @override
  Future fetchPage(PageNum page) => Api.Room.onlineUser(page: page, roomId: roomId);

  @override
  BaseConfig get config {
    return const ListConfig(
      divider: Divider(indent: 18 + 70, endIndent: 10),
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final uid = item['uid'];//用户字符id
    final nuid = Int64(item['role_id']);//角色id
    final role = _ctrl.getRole(uid);
    final dataUserIsManager = role.isManager;//这条数据用户是否是管理员

    /// 添加或移除管理员
    Widget $EditManagerView() {
      return dataUserIsManager
          ? XOutlinedBtn(
        label: '移除',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: AppPalette.primary),
        onTap: () async {
          await Api.Room.setManager(roomId: roomId, uid: uid, isAdd: false);
          controller.updateItem(index, item);
        },
      )
          : XTextBtn(
        label: '添加',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        onTap: () async {
          await Api.Room.setManager(roomId: roomId, uid: uid, isAdd: true);
          controller.updateItem(index, item);
        },
      );
    }

    /// 拉黑用户
    Widget $EditBlackListView() {
      return XTextBtn(
        label: '封禁',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        onTap: () async {
          await Api.Room.setBlock(roomId: roomId, uid: uid, isAdd: true);
          controller.removeItem(item);
        },
      );
    }

    // 排名
    Widget rank;
    if(index <= 2) {
      rank = Image.asset(IMG.format("room/rank_${index + 1}"), width: 30, height: 30,);
    } else {
      rank = Text(
        "${index + 1}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    var charmLevel = item.containsKey("charm_level") ? item["charm_level"].toString() : "";

    Widget child = Row(
      children: [
        Spacing.w12,
        rank,
        Spacing.w10,
        Expanded(
          child: RoomUserItemView(
            uid: uid,
            role: role,
            showValue: charmLevel,
          ),
        ),

        if(charmLevel.isNotEmpty) CharmLevelView(level: charmLevel, uid: uid,),
        // // 在线
        // if(isPersonRoom && isUserOnMic) TickDownMic(),
        // // 没有在线
        // if(isPersonRoom && !isUserOnMic) InvideOnMic(),
        Spacing.w20,
      ],
    );

    child = InkWell(
      child: child,
      onTap: () => RoomUserSheet.show(uid, nuid),
    );

    return child;
  }
}



///
/// 魅力等级排行
///
class WealthUserView extends SimplePageView<Map> {
  final int roomId;

  WealthUserView(this.roomId, {super.key});

  late final _ctrl = sceneCtrl<RoomCtrl>();
  late final myRole = _ctrl.getRole(OAuthCtrl.uid);

  @override
  Future fetchPage(PageNum page) => Api.Room.onlineUser(page: page, roomId: roomId);

  @override
  BaseConfig get config {
    return const ListConfig(
      divider: Divider(indent: 18 + 70, endIndent: 10),
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final uid = item['uid'];//用户字符id
    final nuid = Int64(item['role_id']);//角色id
    final role = _ctrl.getRole(uid);
    final dataUserIsManager = role.isManager;//这条数据用户是否是管理员

    /// 添加或移除管理员
    Widget $EditManagerView() {
      return dataUserIsManager
          ? XOutlinedBtn(
        label: '移除',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: AppPalette.primary),
        onTap: () async {
          await Api.Room.setManager(roomId: roomId, uid: uid, isAdd: false);
          controller.updateItem(index, item);
        },
      )
          : XTextBtn(
        label: '添加',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        onTap: () async {
          await Api.Room.setManager(roomId: roomId, uid: uid, isAdd: true);
          controller.updateItem(index, item);
        },
      );
    }

    /// 拉黑用户
    Widget $EditBlackListView() {
      return XTextBtn(
        label: '封禁',
        width: 48,
        height: 24,
        textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        onTap: () async {
          await Api.Room.setBlock(roomId: roomId, uid: uid, isAdd: true);
          controller.removeItem(item);
        },
      );
    }

    // 排名
    Widget rank;
    if(index <= 2) {
      rank = Image.asset(IMG.format("room/rank_${index + 1}"), width: 30, height: 30,);
    } else {
      rank = Text(
        "${index + 1}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    var level = item.containsKey("level") ? item["level"].toString() : "";

    Widget child = Row(
      children: [
        Spacing.w12,
        rank,
        Spacing.w10,
        Expanded(
          child: RoomUserItemView(
            uid: uid,
            role: role,
            showValue: level,
          ),
        ),

        if(level.isNotEmpty) WealthyLevelView(level: level, uid: uid,),
        // // 在线
        // if(isPersonRoom && isUserOnMic) TickDownMic(),
        // // 没有在线
        // if(isPersonRoom && !isUserOnMic) InvideOnMic(),
        Spacing.w20,
      ],
    );

    child = InkWell(
      child: child,
      onTap: () => RoomUserSheet.show(uid, nuid),
    );

    return child;
  }
}


Size boundingTextSize(String text, TextStyle style, {int maxLines = 2^31, double maxWidth = double.infinity}) {
  if (text == null || text.isEmpty) {
    return Size.zero;
  }
  final TextPainter textPainter = TextPainter(
  textDirection: TextDirection.ltr,
  text: TextSpan(text: text, style: style), maxLines: maxLines)
  ..layout(maxWidth: maxWidth);
  return textPainter.size;
}
