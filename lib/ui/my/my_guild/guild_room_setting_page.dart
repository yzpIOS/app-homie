import 'package:app/tools.dart';
import 'package:app/ui/my/my_guild/guild_room_setting_controller.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 房间设置
class GuildRoomSettingPage extends StatelessWidget {
  final int roomId;
  final bool isOpen;

  const GuildRoomSettingPage(
      {super.key, required this.roomId, required this.isOpen});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuildRoomSettingController>(
        init: GuildRoomSettingController(roomId: roomId, isOpen: isOpen),
        builder: (GuildRoomSettingController controller) {
          return Scaffold(
            appBar: xAppBar(title: '房间设置'),
            body: ColoredBox(
              color: const Color(0xFFF5F5F5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _openStatusWidget(controller),
                  _changeRoomBackgroundWidget(controller),
                ],
              ),
            ),
          );
        });
  }

  /// 直播间运营状态
  Widget _openStatusWidget(GuildRoomSettingController controller) {
    return Container(
      height: 50,
      margin: const Pad(top: 10),
      padding: const Pad(horizontal: 10),
      color: Colors.white,
      child: Row(
        children: [
          const Text("直播间运营状态",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF000000),
              )),
          const Spacing(),
          Obx(() {
            return GestureDetector(
              onTap: () {
                controller.clickChangeOpenStatus();
              },
              child: Image.asset(
                IMG.format(controller.isOpenLive.value ? 'my/guild_center_room_live_status_open' : 'my/guild_center_room_live_status_close'),
                width: 55,
                height: 24,
              ),
            );
          }),
        ],
      ),
    );
  }

  /// 更换直播间背景
   Widget _changeRoomBackgroundWidget(GuildRoomSettingController controller) {
     return GestureDetector(
       onTap: (){
         controller.clickChangeRoomBackground();
       },
       child: Container(
         height: 50,
         margin: const Pad(top: 10),
         padding: const Pad(horizontal: 10),
         color: Colors.white,
         child: Row(
           children: [
             const Text("直播间背景墙更换",
                 style: TextStyle(
                   fontSize: 14,
                   color: Color(0xFF000000),
                 )),
             const Spacing(),
             Image.asset(
               IMG.format("wode_icon_right"),
               width: 20,
               height: 20,
               color: const Color(0xFF999999),
             ),
           ],
         ),
       ),
     );
   }
}