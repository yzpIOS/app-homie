import 'dart:io';

import 'dart:convert' as convert;
import 'package:app/3rd/tencent/im.dart';
import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/size_provider.dart';
import 'package:app/store/sound_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/video_page.dart';
import 'package:app/ui/message/msg_adapter/data/base_adapter.dart';
import 'package:app/ui/message/msg_adapter/view/base_adapter.dart';
import 'package:app/ui/my/backpack/v1/backpack_page.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/image/image_gallery.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

abstract class UserMsg<T extends MsgAdapter> extends BaseMsgAdapter<T> {
  const UserMsg(super.vm, {super.key});

  static final Color _popColor = Color.alphaBlend(const Color(0x4DDCD2FE), AppPalette.background);

  bool get $showNip => true;

  @override
  Widget build(BuildContext context) {
    //<editor-fold desc="Pop">
    Widget popView = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: Get.width - (40 + 24) * 2, minHeight: 40),
      child: Builder(
        builder: (context) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onPopClick(context),
            child: $Padding(
              child: $PopView(),
            ),
          );
        },
      ),
    );

    popView = vm.isSend ? _$PopView$Send(child: popView) : _$PopView$Receive(child: popView);
    //</editor-fold>

    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 14, color: Colors.black),
      child: Padding(
        padding: const Pad(horizontal: 12),
        child: popView,
      ),
    );
  }

  VoidCallback? onPopClick(BuildContext context) => null;

  Widget $Padding({required Widget child}) => child;

  Widget $PopView() => const XText('暂不支持');

  Widget? _$StateView() {
    const _padding = Pad(horizontal: 4);

    final status = vm.status;

    switch (status) {
      case MessageStatus.V2TIM_MSG_STATUS_SEND_SUCC: //消息发送成功
        return Padding(
            padding: Pad(right: $showNip ? 0 : 5),
            child: Image.asset(IMG.format(vm.isPeerRead ? 'chat/消息已读' : 'chat/消息未读'), width: 14, height: 14, scale: 3, fit: BoxFit.contain)
        );
      case MessageStatus.V2TIM_MSG_STATUS_SENDING: //消息发送中
        switch (vm.msg.elemType) {
          case MessageElemType.V2TIM_ELEM_TYPE_IMAGE:
          case MessageElemType.V2TIM_ELEM_TYPE_VIDEO:
          case MessageElemType.V2TIM_ELEM_TYPE_SOUND:
          case MessageElemType.V2TIM_ELEM_TYPE_FILE:
            final progress = vm.msg.progress ?? 0;

            return Padding(
              padding: _padding,
              child: CircularPercentIndicator(
                radius: 6,
                lineWidth: 1.5,
                percent: progress / 100,
                backgroundColor: AppPalette.tips,
                progressColor: AppPalette.primary,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            );
        }
        break;
      case MessageStatus.V2TIM_MSG_STATUS_SEND_FAIL: //消息发送失败
        return Builder(
          builder: (context) {
            return InkResponse(
              child: const Padding(
                padding: _padding,
                child: Icon(Icons.error_rounded, color: Colors.redAccent, size: 18),
              ),
              onTap: () {
                Get.simpleDialog(msg: '重新发送') //
                    .onResult(okCall: () {});
              },
            );
          },
        );
      case MessageStatus.V2TIM_MSG_STATUS_HAS_DELETED: //消息被删除
      case MessageStatus.V2TIM_MSG_STATUS_LOCAL_REVOKED: //被撤销的消息
        break;
    }

    // if (Env.isDebug) {
    //   return Padding(
    //     padding: _padding,
    //     child: XText(
    //       '$status',
    //       style: const TextStyle(fontSize: 10),
    //     ),
    //   );
    // }

    return null;
  }

  Widget _$AvatarView(double size) {
    final uid = vm.msg.sender!;

    return uid.startsWith('service_') //
        ? AvatarView(vm.msg.faceUrl, size: size)
        : AsyncAvatar(uid: uid, size: size);
  }

  Widget _$PopView$Send({required Widget child}) {
    final state = _$StateView();

    child = _$AppBubble(
      child: child,
      color: _popColor,
      nip: $showNip ? BubbleNip.rightTop : BubbleNip.no,
    );

    child = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        Spacing.w4,
        MyInfoCtrl.use(
          builder: (it) => AvatarView(it.avatar, blur: it.avatarEx, size: 40),
        ),
      ],
    );

    if (state != null) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [state, child],
      );
    }

    return child;
  }

  Widget _$PopView$Receive({required Widget child}) {
    child = _$AppBubble(
      child: child,
      color: _popColor,
      nip: $showNip ? BubbleNip.leftTop : BubbleNip.no,
    );

    child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
      ],
    );

    child = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _$AvatarView(40),
        Spacing.w4,
        child,
      ],
    );

    return child;
  }

  Widget _$AppBubble({required Widget child, required Color color, required BubbleNip nip}) {
    const edges = BubbleEdges.all(0);
    const radius = AppRadius.r6;

    const style = BubbleStyle(
      shadowColor: Colors.black12,
      padding: edges,
      radius: radius,
      elevation: 4,
      nipOffset: 8,
      nipRadius: 2,
    );

    return Bubble(
      nip: nip,
      color: color,
      style: style,
      child: Material(
        type: MaterialType.transparency,
        borderRadius: const BorderRadius.all(radius),
        clipBehavior: Clip.hardEdge,
        child: child,
      ),
    );
  }
}

