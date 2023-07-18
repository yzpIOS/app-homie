import 'package:flutter/material.dart';


///
/// Flutter路由守卫拦截的实现
/// https://www.zhangshengrong.com/p/Z9a23dmxNV/
///
class AppNavObserver extends NavigatorObserver {

  ///
  /// 单例
  ///
  static final AppNavObserver _instance = AppNavObserver();

  ///
  /// 路由监听
  ///
  static final  RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  ///
  /// 监听页面生命周期
  ///
  static void subscribe(RouteAware aware, BuildContext context) {
    var router = ModalRoute.of(context);
    if(router is PageRoute) {
      routeObserver.subscribe(aware, ModalRoute.of(context) as PageRoute);
    }
  }

  ///
  /// 取消页面生命周期监听
  ///
  static void unsubscribe(RouteAware aware) {
    routeObserver.unsubscribe(aware);
  }

  ///
  /// 导航工具
  ///
  static NavigatorState? getNavigator() {
    return _instance.navigator;
  }
}
