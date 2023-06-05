import 'package:app/widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';

class XStadiumBorder extends OutlinedBorder {
  final double cornerSmoothing;

  const XStadiumBorder({super.side, this.cornerSmoothing = 0.5});

  @override
  XStadiumBorder copyWith({
    BorderSide? side,
    double? cornerSmoothing,
    BorderAlign? borderAlign,
  }) {
    return XStadiumBorder(
      side: side ?? this.side,
      cornerSmoothing: cornerSmoothing ?? this.cornerSmoothing,
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final Radius radius = SmoothRadius(cornerRadius: rect.shortestSide / 2.0, cornerSmoothing: cornerSmoothing);
    final RRect borderRect = RRect.fromRectAndRadius(rect, radius);
    final RRect adjustedRect = borderRect.deflate(side.strokeInset);
    return Path()..addRRect(adjustedRect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Radius radius = SmoothRadius(cornerRadius: rect.shortestSide / 2.0, cornerSmoothing: cornerSmoothing);
    return Path()..addRRect(RRect.fromRectAndRadius(rect, radius));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        final Radius radius = SmoothRadius(cornerRadius: rect.shortestSide / 2.0, cornerSmoothing: cornerSmoothing);
        final RRect borderRect = RRect.fromRectAndRadius(rect, radius);
        canvas.drawRRect(borderRect.inflate(side.strokeOffset / 2), side.toPaint());
    }
  }

  @override
  ShapeBorder scale(double t) {
    return XStadiumBorder(
      side: side.scale(t),
      cornerSmoothing: cornerSmoothing,
    );
  }
}
