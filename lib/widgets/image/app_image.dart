import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:octo_image/octo_image.dart';

class AppImage extends StatelessWidget {
  final ImageProvider image;
  final String? blur;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final Color? color;
  final BlendMode? blendMode;

  const AppImage({
    super.key,
    required this.image,
    this.blur,
    this.fit,
    this.width,
    this.height,
    this.alignment,
    this.color,
    this.blendMode,
  });

  @override
  Widget build(BuildContext context) {
    double? progress;

    return OctoImage(
      image: image,
      width: width,
      height: height,
      color: color,
      colorBlendMode: blendMode,
      memCacheWidth: width?.toPx(),
      memCacheHeight: null,
      fit: fit,
      alignment: alignment,
      gaplessPlayback: true,
      fadeOutDuration: const Duration(milliseconds: 618),
      fadeOutCurve: Curves.easeOutCubic,
      fadeInDuration: Duration.zero,
      fadeInCurve: Curves.easeOutCubic,
      errorBuilder: _errorBuilder,
      progressIndicatorBuilder: (ctx, event) {
        if (event != null) {
          final total = event.expectedTotalBytes;

          if (total != null && total > 0) {
            progress = event.cumulativeBytesLoaded / total;
          }
        }

        return _loadingBuilder(ctx, progress);
      },
    );
  }

  Widget _errorBuilder(BuildContext ctx, Object e, StackTrace? s) {
    return SizedBox(
      width: width,
      height: height,
      child: ctx.state<ImgErr>(Tuple3<String?, Object, StackTrace?>(blur, e, s)),
    );
  }

  Widget _loadingBuilder(BuildContext ctx, double? progress) {
    return SizedBox(
      width: width,
      height: height,
      child: ctx.state<ImgLoading>(Tuple2<String?, double?>(blur, progress)),
    );
  }
}
