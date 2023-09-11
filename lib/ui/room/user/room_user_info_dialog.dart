import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/enum/room_state.dart';
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
import 'package:app/ui/common/gift_list_dialog.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/gift/gift_send_logic.dart';
import 'package:app/ui/gift/gift_sheet.dart';
import 'package:app/ui/message/chat/chat_page.dart';
import 'package:app/ui/moment/report/moment_report_page.dart';
import 'package:app/ui/my/charm_level_page.dart';
import 'package:app/ui/my/report_page.dart';
import 'package:app/ui/room/chat/msg_adapter/index.dart';
import 'package:app/ui/room/user/mic_user_charm_manager_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoomUserInfoDialog extends StatefulWidget {
  final UID uid;
  final NUID nuid;
  final TxtMsgData? msg;
  final SceneCtrl sceneCtrl;
  // 麦位,
  final String micNo;

  const RoomUserInfoDialog._({required this.uid, required this.nuid, required this.sceneCtrl, this.msg, required this.micNo});

  static void show({required UID uid, required NUID nuid, TxtMsgData? msg, String micNo = ""}) {
    final sceneCtrl = Get.find<RoomManagerCtrl>().sceneCtrl;

    const decor = ShapeDecoration(
      shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
      color: Color(0xCC333333),
    );

    OrientationSheet.show(
      child: RoomUserInfoDialog._(uid: uid, nuid: nuid, sceneCtrl: sceneCtrl, msg: msg, micNo: micNo),
      decoration: decor,
      minHeight: 0,
    );
  }

  @override
  State<RoomUserInfoDialog> createState() => _RoomUserInfoDialogState();
}

class _RoomUserInfoDialogState extends State<RoomUserInfoDialog> {

  static const String CHARM_LEVEL = "魅力等级";
  static const String GIFT_WALL = "礼物墙";
  static const String DECORATE_WALL = "装饰墙";

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
      height: 275,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          if (!isSelf) Positioned(top: 0, left: 0, child: $ReportView()),
          Positioned(top: -30, child: $Avatar()),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60,),
              UserInfoCtrl.use(
                uid,
                builder: (it) => Column(
                  children: [$NickView(it), Spacing.h4, $LabelView(it), Spacing.h8, $DescView()],
                ),
              ),

              // 礼物墙，装饰墙，魅力等级
              SizedBox(height: 10,),
              createLevel(),

              const Expanded(child: SizedBox()),
              // 查看其它用户的信息；私聊等按钮
              if (!isSelf)
                $ActionView().horizonMargin(left: 20, right: 20),

              // 查看自己的信息：下麦和送礼
              if (isSelf)
                selfAction(),

              const SizedBox(height: 20,),
            ],
          ),
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
          CharmLevelView(level: info?.charmLevel, uid: info?.uid, height: itemH),
          WealthyLevelView(level: info?.level, uid: info?.uid, height: itemH),
          if (gender != null)
            itemWrap(
              SvgView(SVG.$('common/性别_${gender.code}'), width: 16, height: 16),
              color: gender == GenderEnum.male ? const Color(0xFF6A83FF) : const Color(0xFFFF6594),
            ),
          itemWrap($IdView(info))
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

  Widget createLevel() {
    var itemHeight = (AppSize.width - 28 * 2 - 10 * 2) / 3.0;
    var itemWidth = (itemHeight / 100.0) * 46;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 28,),
        // 礼物墙
        GestureDetector(
          onTap: () {
            onItemClick(GIFT_WALL);
          },
          child: Stack(
            children: [
              Image.asset(IMG.format("room/room_gift_entry"), width: itemHeight, height: itemWidth,),
              const Positioned(
                top: 5,
                left: 5,
                child: Text(
                  GIFT_WALL,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const Positioned(
                top: 24,
                left: 5,
                child: Text(
                  "0/100",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),

        // 装饰墙
        const SizedBox(width: 10,),
        GestureDetector(
          onTap: () {
            onItemClick(DECORATE_WALL);
          },
          child: Stack(
            children: [
              Image.asset(IMG.format("room/room_decorate_entry"), width: itemHeight, height: itemWidth,),
              const Positioned(
                top: 5,
                left: 5,
                child: Text(
                  DECORATE_WALL,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const Positioned(
                top: 24,
                left: 5,
                child: Text(
                  "0/100",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),

        // 魅力
        const SizedBox(width: 10,),
        GestureDetector(
          onTap: () {
            onItemClick(CHARM_LEVEL);
          },
          child: Stack(
            children: [
              Image.asset(IMG.format("room/room_charm_entry"), width: itemHeight, height: itemWidth,),
              const Positioned(
                top: 5,
                left: 5,
                child: Text(
                  CHARM_LEVEL,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 28,),
      ],
    );
  }

  Widget $ActionView() {
    List<Widget> $BtnWrap({required List<Widget> children}) {
      return children //
          .map<Widget>((it) => Expanded(child: it))
          .separator(Spacing.w12)
          .toList(growable: false);
    }

    return SizedBox(
      height: 43,
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

  Widget selfAction() {
    SceneMicCtrl? roomMicCtrl = sceneCtrl.getRoomMicCtrl();
    if(roomMicCtrl == null || roomMicCtrl is! RoomMicCtrl) {
      return const SizedBox();
    }
    return Obx(() {
      var onLine = roomMicCtrl.dataRx;
      var mineMic = onLine.values.firstWhereOrNull((e) => e.uid == OAuthCtrl.uid);
      return Row(
        children: [
          const Expanded(child: SizedBox()),
          // 下麦
          if(mineMic != null)
            SizedBox(width: 80, height: 34, child: $Btn2('下麦'),),
          const SizedBox(width: 10,),
          SizedBox(width: 80, height: 34, child: $Btn2('送礼物'),),
          // 自己给自己送物
          const Expanded(child: SizedBox()),
        ],
      );
    });
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

  void onItemClick(String action) async {
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
          '举报': () => Get.to(() => MomentReportPage(type: 2, id: uid)),
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
      case '下麦':
        try {
          Api.Room.micDown(uid: widget.nuid);
        } catch(e, s) {
        }
        break;
      case '上麦':
        try {
          Api.Room.micUp(roomId: widget.sceneCtrl.roomId,uid: widget.nuid, no: widget.micNo);
        } catch(e, s) {
        }
        break;
      case GIFT_WALL:
        // todo 等待合并分支
        Get.showBottomSheet(
            GiftListDialog(),
            shape: const XRectangleBorder(borderRadius: AppBorderRadius.t10,),
            isScrollControlled: false
        );
        break;
      case CHARM_LEVEL:
        Get.to(() => CharmLevelPage(uid: uid));
        break;
      case DECORATE_WALL:
        showToast("敬请期待");
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
