import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class UnityWidget extends StatefulWidget {
  final PlatformViewCreatedCallback? onPlatformViewCreated;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  const UnityWidget({super.key, this.gestureRecognizers, this.onPlatformViewCreated});

  @override
  State<UnityWidget> createState() => _UnityWidgetState();
}

class _UnityWidgetState extends State<UnityWidget> {
  static const viewType = 'f_unity/unity_view';

  late final completer = Completer<int>();
  late final gestureRecognizers = widget.gestureRecognizers ?? const {};

  @override
  void dispose() {
    if (completer.isCompleted) {
      if (Platform.isIOS) {
        completer.future.then((val) {
          return MethodChannel('${viewType}_$val').invokeMethod<void>('dispose');
        });
      }
    } else {
      completer.completeError('数据错误');
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return UiKitView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: null,
        gestureRecognizers: gestureRecognizers,
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else {
      return AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        gestureRecognizers: gestureRecognizers,
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: _onPlatformViewCreated,
      );

      return PlatformViewLink(
        viewType: viewType,
        surfaceFactory: (context, controller) {
          return AndroidViewSurface(
            controller: controller as AndroidViewController,
            gestureRecognizers: gestureRecognizers,
            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          );
        },
        onCreatePlatformView: (params) {
          return PlatformViewsService.initExpensiveAndroidView(
            id: params.id,
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: null,
            creationParamsCodec: const StandardMessageCodec(),
            onFocus: () {
              params.onFocusChanged(true);
            },
          )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..addOnPlatformViewCreatedListener(_onPlatformViewCreated)
            ..create();
        },
      );
    }
  }

  void _onPlatformViewCreated(int id) {
    completer.complete(id);

    widget.onPlatformViewCreated?.call(id);
  }
}
