import 'package:app/common/AppNavObserver.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
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
import 'package:app/store/unity_ctrl.dart';
import 'package:app/store/user/user_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/statistic.dart';
import 'package:app/ui/common/svga_effect_overlay.dart';
import 'package:app/ui/common/unity_view.dart';
import 'package:app/ui/intro/room_intro_overlay.dart';
import 'package:app/ui/login/ad_loading_page.dart';
import 'package:app/ui/moment/widgets/reply_view.dart';
import 'package:app/ui/room/overlay/photo_mode_overlay.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:slugid/slugid.dart';
import 'package:wakelock/wakelock.dart';

class RoomPage extends StatefulWidget {
  static final String room_name = '/$RoomPage';

  final SceneCtrl controller;

  const RoomPage._(this.controller);

  static Future<void> show([bool off = false]) async {
    final mgr = Get.find<RoomManagerCtrl>();

    if(RoomManagerCtrl.ins.sceneCtrl2 != null) {
      var roomHttpInfo = RoomManagerCtrl.ins.sceneCtrl.info;
      Statistic.userEnterRoom(roomId: RoomManagerCtrl.ins.sceneCtrl.roomId, roomName: roomHttpInfo["room_name"]);
    }

    // 处理异常
    if(SocketCtrl.ins.share.forceWaitTimes > 0) {
      logForDebug("用户从后台到前台，并进入房间, 需要等待网络包的响应， 此时 waitTimes = ${SocketCtrl.ins.share.forceWaitTimes}");
      // 显示loading
      WaitingCtrl.obj.show();
      // 添加超时时间
      Future.delayed(Duration(seconds: SocketCtrl.ins.share.forceWaitTimes)).asStream().listen((event) {
        WaitingCtrl.obj.hidden();
      });
      // 待主待
      await SocketCtrl.ins.isCConnect();
      // 隐藏loading
      WaitingCtrl.obj.hidden();
      if(mgr.sceneCtrl2 == null) {
        showToast("网络异常，请重试");
        logForDebug("进房过程中发现网络断掉，房间己关闭，直接退出");
        return;
      }
    }

    Future _show() {
      logForDebug("打开房间，请稍后");
      SceneCtrl? sceneCtrl = mgr.sceneCtrl2;
      if(sceneCtrl == null) {
        return Future.value();
      }
      Widget builder() => RoomPage._(sceneCtrl).toOverlay();

      // mgr.doNormalState();
      if(off) {
        return Get.off(
          builder,
          routeName: room_name,
            popGesture: false,
            transition: Transition.noTransition,
            preventDuplicates: false
        )!;
      } else {
        return Get.to(
            builder,
            routeName: room_name,
            popGesture: false,
            transition: Transition.noTransition,
            preventDuplicates: false
        )!;
      }
    }

    try {
      await _show();

      mgr.sceneCtrl2?.isDisposed = true;
      if (mgr.sceneCtrl2?.isRequestBack == true && mgr.sceneCtrl.keepState) {
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

class _RoomPageState extends State<RoomPage> with BusStateMixin, GetStateMixin, OverlayMixin, RouteAware {
  late final controller = widget.controller;
  bool isPopUp = false;

  @override
  void initState() {
    super.initState();

    Wakelock.enable();
    _init();

    // 强制退出房间事件
    on<RoomExitEvent>((event) {
      if(isPopUp) {
        return;
      }
      isPopUp = true;
      // context.safePop().whenComplete(() => Get.alertDialog(event.message));

      Get.until((route) {
        return route.isFirst;
      });
      delay(300, () {
        Get.alertDialog(event.message);
      });
    });
    // 进房后，关闭所有的loading
    WaitingCtrl.obj.hidden();

    // 是否显示加载进度图
    if (controller.roomType == RoomType.square) {// 广场
      if (Get.find<UserCtrl>().squareLoadingHasBeenDisplayed == false) {
        Get.find<UserCtrl>().squareLoadingHasBeenDisplayed = true;
      } else {
        RoomManagerCtrl.ins.sceneCtrl2?.completeProgress();
      }
    } else {// 其他房间
      if (Get.find<UserCtrl>().roomLoadingHasBeenDisplayed == false) {
        Get.find<UserCtrl>().roomLoadingHasBeenDisplayed = true;
      } else {
        RoomManagerCtrl.ins.sceneCtrl2?.completeProgress();
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 添加监听订阅页面的生命周期
    AppNavObserver.subscribe(this, context);
  }


  @override
  void dispose() {
    // 退出房间
    if(RoomManagerCtrl.ins.sceneCtrl2 != null) {
      var roomHttpInfo = RoomManagerCtrl.ins.sceneCtrl.info;
      Statistic.userExitRoom(roomId: RoomManagerCtrl.ins.sceneCtrl.roomId, roomName: roomHttpInfo["room_name"]);
    }
    Wakelock.disable();
    AppNavObserver.unsubscribe(this);
    RoomManagerCtrl.ins.shouldOpenGift = false;
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
    }
  }

  ///
  /// 当前页面push到其他页面走这里
  ///
  @override
  void didPushNext() {
    super.didPushNext();
  }

  ///
  /// 从其他页面pop回当前页面走这里
  ///
  @override
  void didPopNext() {
    super.didPopNext();
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
        debugPrint("用户被禁；userInfo = ${event?.data?.toString()}");
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
          maxLength: ChatTextInputFormatter.chatTextMaxLength,
        );

        sheet.onType<String>((it) {
          simpleTry(
            () => Api.RoomMsg.sendMessage(roomId: controller.roomId, message: it),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = UnityView(
      uniqueKey: 'RoomScene[${controller.roomId}]',
      onInit: controller.loadScene,
      fromRoom: true,
    );

    child = Scaffold(
      backgroundColor: Colors.grey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // unity界面
          Positioned.fill(
            child: child,
          ),
          // 返回按钮
          controller.createHeader(),
          // 加载进度
          Positioned.fill(
            child: Obx(() {
              if(controller.adLoadingIsFinishRx.value == true) {
                return const SizedBox(width: 1, height:1);
              }
              return const ADLoadingPage(fromType: 2,);
            }),
          )
        ],
      )
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
