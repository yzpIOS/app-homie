import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/store/im/chat_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/charm_level_view.dart';
import 'package:app/ui/common/level_view.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/gift/gift_send_logic.dart';
import 'package:app/ui/gift/gift_sheet.dart';
import 'package:app/ui/message/chat/chat_page.dart';
import 'package:app/ui/my/report_page.dart';
import 'package:app/ui/room/chat/msg_adapter/index.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoomUserInfoDialog extends StatefulWidget {
  final UID uid;
  final TxtMsgData? msg;
  final SceneCtrl sceneCtrl;

  const RoomUserInfoDialog._({required this.uid, required this.sceneCtrl, this.msg});

  static void show({required UID uid, TxtMsgData? msg}) {
    final sceneCtrl = Get.find<RoomManagerCtrl>().sceneCtrl;

    const decor = ShapeDecoration(
      shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
      color: Color(0xCC333333),
    );

    OrientationSheet.show(
      child: RoomUserInfoDialog._(uid: uid, sceneCtrl: sceneCtrl, msg: msg),
      decoration: decor,
      minHeight: 0,
    );
  }

  @override
  State<RoomUserInfoDialog> createState() => _RoomUserInfoDialogState();
}

class _RoomUserInfoDialogState extends State<RoomUserInfoDialog> {
  late final uid = widget.uid;
  late final dataRx = RxMap();
  late final isSelf = OAuthCtrl.isSelf(uid);
  late final sceneCtrl = widget.sceneCtrl;
  late final micCtrl = sceneMicCtrl();

  @override
  void initState() {
    super.initState();

    Api.UserInfo.detail(uid).onType<Map>(dataRx);
  }

  @override
  Widget build(BuildContext context) {
    Widget child = SizedBox(
      height: 240,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          if (!isSelf) Positioned(top: 0, left: 0, child: $ReportView()),
          Positioned(top: -30, child: $Avatar()),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            bottom: 66 + 14,
            child: UserInfoCtrl.use(
              uid,
              builder: (it) => Column(
                children: [$NickView(it), Spacing.h4, $LabelView(it), Spacing.h12, $DescView()],
              ),
            ),
          ),
          if (!isSelf) Positioned(left: 20, right: 20, bottom: 20, child: $ActionView()),
        ],
      ),
    );

    child = Padding(
      padding: Pad(bottom: AppSize.safeBottom),
      child: child,
    );

    return child;
  }

  Widget $NickView(UserInfoDto? info) {
    return XText(
      info?.showName() ?? '',
      style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
    );
  }

  Widget $ReportView() {
    return InkResponse(
      onTap: () => onItemClick('举报'),
      child: Padding(
        padding: const Pad(all: 10),
        child: SvgView(SVG.$('common/举报')),
      ),
    );
  }

  Widget $Avatar() {
    return AsyncAvatar(uid: uid, size: 80);
  }

  Widget $LabelView(UserInfoDto? info) {
    const double itemH = 17;
    final gender = info?.gender;

    Widget itemWrap(Widget child, {Color color = AppPalette.cc}) {
      return Container(
        height: itemH,
        padding: const Pad(horizontal: 8),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: XStadiumBorder(side: BorderSide(color: color)),
        ),
        child: child,
      );
    }

    final _micCtrl = micCtrl;

    return DefaultTextStyle(
      style: const TextStyle(fontSize: 10, color: AppPalette.cc),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (gender != null)
            itemWrap(
              SvgView(SVG.$('common/性别_${gender.code}'), width: 16, height: 16),
              color: gender == GenderEnum.male ? const Color(0xFF6A83FF) : const Color(0xFFFF6594),
            ),
          itemWrap($IdView(info)),
          if (_micCtrl is RoomMicCtrl && _micCtrl.dataRx.values.any((it) => it.uid == uid))
            CharmLevelView(level: info?.charmLevel, height: itemH)
          else
            LevelView(level: info?.level, height: itemH),
        ].separator(Spacing.w4).toList(growable: false),
      ),
    );
  }

  // Widget $OnlineView() {
  //   return XTextRich(
  //     TextSpan(
  //       children: [
  //         WidgetSpan(
  //           alignment: PlaceholderAlignment.middle,
  //           child: Container(
  //             width: 6,
  //             height: 6,
  //             decoration: const BoxDecoration(color: Color(0xFF21DF54), shape: BoxShape.circle),
  //           ),
  //         ),
  //         const TextSpan(text: ' 在线'),
  //       ],
  //     ),
  //   );
  // }

  Widget $IdView(UserInfoDto? info) {
    final id = info?.account;

    return OpacityButton(
      onTap: id?.copy,
      child: XRichText(
        TextSpan(
          children: [
            TextSpan(text: 'ID:${id ?? ''}'),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: SvgView(SVG.$('common/复制'), color: AppPalette.cc, width: 16, height: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget $DescView() {
    return Obx(() {
      final data = dataRx();

      return XText(
        data['description'] ?? '',
        maxLines: 2,
        style: const TextStyle(fontSize: 12, color: AppPalette.cc),
      );
    });
  }

  Widget $ActionView() {
    List<Widget> $BtnWrap({required List<Widget> children}) {
      return children //
          .map<Widget>((it) => Expanded(child: it))
          .separator(Spacing.w12)
          .toList(growable: false);
    }

    return SizedBox(
      height: 32,
      child: Obx(() {
        final isFollow = dataRx['is_follow'];

        final items = [
          if (isFollow is bool) isFollow ? '已关注' : '关注',
          '@TA',
          '私聊',
        ];

        return Row(
          children: $BtnWrap(
            children: [
              ...items.map($Btn1),
              $Btn2('送礼物'),
            ],
          ),
        );
      }),
    );
  }

  Widget $Btn1(String title) {
    return XOutlinedBtn(
      label: title,
      side: const BorderSide(color: Colors.white),
      textStyle: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
      onTap: () => onItemClick(title),
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
    final ctrl = sceneCtrl;

    switch (action) {
      case '关注':
        doFollow(true);
        break;
      case '已关注':
        doFollow(false);
        break;
      case '@TA':
        Get.back();

        Get.find<UserInfoCtrl>() //
            .findByUidOrNull(uid, useNet: true)
            .onNotNull((val) => RoomAtEvent(val.nickName!).fire());
        break;
      case '私聊':
        Get.back();

        ChatPage.to(SingleChatCtrl.fromUid(uid));
        break;
      case '送礼物':
        Get.back();

        GiftSheet.show(
          GiftSend2UserInRoom(roomId: ctrl.roomId, uid: uid),
          hasShowUnityView: true
        );
        break;
      case '举报':
        final canManage = ctrl is RoomCtrl && ctrl.getRole(OAuthCtrl.uid).isManager;

        final items = {
          '举报': () => Get.to(() => ReportPage(type: 2, id: uid)),
          if (canManage && !ctrl.getRole(uid).isManager) //
            '加入黑名单': () => ctrl.setBlock(uid:widget.uid, isAdd: true)
        };

        switch (items.length) {
          case 0:
            break;
          case 1:
            items.values.single();
            break;
          default:
            Get.showSheet(items.entries, toTitle: (it) => Tuple2(it.key, null)) //
                .onNotNull((val) => val.value());
        }

        break;
    }
  }

  void doFollow(bool b) {
    simpleSub(
      Api.UserInfo.follow(uid: uid, doFollow: b),
      callback: () {
        setState(() => dataRx['is_follow'] = b);
      },
    );
  }
}
