import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<void> lockScreenToPortrait() {
  return _setOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
}

Future<void> lockScreenToLandscape() {
  return _setOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
}

Future<void> _setOrientations(List<DeviceOrientation> orientations) async {
  await SystemChrome.setPreferredOrientations(orientations);
}

Future<void> screenRotate([Orientation? now]) {
  return (now ?? Get.orientation).screenRotate();
}

extension XOrientation on Orientation {
  Future<void> screenRotate() {
    switch (this) {
      case Orientation.portrait:
        return lockScreenToLandscape();
      case Orientation.landscape:
        return lockScreenToPortrait();
    }
  }
}

extension XAdapt on num {
  double get adaptW => AppSize.scaleW * this;
}
