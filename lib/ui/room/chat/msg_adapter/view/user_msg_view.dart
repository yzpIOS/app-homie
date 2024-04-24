import 'dart:ffi';

import 'package:app/common/nets/commons/proto/Common.pb.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/charm_level_view.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/ui/room/chat/msg_adapter/data/user_msg_data.dart';
import 'package:app/ui/room/chat/msg_adapter/view/base_msg_view.dart';
import 'package:app/ui/room/user/room_user_info_dialog.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/nine_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:figma_squircle/figma_squircle.dart';

abstract class _UserMsgView<T extends UserMsgData> extends BaseMsgView<T> {
  const _UserMsgView(super.vm, {super.key});

  InlineSpan richText(SpecialTextSpanBuilder? special, UserInfoDto info);

  static const _spacer = WidgetSpan(child: Spacing(width: 5, flex: null));

  @override
  Widget msgView(BuildContext context) {
    final special = context.watch<SpecialTextSpanBuilder?>();

    return UserInfoCtrl.use(
      vm.uid,
      builder: (it) => it == null ? Spacing.blank : builder(special, it),
    );
  }

  Widget builder(SpecialTextSpanBuilder? special, UserInfoDto info) {

    void showUserDialog() {
      RoomUserInfoDialog.show(uid: vm.uid, nuid: vm.nuid, msg: vm.typeIf<TxtMsgData>());
    }

    InlineSpan span = TextSpan(
      text: info.showName(),
      style: const TextStyle(color: AppPalette.colorY),
      recognizer: TapGestureRecognizer() //
        ..onTap = showUserDialog,
    );

    final level = info.level;

    span = TextSpan(
      style: TextStyle(fontSize: 14),
      children: [
        if (level != null)
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: showUserDialog,
              child: Padding(
                padding: const Pad(right: 4),
                child: WealthyLevelView(level: level, height: 11),
              ),
            ),
          ),
        span,
        _spacer,
        richText(special, info),
      ],
    );

    return RichText(text: span);
  }
}

class TxtMsgView extends _UserMsgView<TxtMsgData> {
  const TxtMsgView(super.vm, {super.key});


  @override
  Widget build(BuildContext context) {
    return UserInfoCtrl.use(vm.uid, forceUseNet: true, builder: (dto) {
      if(dto == null || dto.chat_bubble == null || dto.chat_bubble?.isEmpty == true) {
        return super.build(context);
      }
      final special = context.watch<SpecialTextSpanBuilder?>();
      return builder(special, dto);
    });
  }

  @override
  Widget builder(SpecialTextSpanBuilder? special, UserInfoDto info) {
    // 没有头像框
    if(info.chat_bubble == null || info.chat_bubble?.isEmpty == true) {
      return super.builder(special, info);
    }

    void showUserDialog() {
      RoomUserInfoDialog.show(uid: vm.uid, nuid: vm.nuid, msg: vm.typeIf<TxtMsgData>());
    }

    InlineSpan span = TextSpan(
      text: info.showName(),
      style: const TextStyle(color: AppPalette.colorY),
      recognizer: TapGestureRecognizer() //
        ..onTap = showUserDialog,
    );

    final level = info.level;

    span = TextSpan(
      style: TextStyle(fontSize: 14),
      children: [
        if (level != null)
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: showUserDialog,
              child: Padding(
                padding: const Pad(right: 4),
                child: WealthyLevelView(level: level, height: 11),
              ),
            ),
          ),
        span,
        richText(special, info, plusTxt: true),
      ],
    );

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        NineImage(
          //imageProvider 图像处理
          imageProvider: NetworkImage(info.chat_bubble ?? ""),
          // imageProvider: AssetImage("assets/img/chat/chat_box_2.9.png"),
          //内容填充区域ß
          child: RichText(text: span),
        ),

      ],
    );
  }

  @override
  InlineSpan richText(special, info, {bool plusTxt = false}) {
    var txt = vm.data;

    if(((txt.length ?? 0) + info.showName().length < 9) && plusTxt) {
      txt += "        ";
    }

    return special?.build(":$txt") ?? TextSpan(text: ":$txt");
  }
}

