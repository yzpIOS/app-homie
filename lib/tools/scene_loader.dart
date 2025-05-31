import 'dart:async';

import 'package:app/types.dart';

typedef DoOnAfter = FutureOr<void> Function();
typedef DoOnBefore = FutureOr<JMap> Function();

typedef SceneLoader = Future<void> Function(String scene, {DoOnAfter? doOnAfter, DoOnBefore? doOnBefore});

class SceneInfo {
  final String scene;
  final DoOnAfter? doOnAfter;
  final DoOnBefore? doOnBefore;

  const SceneInfo(this.scene, {this.doOnBefore, this.doOnAfter});
}
