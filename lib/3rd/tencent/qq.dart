import 'dart:async';

import 'package:app/exception.dart';
import 'package:app/tools.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:tencent_kit/tencent_kit_platform_interface.dart';

class Qq {
  Qq._();

  static final Future<TencentKitPlatform> _init = () async {
    final qq = TencentKitPlatform.instance;

    //3.1.0 之后的版本请先获取权限
    await TencentKitPlatform.instance
        .setIsPermissionGranted(granted: true);

    //注册APP
    await qq.registerApp(
      appId: const String.fromEnvironment('qq_app_id'),
      universalLink: 'https://www.apple.com',
    );

    //检测手机是否安装QQ
    if (!await qq.isQQInstalled()) throw const LogicException(-999, '未检测到QQ');

    return qq;
  }();

  static Future<T> _use<T>(Future<T> Function(TencentKitPlatform qq, Stream<TencentResp> resp) fn) async {
    final qq = await _init;

    return fn(qq, qq.respStream());
  }

  static Future<String> doShare(QqShareModel shareModel) async {
    return _use(
          (qq, resp) {
        switch (shareModel.shareType) {
          case 1:
            qq.shareWebpage(
              scene: shareModel.scene,
              targetUrl: shareModel.webpageUrl ?? '',
              title: shareModel.title,
            );
            break;
        }

        return resp.once<String, TencentShareMsgResp>((it) => it.msg!);
      },
    );
  }
}

extension on Stream<TencentResp> {
  Future<T> once<T, E extends TencentResp>(T Function(E) onSuccess) {
    final completer = Completer<T>();

    late final StreamSubscription sub;

    sub = whereType<E>().listen((event) {
      xlog(event);

      sub.cancel();

      switch (event.ret) {
        case TencentResp.kRetUserCancel:
          completer.completeError(
            const CanceledException(),
          );
          break;
        case TencentResp.kRetSuccess:
          completer.complete(
            onSuccess(event),
          );
          break;
        default:
          completer.completeError(
            LogicException(event.ret, event.msg ?? '操作失败'),
          );
          break;
      }
    });

    return completer.future;
  }
}

class QqShareModel {
  final int shareType;//分享类型 1网页
  final int scene;
  final String title;
  final String? webpageUrl;

  QqShareModel({
    required this.shareType,
    required this.scene,
    required this.title,
    this.webpageUrl,
  }) : assert(
  (shareType == 1 && webpageUrl != null)
  );
}