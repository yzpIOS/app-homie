import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';

class RoomCardView extends StatelessWidget {
  final String? image;

  const RoomCardView({super.key, required this.image});

  static const ratio = 110 / 120;

  @override
  Widget build(BuildContext context) {
    const _decor = ShapeDecoration(
      shape: AppShape.a12,
      color: AppPalette.background2,
      shadows: [
        BoxShadow(
          color: Color(0x29000000),
          blurRadius: 6,
          spreadRadius: 1,
          offset: Offset(0, 6),
        ),
      ],
    );

    return AspectRatio(
      aspectRatio: ratio,
      child: Container(
        decoration: _decor,
        clipBehavior: Clip.antiAlias,
        child: LayoutBuilder(
          builder: (_, c) {
            final w = c.maxWidth;
            final h = c.maxHeight;

            return XFrameWidget(
              width: w,
              height: h,
              child: NetImage(image, width: w, height: h, fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