class TxtMsg extends UserMsg<TxtMsgAdapter> {
  const TxtMsg(super.vm, {super.key});

  @override
  Widget $Padding({required Widget child}) {
    return Padding(
      padding: const Pad(horizontal: 12, vertical: 10),
      child: child,
    );
  }

  @override
  Widget $PopView() {
    //TODO maxLines
    return Builder(
      builder: (context) {
        return XText(
          vm.txt,
          maxLines: 100,
          specialTextSpanBuilder: context.watch<SpecialTextSpanBuilder?>(),
        );
      },
    );
  }
}

class DressUpMsg extends UserMsg<ExtMsgAdapter> {
  const DressUpMsg(super.vm, {super.key});

  @override
  VoidCallback onPopClick(BuildContext context) {
    return () => Get.to(() => const BackpackPage());
  }

  @override
  Widget $Padding({required Widget child}) {
    return Padding(
      padding: const Pad(all: 10),
      child: child,
    );
  }

  @override
  Widget $PopView() {
    final ext = vm.ext;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: const ShapeDecoration(
            shape: XRectangleBorder(
              borderRadius: AppBorderRadius.a8,
              side: BorderSide(color: AppPalette.primary),
            ),
          ),
          child: NetImage(ext['image'], width: 66, height: 66, fit: BoxFit.contain),
        ),
        Spacing.w10,
        Flexible(
          child: XText(vm.txt, maxLines: 3),
        ),
      ],
    );
  }
}

class GiftMsg extends UserMsg<ExtMsgAdapter> {
  const GiftMsg(super.vm, {super.key});

  // @override
  // VoidCallback onPopClick(BuildContext context) {
  //   return () => Get.to(() => const BackpackPage());
  // }

  @override
  Widget $Padding({required Widget child}) {
    return Padding(
      padding: const Pad(horizontal: 16, vertical: 10),
      child: child,
    );
  }

