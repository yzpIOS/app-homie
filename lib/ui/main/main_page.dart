import 'dart:io';

import 'package:app/common/AppNavObserver.dart';
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/event/event.dart';
import 'package:app/shop/home_shop_page.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/main/nav_view.dart';
import 'package:app/ui/message/message_page.dart';
import 'package:app/ui/moment/moment_page.dart';
import 'package:app/ui/my/my_page_2.dart';
import 'package:app/ui/my/wallet/apple_purchase.dart';
import 'package:app/ui/podcast/hot_podcast_page.dart';
import 'package:app/ui/room/room_icon_overlay.dart';
import 'package:app/ui/task/my_sign_view.dart';
import 'package:app/ui/task/young_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_portal/flutter_portal.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BusStateMixin, WidgetsBindingObserver, RouteAware {
  final selector = ValueNotifier(1);

  bool resumeReconnect = false;
  StreamSubscription? _closeCountDown;
  StreamSubscription? _appStreamSubscription;

  // 用于苹果支付补单用
  ApplePurchase? applePurchase = null;

  final pages = <Widget>[], navs = <NavBarItem>[];

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) FlutterDisplayMode.setHighRefreshRate();

    _initPages();

    on<NoAuthEvent>(
      (event) {
        Get.find<OAuthCtrl>().doLogout(
          reqApi: false,
          msg: '[${event.msg ?? '登录失效'}]，需重新登录',
        );
      },
    );

    on<GoDressUpEvent>(
      (_) => selector.value = 2, //跳到商城页
    );

    if (Env.isRelease) {
      post(
        () async {
          if (await Get.dialog(const YoungDialog()) == false) return;

          await SignDialog.show(isManual: false);

          // checkVersion(context, alert: false);
        },
      );
    }
    selector.addListener(() {
      if(selector.value == 2) {
        // 切换到unity，需要开始Unity
        UnityCtrl.ins.sendCmd(App2UnityEnum.FTU_IOS_RENDER_EVENT,
            data: {UnityCtrl.UNITY_RESUME_EVENT:UnityCtrl.UNITY_RESUME_EVENT});
      } else {
        // 切走了，停止unity
        UnityCtrl.ins.sendCmd(App2UnityEnum.FTU_IOS_RENDER_EVENT,
            data: {UnityCtrl.UNITY_STOP_EVENT:UnityCtrl.UNITY_STOP_EVENT});
      }
    });
    WidgetsBinding.instance.addObserver(this);
    // 添加监听订阅页面的生命周期
    SocketCtrl.ins.addDisconnect(onDisconnectCallBack);

    _appStreamSubscription = Future.delayed(const Duration(seconds: 1)).asStream().listen((event) {
      applePurchase = ApplePurchase(compensate: true);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 添加监听订阅页面的生命周期
    AppNavObserver.subscribe(this, context);
  }

  ///
  /// 关闭房间
  ///
  void onDisconnectCallBack() {
    RoomManagerCtrl.ins.closeRoom();
  }


  ///
  /// 当前页面push到其他页面走这里
  ///
  @override
  void didPushNext() {
    super.didPushNext();
    if(selector.value == 2) {
      UnityCtrl.ins.sendCmd(App2UnityEnum.FTU_IOS_RENDER_EVENT,
          data: {UnityCtrl.UNITY_STOP_EVENT:UnityCtrl.UNITY_STOP_EVENT});
    }
    applePurchase?.dispose();
  }

  ///
  /// 从其他页面pop回当前页面走这里
  ///
  @override
  void didPopNext() {
    super.didPopNext();
    if(selector.value == 2) {
      UnityCtrl.ins.sendCmd(App2UnityEnum.FTU_IOS_RENDER_EVENT,
          data: {UnityCtrl.UNITY_RESUME_EVENT: UnityCtrl.UNITY_RESUME_EVENT});
    }
  }

  @override
  void dispose() {
    _closeCountDown?.cancel();
    applePurchase?.dispose();
    _appStreamSubscription?.cancel();
    AppNavObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    SocketCtrl.ins.removeDisconnect(onDisconnectCallBack);
    super.dispose();
  }

  void _initPages() {
    final convBadge = Get.find<ConvManagerCtrl>().badge;

    final items = [
      Tuple4('动态', DelayView(builder: (_) => const MomentPage(), fraction: 0.3), null, const MomentRefreshEvent()),
      const Tuple4('热播', HotPodcastPage(), null, null),
      Tuple4('商城', DelayView(builder: (_) => const HomeShopPage(), fraction: 0.3), null, const ShopRefreshEvent()),
      Tuple4('消息', DelayView(builder: (_) => const MessagePage(), fraction: 0.3), convBadge, const ConvRefreshEvent()),
      Tuple4('我的', DelayView(builder: (_) => const MyPage2(), fraction: 0.3), null, null),
    ];

    for (final item in items) {
      pages.add(item.value2);
      navs.add(NavBarItem(label: item.value1, badge: item.value3, refreshEvent: item.value4));
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch(state) {
      case AppLifecycleState.inactive:
        //??
        break;
      case AppLifecycleState.resumed:
        _closeCountDown?.cancel();
        // 从后台到前台了
        // 开启socket连接
        if(!resumeReconnect) {
          return;
        }
        resumeReconnect = false;
        // 重新连接
        SocketCtrl.ins.startClient(Env.serverIP, Env.serverPort);
        // 开始heart beat
        SocketCtrl.ins.startUnityHeartBeat();
        break;
      case AppLifecycleState.paused:
        _closeCountDown?.cancel();
        _closeCountDown = Future.delayed(const Duration(seconds: 40)).asStream().listen((event) {
          resumeReconnect = true;
          SocketCtrl.ins.closeSocket();
          SocketCtrl.ins.cancelUnityHeartBeat();
        });
        break;
      case AppLifecycleState.detached:
        // app 结束时调用
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const _label = PortalLabel('HomeOverlay');

    Widget child = Scaffold(
      body: SlidePageView(selector: selector, pages: pages),
      bottomNavigationBar: NavBar(selector: selector, items: navs),
    );

    child = Portal(
      labels: const [_label],
      child: PortalTarget(
        portalCandidateLabels: const [_label],
        portalFollower: const RoomIconOverlay(),
        child: child,
      ),
    );

    if (GetPlatform.isAndroid) {
      child = WillPopScope(
        onWillPop: () => goHome().then((_) => false),
        child: child,
      );
    }

    return child;
  }
}
