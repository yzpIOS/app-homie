import 'package:app/store/svga_effect_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

class SvgaEffectOverlay<CTRL extends SvgaEffectCtrl> extends GetView<CTRL> {
  @override
  final String? tag;

  const SvgaEffectOverlay({super.key, this.tag});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Obx(
        () {
          switch (controller.statusRx()) {
            case AnimationStatus.forward:
            case AnimationStatus.reverse:
              return SVGAImage(controller.svgaCtrl, fit: BoxFit.cover, allowDrawingOverflow: false);
            case AnimationStatus.completed:
            case AnimationStatus.dismissed:
              return Spacing.blank;
          }
        },
      ),
    );
  }
}
