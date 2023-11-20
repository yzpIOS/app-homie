import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:app/widgets/webview/channels/channel_compose.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:app/widgets/webview/channels/channel_route.dart';

class WebViewPage extends StatefulWidget {
  String url;
  String title;

  WebViewPage({super.key, required this.url, required this.title});

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  String? url;

  late WebViewController webViewController;

  final JsBridgeChannel _jsBridgeChannel = JsBridgeChannel();

  @override
  void initState() {
    super.initState();
    var paramter = Get.arguments;
    if(paramter is Map && paramter.containsKey("url")) {
      // 获取url
      url = paramter["url"];
    } else {
      paramter = Get.parameters;
      // 获取url
      if(paramter.containsKey("url")) {
        url = paramter["url"];
      } else {
        url = widget.url;
      }
    }

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    webViewController = WebViewController.fromPlatformCreationParams(params);
    // javaScript
    webViewController.platform.setJavaScriptMode(JavaScriptMode.unrestricted);
    // disable zoom
    webViewController.platform.enableZoom(false);
    // background color
    webViewController.platform.setBackgroundColor(const Color(0x00000000));
    if (webViewController.platform is AndroidWebViewController) {
      (webViewController.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(true);
      // file selector
      (webViewController.platform as AndroidWebViewController).setOnShowFileSelector((params) async {
        var list = params.acceptTypes.where((element) => element.contains("image"));
        return Future.value([]);
      });
    } else if(webViewController.platform is WebKitWebViewController) {
      // 返回手势
      (webViewController.platform as WebKitWebViewController).setAllowsBackForwardNavigationGestures(true);
    }

    _jsBridgeChannel.addJsBridge(ChannelRoute());
    // javaScript调用原生方法
    webViewController.addJavaScriptChannel("homieBridge", onMessageReceived: (data) {
      _jsBridgeChannel.controller = webViewController;
      _jsBridgeChannel.call(context, data);
    });
    webViewController.setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          injectUserInfo();
        },
        onProgress: (progress) {
          injectUserInfo();
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    // 数据为空
    if(url == null) {
      return Scaffold(
        body: Container(color: Colors.black12,),
      );
    }
    // 显示webview
    return Scaffold(
      appBar: xAppBar(title: widget.title),
      body: WebViewWidget(
        controller: webViewController
          ..loadRequest(Uri.parse(url ?? "")),
      ),
    );
  }

  void injectUserInfo() {
  }
}