  @override
  Widget $PopView() {
    final ext = vm.ext;

    return Column(
      children: [
        DecoratedBox(
          decoration: const ShapeDecoration(
            shape: XRectangleBorder(
              borderRadius: AppBorderRadius.a8,
              side: BorderSide(color: AppPalette.primary),
            ),
          ),
          child: NetImage(ext['image'], width: 66, height: 66, fit: BoxFit.contain),
        ),
        Spacing.w4,
        // XText(
        //   '送出${ext['name']}x${ext['count']}',
        //   style: const TextStyle(fontSize: 12),
        // ),
        XText(
          vm.txt,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class ImgMsg extends UserMsg<ImgMsgAdapter> {
  const ImgMsg(super.vm, {super.key});

  @override
  final bool $showNip = false;

  @override
  VoidCallback onPopClick(BuildContext context) {
    return () {
      final local = vm.localFile;

      final sizeProvider = SizeProvider.from(vm.size);

      ImageGallery.show(
        data: local != null && local.existsSync()
            ? ImageGalleryItem(image: FileImage(local), sizeProvider: sizeProvider)
            : ImageGalleryItem(
                image: const ImageToNormal().toProvider(Left(vm.originalUrl)),
                thumb: const ImageToThumb().toProvider(Left(vm.thumbUrl)),
                sizeProvider: sizeProvider,
              ),
      );
    };
  }

  @override
  Widget $PopView() {
    return _$ImgBox(size: vm.size, byLocal: byLocal, byNet: byNet);
  }

  Widget? byLocal(Size size) {
    Widget? builder(File file) {
      final image = FileImage(file);

      return AppImage(
        image: image,
        fit: BoxFit.cover,
        width: size.width,
        height: size.height,
      );
    }

    return [vm.localFile].firstExists()?.let(builder);
  }

  Widget? byNet(Size size) {
    final url = vm.thumbUrl;

    return NetImage(
      url,
      fit: BoxFit.cover,
      width: size.width,
      height: size.height,
      toProvider: const ImageToNormal(),
    );
  }
}

class VideoMsg extends UserMsg<VideoMsgAdapter> {
  const VideoMsg(super.vm, {super.key});

  @override
  final bool $showNip = false;

  @override
  VoidCallback onPopClick(BuildContext context) {
    return () {
      final local = vm.localFile;

      if (local != null && local.existsSync()) {
        Get.to(() => VideoPage.fromFile(local));
      } else {
        IM.chat.getMessageOnlineUrl(msgID: vm.msgId).dataGet.then((val) {
          Get.to(() => VideoPage.fromUrl(val.videoElem!.videoUrl!));
        });
      }
    };
  }

  @override
  Widget $PopView() {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        _$ImgBox(size: vm.size, byLocal: byLocal, byNet: byNet),
        const PlayIcon(size: 36),
      ],
    );
  }

  Widget? byLocal(Size size) {
    Widget? builder(File file) {
      final image = FileImage(file);

      return AppImage(
        image: image,
        fit: BoxFit.cover,
        width: size.width,
        height: size.height,
      );
    }

    return vm.localThumb.firstExists()?.let(builder);
  }

  Widget? byNet(Size size) {
    final url = vm.body.snapshotUrl;

    return NetImage(
      url,
      fit: BoxFit.cover,
      width: size.width,
      height: size.height,
      toProvider: const ImageToNormal(),
    );
  }
}

class VoiceMsg extends UserMsg<VoiceMsgAdapter> {
  VoiceMsg(super.vm, {super.key});

  Future<Uri?> get uri async {
     return getUri();
   }

  @override
  Widget $PopView() {
    final durationView = XText(
      vm.dur.format2(),
      style: const TextStyle(fontSize: 14, color: AppPalette.c3),
    );

    Widget playView = FutureBuilder(
      future: getUri(),
      builder: (a, b) {
        if(b.data == null) {
          return const SizedBox();
        }
        return SoundCtrl.use(b.data!, (playing, state) {
          return AnimatedSwitcher(
            duration: kTabScrollDuration,
            child: Builder(
              key: ValueKey(Tuple2(playing, state)),
              builder: (_) {
                if (playing) return const Icon(Icons.pause_circle_outline_rounded);

                switch (state) {
                  case null:
                  case ProcessingState.idle:
                  case ProcessingState.ready:
                  case ProcessingState.completed:
                    return const Icon(Icons.play_circle_outline_rounded);
                  case ProcessingState.loading:
                  case ProcessingState.buffering:
                    return const Padding(
                      padding: Pad(all: 12),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                }
              },
            ),
          );
        });
      },
    );

    playView = Box(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      child: InkResponse(
        onTap: () async {
          if(await uri == null) {
            return;
          }
          Get.find<SoundCtrl>().doPlay((await uri)!);
        },
        child: playView,
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: vm.isSend //
          ? [Spacing.w12, durationView, playView]
          : [playView, durationView, Spacing.w12],
    );
  }

  Future<Uri> getUri() async {
    final localFile = vm.localFile;

    if (localFile != null && localFile.existsSync()) {
      return Uri.file(localFile.path);
    } else {
      // return Uri.parse('');

      String? url;
      await IM.chat.getMessageOnlineUrl(msgID: vm.msgId).dataGet.then((val) {
        url = val.soundElem?.url;
      });
      return Uri.parse(url ?? '');
    }
  }
}

class InviteGuildMsg extends UserMsg<TxtMsgAdapter> {
  InviteGuildMsg(super.vm);

  @override
  Widget build(BuildContext context) {
    var datas = vm.msg.cloudCustomData ?? "";
    if(datas.isEmpty) {
      return const XText('[数据异常]');
    }

    // 数据异常
    Map? json = null;
    try {
      json = convert.jsonDecode(datas);

      json = convert.jsonDecode(json!["data"]!!);
    } catch(e) {
    }
    if(json == null || json.isEmpty == true) {
      return const XText('[数据异常]');
    }


    // 解析数据
    return GestureDetector(
      onTap: () async {
        String guildId = json!["guild_id"] ?? "";
        // 解析数据
        simpleTry(
          () => Api.Common.getGuildInfo(),
          callback: (data) {
            if(data == null || data["guildId"] == null) {
              // 未拒绝，未加入
              var notOperate = "${json!["user_name"]}邀请您加入${json!["guild_name"]}公会，分成比例为${json["ledger_ratio"]}，是否同意？";
              CommonDialog.joinGuildDialog(notOperate, () {
                simpleTry(
                  () => Api.Room.joinGuild(guildId, 0),
                  callback: (data) {

                  }
                );
              });
            } else if(data == null || data["guildId"] == null) {
              // 己加入
              var hasJoinTips = "您已加入${json!["guild_name"]}公会，分成比例为${json["ledger_ratio"]}";
              CommonDialog.simpleText(hasJoinTips);
            } else {
              // 未拒绝
              var rejectTips = "你已拒绝${json!["guild_name"]}公会邀请";
              CommonDialog.simpleText(rejectTips);
            }
          }
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            XText("入会通知", style: TextStyle(color: Color(0xFF000000), fontSize: 14),),

            SizedBox(height: 10,),
            Container(height: 1, width: double.infinity, color: Color(0xFFCCCCCC).withAlpha(80),),

            SizedBox(height: 10,),
            XText(vm.msg.msgTime.toString(), style: TextStyle(color: Color(0xFF999999), fontSize: 12)),

            SizedBox(height: 10,),
            XText(
              "${json["user_name"]}邀请你加入${json["guild_name"]}公会，预计在${json["out_time"]}前完成处理，如有逾期将作为拒绝处理，点击确认。",
              style: TextStyle(color: Color(0xFF000000), fontSize: 14),
              maxLines: 3,
            ),

            SizedBox(height: 17,),
            Container(height: 1, width: double.infinity, color: Color(0xFFCCCCCC).withAlpha(80),),

            SizedBox(
              height: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: XText("查看详情")),
                  Image.asset(IMG.format("wode_icon_right"), width: 24, height: 24,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _$ImgBox({required Size? size, required Widget? Function(Size) byLocal, required Widget? Function(Size) byNet}) {
  return Stack(
    fit: StackFit.loose,
    children: [
      ConstrainedBox(
        constraints: BoxConstraints(minWidth: 88, maxWidth: Get.width * 0.4, maxHeight: Get.width * 0.6),
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox.fromSize(size: size ?? const Size.square(88)),
        ),
      ),
      Positioned.fill(
        child: LayoutBuilder(
          builder: (_, c) {
            final size = c.biggest;

            return byLocal(size) ?? byNet(size) ?? Spacing.blank;
          },
        ),
      ),
    ],
  );
}


extension on Iterable<File?> {
  File? firstExists() => firstWhereOrNull((it) => it != null && it.existsSync());
}
