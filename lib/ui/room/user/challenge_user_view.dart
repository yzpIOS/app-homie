import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

class ChallengeUserPage extends StatefulWidget {
  final int roomId;

  const ChallengeUserPage({super.key, required this.roomId});

  @override
  State<ChallengeUserPage> createState() => _ChallengeUserPageState();
}

class _ChallengeUserPageState extends State<ChallengeUserPage> {
  @override
  Widget build(BuildContext context) {
    return OrientationSheet.scaffold(
      title: '发起挑战',
      body: ChallengeUserView(widget.roomId),
    );
  }
}

class ChallengeUserView extends SimplePageView<Map> {
  final int roomId;

  ChallengeUserView(this.roomId, {super.key});

  late final _ctrl = sceneCtrl<RoomCtrl>();

  @override
  Future fetchPage(PageNum page) => Api.Room.getPKRoomList(page: page);

  @override
  BaseConfig get config {
    return const ListConfig(
      divider: Divider(indent: 70, endIndent: 10),
      padding: Pad(bottom: 20),
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final uid = item['uid'];

    return _ItemView(data: item, selfGuildId: roomId);
  }
}

class _ItemView extends StatelessWidget {
  final Map data;
  final int selfGuildId;

  const _ItemView({required this.data, required this.selfGuildId});

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      children: [
        Spacing.w20,
        Expanded(
          child: Box(
            height: 70,
            padding: const Pad(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AvatarView(data['roomImage'], size: 40),
                Spacing.w10,
                Expanded(
                  child: Text(
                    data['roomName'],
                    style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Medium),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        XTextBtn(
          label: '挑战',
          width: 60,
          height: 24,
          textStyle: const TextStyle(fontSize: 14, color: Colors.white),
          onTap: () async {
            Get.pop();
            simpleSub(
              Api.Room.sendPKInvite(selfGuildId: selfGuildId, invitedGuildId: data['roomId']),
            );
          },
        ),
        Spacing.w20,
      ],
    );

    return child;
  }
}