class UserInMsgView extends _UserMsgView<UserInMsgData> {
  const UserInMsgView(super.vm, {super.key});

  @override
  InlineSpan richText(special, info) {
    return const TextSpan(
      text: '进入了房间',
      style: TextStyle(color: AppPalette.colorY),
    );
  }
}

/// 送普通礼物消息视图  xxx给xxx送出了xxx
class GiftMsgView extends _UserMsgView<GiftMsgAdapter> {
  const GiftMsgView(super.vm, {super.key});

  @override
  InlineSpan richText(special, info) {
    return TextSpan(
      children: [
        const TextSpan(text: '给 '),
        TextSpan(text: vm.users[vm.acceptUid]?.showName() ?? '--', style: const TextStyle(color: AppPalette.colorY),),
        const TextSpan(text: ' 送出了'),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GiftImgState(
            child: NetImage(vm.giftCover, width: 16, height: 16),
          ),
        ),
        TextSpan(text: 'x${vm.giftCount}'),
      ],
      style: const TextStyle(color: Colors.white, fontSize: 14),
    );
  }
}


/// 送普通礼物消息视图  xxx给xxx送出了xxx
class LuckMsgView extends _UserMsgView<LuckMsgAdapter> {
  const LuckMsgView(super.vm, {super.key});

  @override
  InlineSpan richText(special, info) {
    return TextSpan(
      children: [
        const TextSpan(text: '在'),
        TextSpan(text: vm.gameName, style: const TextStyle(color: AppPalette.colorY),),
        const TextSpan(text: ' 中 获得了价值'),
        TextSpan(text: vm.prize.toString(), style: TextStyle(color: Color(0xFF3DF6FF))),
        const TextSpan(text: '紫钻的'),
        TextSpan(text: vm.giftName.toString(), style: TextStyle(color: Color(0xFF3DF6FF))),
        TextSpan(text: ' x${vm.giftCount}'),
      ],
      style: const TextStyle(color: Colors.white, fontSize: 14),
    );
  }
}


/// 在聊天栏增加全服通告喇叭，***玩家在***房间赠送了**礼物
class LuckyNotifyMsgView extends BaseMsgView<AllRoomMsgAdapter> {
  const LuckyNotifyMsgView(super.vm, {super.key});

  Widget msgView(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: const TextStyle(color: Colors.white, fontSize: 14),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Image.asset(IMG.format("room/ic_horn"), width: 15, height: 15),
            ),

            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: SizedBox(width: 5,)
            ),

            TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: GestureDetector(
                    onTap: () {
                      showUserDialog();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: RichText(
                      text: TextSpan(text: vm.data.userName, style: const TextStyle(color: Color(0xFFFB7AFF), fontSize: 14),),
                    ),
                  ),
                ),
                const TextSpan(text: '玩家在', style: const TextStyle(color: Colors.white, fontSize: 14),),

                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("click room");
                      RoomManagerCtrl.ins.toMiddleRoom(roomId: vm.data.roomId.toInt());
                    },
                    behavior: HitTestBehavior.opaque,
                    child: RichText(
                      text: TextSpan(text: '【${vm.data.roomName}】', style: TextStyle(color: Color(0xFFFB7AFF), fontSize: 14)),
                    ),
                  ),
                ),
                const TextSpan(text: '房间赠送了', style: const TextStyle(color: Colors.white, fontSize: 14),),
                TextSpan(text: "${vm.data.giftName}", style: TextStyle(color: Color(0xFFFB7AFF), fontSize: 14)),
                const TextSpan(text: '礼物', style: const TextStyle(color: Colors.white, fontSize: 14),),
              ],
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ]
      ),
    );
  }

  void showUserDialog() {
    RoomUserInfoDialog.show(uid: vm.data.uid, nuid: vm.data.roleId);
  }
}



/// 在聊天栏增加全服通告喇叭，***玩家在***房间赠送了**礼物
class NewUserMsgView extends BaseMsgView<NewUserMsgAdapter> {
  const NewUserMsgView(super.vm, {super.key});

