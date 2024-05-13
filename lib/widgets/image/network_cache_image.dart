import 'package:app/tools.dart';
import 'package:app/widgets.dart';

export 'image_url_help.dart';

class NetImage extends StatelessWidget {
  final String? url;
  final String? blur;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final ImageUrlToProvider toProvider;
  final Color? color;
  final BlendMode? blendMode;
  final Image? placeholderImage;

  const NetImage(
    this.url, {
    super.key,
    this.blur,
    this.width,
    this.height,
    this.alignment,
    this.color,
    this.blendMode,
    this.fit = BoxFit.contain,
    this.toProvider = const ImageToThumb(),
    this.placeholderImage,
  }) : assert(url != 'null');

  @override
  Widget build(BuildContext context) {
    final url = this.url;
    if (url == null || url.isEmpty) {
      if (placeholderImage != null) {
        return placeholderImage!;
      } else {
        return _imgErr(context);
      }
    }

    try {
      final uri = Uri.parse(url);

      return _imgView(toProvider.toProvider(Right(uri)));
    } catch (_) {
      return _imgErr(context);
    }
  }

  Widget _imgView(ImageProvider img) {
    if (width == null) {
      return LayoutBuilder(
        builder: (_, c) {
          final maxW = c.maxWidth;
          final maxH = c.maxHeight;

          final _width = maxW == 0 || maxW == double.infinity ? null : maxW;
          final _height = maxH == 0 || maxH == double.infinity ? null : maxH;

          return AppImage(
            image: img,
            fit: fit,
            blur: blur,
            width: _width,
            height: height ?? _height,
            alignment: alignment,
            color: color,
            blendMode: blendMode,
          );
        },
      );
    }

    return AppImage(
      image: img,
      fit: fit,
      blur: blur,
      width: width,
      height: height,
      alignment: alignment,
      color: color,
      blendMode: blendMode,
    );
  }

  Widget _imgErr(BuildContext ctx) {
    return SizedBox(
      width: width,
      height: height,
      child: ctx
          .state<ImgErr>(Tuple3<String?, Object, StackTrace?>(blur, '', null)),
    );
  }
}
