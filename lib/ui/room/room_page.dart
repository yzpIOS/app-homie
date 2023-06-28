import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/model/enum/unity_event_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/store/intro_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_gift_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/super_gift_broadcast_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/svga_effect_overlay.dart';
import 'package:app/ui/common/unity_view.dart';
import 'package:app/ui/intro/room_intro_overlay.dart';
import 'package:app/ui/moment/widgets/reply_view.dart';
import 'package:app/ui/room/overlay/photo_mode_overlay.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:slugid/slugid.dart';
import 'package:wakelock/wakelock.dart';

class RoomPage extends StatefulWidget {
  final SceneCtrl controller;

  const RoomPage._(this.controller);

  static void show([bool off = false]) async {
    final mgr = Get.find<RoomManagerCtrl>();

    Future _show() {
      Widget builder() => RoomPage._(mgr.sceneCtrl).toOverlay();

      mgr.doNormalState();

      return (off ? Get.off : Get.to).call(
        builder,
        routeName: '$RoomPage',
        popGesture: false,
        transition: Transition.noTransition,
      )!;
    }

    try {
      await _show();

      if (mgr.sceneCtrl.isReady && mgr.sceneCtrl.keepState) {
        mgr.doMiniState();
      } else {
        await mgr.doCloseState();
      }
    } finally {
      lockScreenToPortrait();
    }
  }

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> with BusStateMixin, GetStateMixin, OverlayMixin {
  late final controller = widget.controller;

  @override
  void initState() {
    super.initState();

    Wakelock.enable();

    _init();
  }

  @override
  void dispose() {
    Wakelock.disable();

    super.dispose();
  }

  void _init() async {
    final safePop = context.safePop;

    try {
      await controller.ready;

      _initListener();
    } catch (e) {
      final String msg;

      if (e is CanceledException) {
        return;
      } else if (e is LogicException) {
        msg = e.msg;
      } else if (Env.isDebug) {
        msg = '$e';
      } else {
        msg = '加载失败';
      }

      safePop().whenComplete(() => Get.alertDialog(msg));
    }
  }

  void _initListener() {
    final closePage = context.closePage;

    void _doClose(String? msg) async {
      controller.keepState = false;
      await closePage();

      if (msg != null) Get.alertDialog(msg);
    }

    on<SwitchRoomEvent>(
      (_) => _doClose(null),
    );

    on<RoomCloseEvent>(
      (_) => _doClose('主播已下播'),
    );

    on<UserBlockEvent>(
      test: (event) {
        return OAuthCtrl.isSelf(event.uid);
      },
      (_) => _doClose('你被封禁了'),
    );

    on<XUnityEvent>(
      test: (event) => event.code == Unity2AppEnum.UTF_NETWORK_DISCONNECT,
      (event) {
        final data = event.ext;

        final msg = data is Map ? data['msg'] : null;

        _doClose(msg ?? '网络错误，已断开连接');
      },
    );

    on<RoomAtEvent>(
      (event) {
        final sheet = ReplySheet.show(
          TextEditingController(text: '@${event.nickName} '),
          autofocus: true,
          barrierColor: Colors.transparent,
        );

        sheet.onType<String>((it) {
          simpleTry(
            () => Api.RoomMsg.sendMessage(roomId: controller.roomId, message: it),
          );
        });
      },
    );

    bindGet(SuperGiftBroadcastCtrl());
  }

  @override
  Widget build(BuildContext context) {
    Widget child = UnityView(
      uniqueKey: 'RoomScene[${controller.roomId}]',
      onInit: controller.loadScene,
    );

    child = Scaffold(
      backgroundColor: Colors.grey,
      resizeToAvoidBottomInset: false,
      body: child,
    );

    child = UiOverlayRegion.light(child: child);

    return child;
  }

  @override
  late List<XOverlayWidget> overlay = [
    XOverlayWidget(
      child: Obx(
        () {
          switch (controller.sceneHudRx()) {
            case RoomHudState.None:
              return Spacing.blank;
            case RoomHudState.Normal:
              return Builder(builder: controller.overlay);
            case RoomHudState.Camera:
              return PhotoModeOverlay();
          }
        },
      ),
    ),
    //排除广场
    if (controller.roomType != RoomType.square) //
      XOverlayWidget(
        ignorePointer: true,
        child: _RoomEffectOverlay(sceneHudRx: controller.sceneHudRx),
      ),
    //只有公会才显示
    if (controller.roomType == RoomType.guild && !Get.find<IntroCtrl>().isMarked('RoomIntroOverlay'))
      XOverlayWidget(
        uniqueKey: 'RoomIntroOverlay',
        rootOverlay: true,
        child: Obx(
          () {
            switch (controller.sceneHudRx()) {
              case RoomHudState.None:
                return Spacing.blank;
              case RoomHudState.Normal:
              case RoomHudState.Camera:
                return RoomIntroOverlay();
            }
          },
        ),
      ),
  ];
}

class _RoomEffectOverlay extends StatefulWidget {
  final Rx<RoomHudState> sceneHudRx;

  const _RoomEffectOverlay({required this.sceneHudRx});

  @override
  State<_RoomEffectOverlay> createState() => _RoomEffectOverlayState();
}

class _RoomEffectOverlayState extends State<_RoomEffectOverlay> {
  final tag = Slugid.nice().toString();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (widget.sceneHudRx()) {
          case RoomHudState.None:
            return Spacing.blank;
          case RoomHudState.Normal:
          case RoomHudState.Camera:
            return GetBuilder(
              init: RoomGiftCtrl(),
              tag: tag,
              builder: (_) => SvgaEffectOverlay<RoomGiftCtrl>(tag: tag),
            );
        }
      },
    );
  }
}