  Widget msgView(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: 4,),
          Image.asset(IMG.format("room/ic_room_new"), width: 16, height: 16,),

          // 用户头像
          SizedBox(width: 4,),
          GestureDetector(
            onTap: () {
              showUserDialog();
            },
            behavior: HitTestBehavior.opaque,
            child: AvatarView(vm.data["avatar_url"], size: 30, avatarFrameUrl: vm.data["avatar_frame"],),
          ),

          SizedBox(width: 4,),
          GestureDetector(
            onTap: () {
              showUserDialog();
            },
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2,),
                Visibility(
                  visible: vm.data.showName() != null && vm.data.showName().toString().isNotEmpty,
                  child: Text(
                    vm.data.showName(),
                    style: TextStyle(color: Color(0xFFFFDD7A), fontSize: 13, fontWeight: FontWeight.normal),
                  ),
                ),
                Visibility(
                  visible: vm.data.showName() != null && vm.data.showName().toString().isNotEmpty &&
                      vm.data["public_id"] != null && vm.data["public_id"].toString().isNotEmpty,
                  child: SizedBox(height: 2,),
                ),
                Visibility(
                  visible: vm.data["public_id"] != null && vm.data["public_id"].toString().isNotEmpty,
                  child: Text(
                    "ID:${vm.data["public_id"]}",
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 4,),
          Text(
            "刚刚完成了注册",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  void showUserDialog() {
    RoomUserInfoDialog.show(uid: vm.data["uid"], nuid: NUID(vm.data["role_id"]));
  }
}

///
/// 世界聊天频道
///
class WorldMessageView extends BaseMsgView<WorldMsgAdapter> {

  WorldMessageView(super.vm);


  @override
  Widget build(BuildContext context) {

    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CharmLevelView(level: vm.data.level.toString(), uid: OAuthCtrl.uid,),
            WealthyLevelView(level: vm.data.level.toString(), uid: vm.data.uid,),
            SizedBox(width: 4,),
            Text(
              vm.data.username,
              style: TextStyle(color: Color(0xFFFFDD7A), fontSize: 13, fontWeight: FontWeight.normal),
            )
          ],
        ),
        SizedBox(height: 4,),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
              color: AppPalette.room,
              borderRadius: BorderRadius.circular(6)
          ),
          child: Text(
            vm.data.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(height: 4,),
      ],
    );

    return Material(
      color: Colors.transparent,
      textStyle: const TextStyle(fontSize: 12, color: Colors.white, height: 1),
      child: Padding(
        padding: const Pad(left: 4, right: 8, vertical: 3),
        child: child,
      ),
    );
  }
}

/// 盲盒开出了礼物消息视图  xxx送出xxx给xxx，开出xxx
class BlindBoxGiftOpenMsgView extends _UserMsgView<BlindBoxGiftOpenMsgAdapter> {
  const BlindBoxGiftOpenMsgView(super.vm, {super.key});

  @override
  InlineSpan richText(special, info) {
    List<InlineSpan> children = [
      const TextSpan(text: '送出'),
      TextSpan(text: '${vm.blindBoxName ?? '--'}x${vm.blindBoxCount}', style: const TextStyle(color: AppPalette.colorY)),
      const TextSpan(text: '给'),
      TextSpan(text: '${vm.users[vm.acceptUid]?.showName() ?? '--'}，', style: const TextStyle(color: AppPalette.colorY)),
      const TextSpan(text: '开出'),
    ];
    for(var i = 0; i < vm.items.length; i ++) {
      S_GiftPlay gift = vm.items[i];
      children.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GiftImgState(
            child: NetImage(gift.cover, width: 16, height: 16),
          ),
        ),
      );
      children.add(
        TextSpan(text: 'x${gift.count}'),
      );
      if(i != vm.items.length - 1) {
        children.add(
          const TextSpan(text: ','),
        );
      }
    }

    return TextSpan(
      children: children,
      style: const TextStyle(color: Colors.white, fontSize: 14),
    );
  }
}
