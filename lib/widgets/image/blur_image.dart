import 'package:app/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class BlurImage extends StatefulWidget {
  final Widget child;
  final String? blurHash;

  BlurImage({required this.child, this.blurHash}) : super(key: ValueKey(blurHash));

  @override
  State<BlurImage> createState() => _BlurImageState();
}

class _BlurImageState extends State<BlurImage> {
  late final BlurHashImage? blurImage;

  @override
  void initState() {
    super.initState();
    final blurHash = widget.blurHash;

    blurImage = //
        blurHash != null && blurHash.length >= 6 //
            ? BlurHashImage(blurHash)
            : null;
  }

  @override
  Widget build(BuildContext context) {
    final image = blurImage;
    final child = widget.child;

    return image == null
        ? child
        : Image(
            image: image,
            fit: BoxFit.fill,
            errorBuilder: (_, __, ___) => child,
          );
  }
}
