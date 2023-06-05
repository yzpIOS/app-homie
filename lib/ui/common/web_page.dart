import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebPage extends StatefulWidget {
  final Uri uri;
  final String? title;
  final FutureOr<NavigationDecision> Function(NavigationRequest request)? onNavigationRequest;

  const WebPage({super.key, required this.uri, this.title, this.onNavigationRequest = _onNavigationRequest});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late final WebViewController _ctrl;

  final showRx = RxBool(true);
  final progressRx = RxInt(0);

  @override
  void initState() {
    super.initState();

    final PlatformWebViewControllerCreationParams params;

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    _ctrl = //
        WebViewController.fromPlatformCreationParams(params) //
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onNavigationRequest: widget.onNavigationRequest,
              onProgress: progressRx,
              onPageStarted: (url) {
                xlog('onPageStarted -> $url', type: LogType.WEB_VIEW);
              },
              onPageFinished: (url) {
                showRx(false);

                xlog('onPageFinished -> $url', type: LogType.WEB_VIEW);
              },
            ),
          );

    final platform = _ctrl.platform;

    if (platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(Env.isDebug);

      platform.setMediaPlaybackRequiresUserGesture(false);
    }

    try {
      _ctrl.loadRequest(widget.uri);
    } catch (e, s) {
      errLog(e, s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: widget.title),
      body: Stack(
        alignment: Alignment.center,
        children: [
          WebViewWidget(controller: _ctrl),
          Obx(() {
            return showRx.isTrue
                ? Obx(
                    () {
                      final percent = progressRx() / 100;

                      return CircularPercentIndicator(
                        radius: 48 / 2,
                        lineWidth: 3,
                        percent: percent,
                        backgroundColor: AppPalette.tips,
                        progressColor: AppPalette.primary,
                        circularStrokeCap: CircularStrokeCap.round,
                      );
                    },
                  )
                : Spacing.blank;
          }),
        ],
      ),
    );
  }
}

FutureOr<NavigationDecision> _onNavigationRequest(NavigationRequest request) async {
  try {
    final uri = Uri.parse(request.url);

    if (uri.isScheme('http') || uri.isScheme('https')) {
      return NavigationDecision.navigate;
    }
  } catch (e, s) {
    errLog(e, s);
  }

  return NavigationDecision.prevent;
}
