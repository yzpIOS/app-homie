
import 'dart:ffi';

import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart' as Common;
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/common/theme.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fixnum/fixnum.dart';
import 'package:app/net/api.dart';

///
/// https://www.tapd.cn/68741847/prong/stories/view/1168741847001000563
/// 管理下麦：管理在工具栏内点击下麦按钮，弹出下麦管理弹窗，管理多选或单选需要下麦人员点击下麦按钮 ，选择人员下麦。
///
class MicUserOnlineManagerSheet extends StatefulWidget {
  // 场景类
  final SceneCtrl sceneCtrl;

  MicUserOnlineManagerSheet._({required this.sceneCtrl});

  static void show() {
    final sceneCtrl = Get.find<RoomManagerCtrl>().sceneCtrl;

    OrientationSheet.show(
      child: MicUserOnlineManagerSheet._(sceneCtrl: sceneCtrl),
      decoration: const ShapeDecoration(
        shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
        color: Color(0xCC333333),
      ),
      minHeight: 0,
    );
  }

  @override
  State<MicUserOnlineManagerSheet> createState() => _UserManagerSheetState();
}

class _UserManagerSheetState extends State<MicUserOnlineManagerSheet> {

  S_OnlineList? s_syncRoomInfo;

  List<Int64> selectedIds = <Int64>[];

  @override
  void initState() {
    super.initState();
    // 获取房间在线的用户信息
    delay(100, () async {
      WaitingCtrl.obj.show();
      C_OnlineList c_roomEnterComplete = C_OnlineList.create();
      c_roomEnterComplete.roomIdList.add(Int64(widget.sceneCtrl.roomId ?? 0));
      s_syncRoomInfo = await SocketCtrl.ins.sendByteAsyncServer(
          CMD.C_OnlineList,
          datas: c_roomEnterComplete.writeToBuffer(),
          resCmd: CMD.S_OnlineList
      );
      WaitingCtrl.obj.hidden();
      if(s_syncRoomInfo?.items.isEmpty == true) {
        showToast("暂无在麦用户");
        return;
      }
      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: Pad(bottom: AppSize.safeBottom, left: 10, right: 10),
        child: Column(
          children: [
            // 房间管理， 踢下麦
            createTitle(),

            // 划线
            Divider(height: 0.5, color: const Color(0xFFCCCCCC).withAlpha(125),),

            // 房主,管理员
            // 人物列表
            createUserList(),
          ],
        ),
      ),
    );
  }

  ///
  /// 创建标题
  ///
  Widget createTitle() {
    return SizedBox(
      height: 52,
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "房间管理",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),

          // 清零
          GestureDetector(
            onTap: () {

            },
            behavior: HitTestBehavior.opaque,
            child: SizedBox(width: 60, height: 24, child: $Btn2('下麦'),),
          ),
        ],
      ),
    );
  }

  ///
  /// 用户列表
  ///
  Widget createUserList() {
    SceneMicCtrl? roomMicCtrl = widget.sceneCtrl.getRoomMicCtrl();
    if(s_syncRoomInfo == null || roomMicCtrl == null || roomMicCtrl is! RoomMicCtrl) {
      return const SizedBox();
    }

    return Expanded(
      child: Obx(() {
        // 找出的房主的信息
        Common.RoomUserInfo? roomOwner = null;
        // 麦上的用户信息列表
        List<Common.RoomUserInfo> userInMicList = [];
        // 获取麦上的用户列表
        var userList = roomMicCtrl.dataRx.values.toList();
        roomOwner = s_syncRoomInfo?.items.firstWhereOrNull((element) => element.type == 1);
        for(int index = 0; index < userList.length; index ++) {
          // 获取房主信息
          if(roomOwner?.roleId == userList[index].nUid) {
            continue;
          }
          var result = s_syncRoomInfo?.items.firstWhereOrNull((element) => element.roleId == userList[index].nUid);
          // 其它在mic上的用户的信息
          if(result != null) {
            userInMicList.add(result);
          }
        }

        return CustomScrollView(
          slivers: [
            const SizedBox(height: 16,).toSliver(),
            // 房主的显示界面
            if(roomOwner != null)
              createItem(roomOwner!).toSliver(),
            if(roomOwner != null)
              const SizedBox(height: 30,).toSliver(),
            // 其它在mike上的用户的信息
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return createItem(userInMicList[index]);
              }, childCount: userInMicList.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.0
              )
            )
          ],
        );
      }),
    );
  }

  Widget createItem(Common.RoomUserInfo micInfo) {
    // 选中时的圆圈
    Decoration? decoration = null;
    if(selectedIds.contains(micInfo.roleId)) {
      decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(color: Color(0xFFC567FF), width: 2)
      );
    }

    return GestureDetector(
      onTap: () {
        if(selectedIds.contains(micInfo.roleId)) {
          selectedIds.remove(micInfo.roleId);
        } else {
          selectedIds.add(micInfo.roleId);
        }
        setState(() { });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 头像
          SizedBox(
            width: 55,
            height: 55,
            child: Stack(
              children: [
                Container(
                  decoration: decoration,
                  child: AsyncAvatar(uid: micInfo.uid, size: 80, onTap: Some(() {
                    if(selectedIds.contains(micInfo.roleId)) {
                      selectedIds.remove(micInfo.roleId);
                    } else {
                      selectedIds.add(micInfo.roleId);
                    }
                    setState(() { });
                  })),
                ),

                // 选中的状态
                if(selectedIds.contains(micInfo.roleId))
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(IMG.format("check"), width: 20, height: 20,),
                  )
              ],
            ),
          ),

          // 名称
          const SizedBox(height: 5,),
          Text(
            (micInfo.username ?? ""),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          ),
        ],
      ),
    );
  }

  Widget $Btn2(String title) {
    return XTextBtn(
      label: title,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
      onTap: () => onItemClick(title),
    );
  }

  void onItemClick(String action) {
    if(selectedIds.isEmpty) {
      showToast("请选择下麦用户");
      return;
    }
    Api.Room.micDown(uids: selectedIds);
  }
}