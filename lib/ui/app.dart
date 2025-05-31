import 'package:app/common/AppNavObserver.dart';
import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/config_ctrl.dart';
import 'package:app/store/im/im_ctrl.dart';
import 'package:app/store/intro_ctrl.dart';
import 'package:app/store/link_ctrl.dart';
import 'package:app/store/local_notify_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/super_gift_broadcast_ctrl.dart';
import 'package:app/store/sound_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/unity_view.dart';
import 'package:app/ui/login/login_home_page.dart';
import 'package:app/ui/main/main_page.dart';
import 'package:app/ui/message/chat/chat_page.dart';
import 'package:app/widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:provider/provider.dart';
import 'package:app/common/theme.dart';
// import '../common/common.dart';
import 'login/ad_loading_page.dart';

class App extends StatefulWidget {
  static final directionRx = Rx(ScrollDirection.idle);

  const App({super.key});

  @override
  State<App> createState() => _AppState();

  static void toApp() => Get.offAllNamed('/App');

  static void toLogin([String? msg]) {
    if (Get.isRegistered<bool>(tag: 'LoginPageMark')) {
      xlog('重复跳转登录页面！！！ -> Msg[$msg]');
    } else {
      Get.offAllNamed('/Login', arguments: msg);
    }
  }

  // 跳转广告页
  static void toADLoading() => Get.offAllNamed('/ADLoading');
}

class _AppState extends State<App> with WidgetsBindingObserver, WidgetsBindingObserverMixin {
  RxMap<String, dynamic> datas = RxMap();
  @override
  void initState() {
    super.initState();
    // 网络变化
    Connectivity().onConnectivityChanged.listen(ConnState.onChanged);
    TimeFormat.initLocale('zh_cn');

    Api.Common.config().then((value) {
      datas.value = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget child =
    // ScreenUtilInit(
    //   designSize: const Size(375, 812),
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    //   builder: (context, child) =>
          GetMaterialApp(
      title: appInfo.appName,
      showPerformanceOverlay: false,
      checkerboardOffscreenLayers: false,
      checkerboardRasterCacheImages: false,
      smartManagement: SmartManagement.onlyBuilder,
      theme: $theme,
      getPages: _pages,
      enableLog: true,
      defaultTransition: Transition.cupertino,
      builder: _transitionBuilder,
      initialBinding: _AppBindings(),
      // navigatorObservers: [SentryNavigatorObserver()],
      supportedLocales: const [
        Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      ],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      navigatorObservers: [AppNavObserver.routeObserver],
    );
  //  );

    child = Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        const Positioned(top: -1, left: -1, width: 1, height: 1, child: UnityHolder()),
      ],
    );

    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Obx(() {
        if(datas.containsKey("is_black_white") && datas["is_black_white"] == true) {
          return ColorFiltered(
            colorFilter:const ColorFilter.mode(Colors.grey, BlendMode.color),
            child: child,
          );
        } else {
          return child;
        }
      }),
    );
  }

  Widget _transitionBuilder(BuildContext context, Widget? child) {
    child = GestureDetector(onTap: hideKeyboard, child: child);

    child = NotificationListener<UserScrollNotification>(
      child: child,
      onNotification: (it) {
        App.directionRx(it.direction);

        return false;
      },
    );

    final mq = MediaQuery.of(context).copyWith(textScaleFactor: 1, boldText: false);

    child = MediaQuery(
      data: mq,
      child: Provider<Orientation>.value(
        value: mq.orientation,
        child: Portal(child: child),
      ),
    );

    return child;
  }

  List<GetPage> get _pages {
    return [
      GetPage(name: '/', page: Scaffold.new),
      GetPage(name: '/Login', page: LoginHomePage.new),
      GetPage(name: '/App', page: MainPage.new),
      GetPage(name: ChatPage.routeName, page: () => const ChatPage()),
      GetPage(name: '/ADLoading', page: ADLoadingPage.new),
    ];
  }

  @override
  Future<bool> didPopRoute() => Future.value(WaitingCtrl.obj.isShow);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) => AppLifecycleEvent(state).fire();
}

class _AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SocketCtrl());

    Get.put(AppWaiting());
    Get.put(WaitingCtrl());

    Get.put(OAuthCtrl());
    Get.put(ImCtrl());
    // Get.put(LocationCtrl());
    Get.put(IntroCtrl());
    Get.put(ConfigCtrl());
    Get.put(LinkCtrl());
    Get.put(LocalNotifyCtrl());

    Get.put(SoundCtrl());
    Get.put(UnityCtrl());

    Get.put(SuperGiftBroadcastCtrl());
  }
}
