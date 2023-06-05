import 'dart:io';

import 'package:app/tools.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifyCtrl extends GetxService {
  final plugin = FlutterLocalNotificationsPlugin();

  @override
  void onInit() async {
    super.onInit();

    if (Platform.isAndroid) {
      plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission().then(
        (val) {
          xlog('通知权限 -> $val');
        },
      );
    }

    await plugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('launcher_notification'),
        iOS: DarwinInitializationSettings(
          defaultPresentAlert: true,
          defaultPresentBadge: true,
          defaultPresentSound: true,
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          requestCriticalPermission: true,
          onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
        ),
      ),
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: _onDidReceiveBackgroundNotificationResponse,
    );

    // final items = await plugin.getActiveNotifications();
  }

  void showImLocalNotify({
    required int id,
    required String title,
    required String body,
    int? number,
    int? when,
    bool playSound = true,
    bool enableVibration = true,
  }) async {
    await plugin.show(
      id,
      title,
      body,
      payload: '',
      NotificationDetails(
        android: AndroidNotificationDetails(
          '0',
          'IM',
          groupKey: 'IM',
          playSound: playSound,
          enableVibration: enableVibration,
          showWhen: true,
          when: when,
          number: number,
          autoCancel: true,
          priority: Priority.high,
          channelShowBadge: true,
          visibility: NotificationVisibility.private,
          category: AndroidNotificationCategory.message,
        ),
      ),
    );
  }

  static void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {
    //TODO
    assert(false, '未处理的业务 -> $id');
  }

  static void _onDidReceiveNotificationResponse(NotificationResponse details) {
    //TODO
    assert(false, '未处理的业务 -> $details');
  }

  static void _onDidReceiveBackgroundNotificationResponse(NotificationResponse details) {
    //TODO
    assert(false, '未处理的业务 -> $details');
  }
}
