import 'dart:typed_data';

import 'package:app/exception.dart';
import 'package:app/tools.dart';
import 'package:slugid/slugid.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:wechat_kit/wechat_kit.dart';

class Wx {
  Wx._();

  static final Future<WechatKitPlatform> _init = () async {
    final wx = WechatKitPlatform.instance;

    await wx.registerApp(
      appId: const String.fromEnvironment('wx_app_id'),
      universalLink: 'https://www.apple.com',
    );

    try {
      await wx.handleInitialWXReq();
    } catch (e, s) {
      errLog(e, s);
    }

    if (!await wx.isInstalled()) throw const LogicException(-999, '未检测到微信');

    return wx;
  }();

  static Future<T> _use<T>(Future<T> Function(WechatKitPlatform wx, Stream<WechatResp> resp) fn) async {
    final wx = await _init;

    return fn(wx, wx.respStream());
  }

  static Future<String> doShare(WxShareModel shareModel) async {
    return _use(
      (wx, resp) {
        switch (shareModel.shareType) {
          case 1:
            wx.shareWebpage(
              scene: shareModel.scene,
              webpageUrl: shareModel.webpageUrl ?? '',
              title: shareModel.title,
              description: shareModel.description,
              thumbData: shareModel.thumbData,
            );
            break;
        }

        return resp.once<String, WechatShareMsgResp>((it) => it.errorMsg!);
      },
    );
  }

  static Future<String> doAuth() async {
    final state = Slugid.nice().toString();

    return _use(
      (wx, resp) {
        const scope = [
          WechatScope.kSNSApiUserInfo,
        ];

        wx.auth(scope: scope, state: state);

        return resp.once<String, WechatAuthResp>((it) => it.code!);
      },
    );
  }

  static Future<void> doPay(Map data) async {
    return _use(
      (wx, resp) {
        wx.pay(
          appId: data['appId'],
          partnerId: data['partnerid'],
          prepayId: data['prepayid'],
          package: data['package'],
          nonceStr: data['noncestr'],
          timeStamp: data['timestamp'],
          sign: data['sign'],
        );

        return resp.once<void, WechatPayResp>((_) {});
      },
    );
  }
}

extension on Stream<WechatResp> {
  Future<T> once<T, E extends WechatResp>(T Function(E) onSuccess) {
    final completer = Completer<T>();

    late final StreamSubscription sub;

    sub = whereType<E>().listen((event) {
      xlog(event);

      sub.cancel();

      switch (event.errorCode) {
        case WechatResp.kErrorCodeUserCancel:
          completer.completeError(
            const CanceledException(),
          );
          break;
        case WechatResp.kErrorCodeSuccess:
          completer.complete(
            onSuccess(event),
          );
          break;
        default:
          completer.completeError(
            LogicException(event.errorCode, event.errorMsg ?? '操作失败'),
          );
          break;
      }
    });

    return completer.future;
  }
}

class WxShareModel {
  final int shareType;//分享类型 1网页
  final int scene;
  final String? title;
  final String? description;
  final Uint8List? thumbData;
  final String? webpageUrl;

  WxShareModel({
    required this.shareType,
    required this.scene,
    this.title,
    this.description,
    this.thumbData,
    this.webpageUrl,
  }) : assert(
          (shareType == 1 && webpageUrl != null)
        );
}
