
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/room/persion/person_room_mic_ctrl.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;

class GiftSendAll extends StatelessWidget {

  ValueNotifier<MicInfo?> valueNotifier = ValueNotifier(null);

  List<MicInfo> micInfos = [];

  static Future show() async {
    List<MicInfo>? list = RoomManagerCtrl.ins.sceneCtrl2?.getRoomMicCtrl()?.simpleUserList;
    if(list == null || list.isEmpty) {
      showToast("麦上无用户, 无法操作");
      return;
    }
    var dialog = GiftSendAll();
    await Get.dialog(
      dialog,
      useSafeArea: false,
      routeSettings: dialog.toRouteSettings(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double avatorSize = (Get.width - 10 * 7 - 11 * 3 - 24) / 8;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 150,
            child: Container(
              width: double.infinity,
              height: avatorSize + 13,
              decoration: BoxDecoration(
                color: Color(0xFF49439F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Obx(() {
                    SceneMicCtrl? sceneMicCtrl = RoomManagerCtrl.ins.sceneCtrl2?.getRoomMicCtrl();
                    if(sceneMicCtrl is RoomMicCtrl) {
                      micInfos = sceneMicCtrl.dataRx.values.toList();
                    } else if(sceneMicCtrl is PersonRoomMicCtrl) {
                      micInfos = sceneMicCtrl.micUserList.toList();
                    } else {
                      return SizedBox();
                    }

                    // 删除自己
                    micInfos.removeWhere((element) => element.uid == OAuthCtrl.uid);

                    RoomMicCtrl roomMic = RoomManagerCtrl.ins.sceneCtrl2?.getRoomMicCtrl() as RoomMicCtrl;
                    // 房主
                    MicInfo? owner = roomMic.roomOwner();
                    // 删除房主
                    micInfos.removeWhere((element) => element.uid == owner?.uid);

                    // 排序
                    micInfos.sort((a, b) {
                      return (int.tryParse(a.no) ?? 0) - (int.tryParse(b.no) ?? 0);
                    });
                    // 把房主添加到第一位
                    if(owner != null) {
                      micInfos.insert(0, owner);
                    }

                    // 之前选中的己经下线
                    bool isOnLine = false;
                    micInfos.forEach((element) {
                      isOnLine = element.uid == valueNotifier.value?.uid || isOnLine;
                    });
                    if(!isOnLine) {
                      valueNotifier.value = null;
                    }

                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return createItem(micInfos[index], avatorSize, index);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 8.5,);
                      },
                      itemCount: micInfos.length
                    );
                  }),

                  Expanded(child: SizedBox()),

                  GestureDetector(
                    onTap: () async {
                      int? roomId = RoomManagerCtrl.ins.sceneCtrl2?.roomId;
                      if(roomId == null) {
                        return;
                      }

                      MicInfo? mickInfo = valueNotifier.value;
                      if(mickInfo == null) {
                        showToast("请选择麦上用户");
                        return;
                      }

                      C_GiveGiftByOneClick giveGiftByOneClick = C_GiveGiftByOneClick.create();
                      giveGiftByOneClick.roomId = $fixnum.Int64(roomId);
                      giveGiftByOneClick.acceptRoleId = mickInfo.nUid;
                      giveGiftByOneClick.acceptUid = mickInfo.uid;

                      S_GiveGiftByOneClick? back = await SocketCtrl.ins.sendByteAsyncServer(
                        CMD.C_GiveGiftByOneClick,
                        datas: giveGiftByOneClick.writeToBuffer(),
                        resCmd: CMD.S_GiveGiftByOneClick
                      );

                      if(back?.code.value == 0) {
                        showToast("操作成功");
                      } else {
                        showToast("操作失败");
                      }

                      Get.back();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 24,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFBD7BE5),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "确认",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createItem(MicInfo micInfo, double avatorSize, int index) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (BuildContext context, MicInfo? value, Widget? child) {
        return GestureDetector(
          onTap: () {
            valueNotifier.value = micInfo;
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: avatorSize,
            height: avatorSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AsyncAvatar(
                  uid: micInfo.uid,
                  size: avatorSize,
                  onTap:Some(() {
                    valueNotifier.value = micInfo;
                  }),
                ),
                // 房主
                if(micInfo.isMainRole())
                  Positioned(
                    left: 4.0,
                    right: 4.0,
                    bottom: 4.0,
                    child: Container(
                      width: 26,
                      height: 12,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Colors.white,
                          ),
                          color: Colors.black.withAlpha(60),
                          borderRadius: BorderRadius.circular(3.0)
                      ),
                      child: Text(
                        "房主",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),

                // 坐位号
                if(!micInfo.isMainRole())
                  Positioned(
                    right: 0.0,
                    bottom: 4.0,
                    child: Container(
                      width: 12,
                      height: 12,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black.withAlpha(60),
                      ),
                      child: Text(
                        micInfo.no,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),

                if(micInfo.uid == valueNotifier.value?.uid)
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    top: 0.0,
                    child: Image.asset(IMG.format("room/ic_choose"), width: 10, height: 10, scale: 2,),
                  )
              ],
            ),
          ),
        );
      }
    );
  }
}