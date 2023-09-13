
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:app/common/nets/commons/proto/Common.pb.dart' as Common;
import 'package:fixnum/fixnum.dart';

///
/// https://www.tapd.cn/68741847/prong/stories/view/1168741847001000563
/// 麦上魅力值管理(2：魅力计数器)
///
class MicUserCharmManagerSheet extends StatefulWidget {
  // 场景类
  SceneCtrl? sceneCtrl = null;

  MicUserCharmManagerSheet._({this.sceneCtrl = null});

  static void show() {
    final sceneCtrl = Get.find<RoomManagerCtrl>().sceneCtrl;

    OrientationSheet.show(
      child: MicUserCharmManagerSheet._(sceneCtrl: sceneCtrl),
      decoration: const ShapeDecoration(
        shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
        color: Color(0xCC333333),
      ),
      minHeight: 0,
    );
  }

  @override
  State<MicUserCharmManagerSheet> createState() => _UserManagerSheetState();
}

class _UserManagerSheetState extends State<MicUserCharmManagerSheet> {
  S_OnlineList? s_syncRoomInfo;

  RxBool selectedAll = RxBool(false);

  List<Int64> selectedIds = <Int64>[];

  @override
  void initState() {
    super.initState();
    // 获取房间在线的用户信息
    delay(100, () async {
      WaitingCtrl.obj.show();
      C_OnlineList c_roomEnterComplete = C_OnlineList.create();
      c_roomEnterComplete.roomIdList.add(Int64(widget.sceneCtrl?.roomId ?? 0));
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

          // 全选按钮
          GestureDetector(
            onTap: () {
              if(selectedAll.value) {
                selectedIds.clear();
                selectedAll.value = false;
              } else {
                SceneMicCtrl? roomMicCtrl = widget.sceneCtrl?.getRoomMicCtrl();
                if(roomMicCtrl is! RoomMicCtrl) {
                  return;
                }
                var userList = roomMicCtrl.dataRx.values.map((e) => e.nUid);
                selectedIds.addAll(userList);
                selectedAll.value = true;
              }
              setState(() { });
            },
            behavior: HitTestBehavior.opaque,
            child: Obx(() {
              return Text(
                selectedAll.value ? "取消" : "全选",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              );
            }),
          ),
          const SizedBox(width: 5,),

          // 清零
          GestureDetector(
            onTap: () {

            },
            behavior: HitTestBehavior.opaque,
            child: SizedBox(width: 60, height: 24, child: $Btn2('清零'),),
          ),
        ],
      ),
    );
  }

  ///
  /// 用户列表
  ///
  Widget createUserList() {
    SceneMicCtrl? roomMicCtrl = widget.sceneCtrl?.getRoomMicCtrl();
    if(s_syncRoomInfo == null || roomMicCtrl == null || roomMicCtrl is! RoomMicCtrl) {
      return const SizedBox();
    }

    return Expanded(
      child: Obx(() {
        // 找出的房主的信息
        Common.RoomUserInfo? roomOwner = null;
        // 麦上的用户信息列表
        List<Common.RoomUserInfo> userInMicList = [];
        Map<Int64, MicInfo?> micInfos = {};
        // 获取麦上的用户列表
        var userList = roomMicCtrl.dataRx.keys.toList();
        for(int index = 0; index < userList.length; index ++) {
          var result = s_syncRoomInfo?.items.firstWhereOrNull((element) => element.roleId == roomMicCtrl.dataRx[userList[index]]?.nUid);
          // 其它在mic上的用户的信息
          if(result != null) {
            if(userList[index] == "1") {
              roomOwner = result;
              micInfos[result.roleId] = roomMicCtrl.dataRx[userList[index]];
            } else if(userList[index] == "8") {
            } else {
              userInMicList.add(result);
              micInfos[result.roleId] = roomMicCtrl.dataRx[userList[index]];
            }
          }
        }
        int totalCount = userInMicList.length;
        if(roomOwner != null) {
          totalCount += 1;
        }

        return CustomScrollView(
          slivers: [
            const SizedBox(height: 16,).toSliver(),
            // 房主的显示界面
            if(roomOwner != null)
              createItem(roomOwner!, micInfos[roomOwner.roleId], totalCount).toSliver(),
            if(roomOwner != null)
              const SizedBox(height: 30,).toSliver(),
            // 其它在mike上的用户的信息
            SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return createItem(userInMicList[index], micInfos[userInMicList[index].roleId], totalCount);
                }, childCount: userInMicList.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.80
                )
            )
          ],
        );
      }),
    );
  }

  Widget createItem(Common.RoomUserInfo roomUserInfo, MicInfo? micInfo, int totalCount) {
    // 选中时的圆圈
    Decoration? decoration;
    if(selectedIds.contains(roomUserInfo.roleId)) {
      decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(color: Color(0xFFC567FF), width: 2)
      );
    }

    return GestureDetector(
      onTap: () {
        if(selectedIds.contains(roomUserInfo.roleId)) {
          selectedIds.remove(roomUserInfo.roleId);
          selectedAll.value = false;
        } else {
          selectedIds.add(roomUserInfo.roleId);
          // 全选
          if(selectedIds.length >= totalCount) {
            selectedAll.value = true;
          } else {
            selectedAll.value = false;
          }
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
                  child: AsyncAvatar(uid: roomUserInfo.uid, size: 80, onTap: Some(() {
                    if(selectedIds.contains(roomUserInfo.roleId)) {
                      selectedIds.remove(roomUserInfo.roleId);
                      selectedAll.value = false;
                    } else {
                      selectedIds.add(roomUserInfo.roleId);
                      // 全选
                      if(selectedIds.length >= totalCount) {
                        selectedAll.value = true;
                      } else {
                        selectedAll.value = false;
                      }
                    }
                    setState(() { });
                  })),
                ),

                // 选中的状态
                if(selectedIds.contains(roomUserInfo.roleId))
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
            (roomUserInfo.username ?? ""),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgView(SVG.$('room/热度'), width: 12, height: 12),
              Text(
                micInfo?.hotCount != null ? micInfo!.hotCount.toString(): "0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              )
            ],
          )
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

  void onItemClick(String action) async {
    if(selectedIds.isEmpty) {
      showToast("请选择清零用户");
      return;
    }
    SceneMicCtrl? roomMicCtrl = widget.sceneCtrl?.getRoomMicCtrl();
    if(s_syncRoomInfo == null || roomMicCtrl == null || roomMicCtrl is! RoomMicCtrl) {
      return;
    }
    var userList = roomMicCtrl.dataRx.values.toList();
    // 获取在麦上的用户id
    var userRoleids = userList.where((e) => selectedIds.contains(e.nUid)).map((e) => Int64(e.micId)).toList();
    if(userRoleids.isEmpty) {
      return;
    }
    await Api.Room.resetHotCount(mics: userRoleids);
    // 清理选择的数据
    selectedIds.clear();
    setState(() { });
  }
}