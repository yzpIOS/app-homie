import 'package:app/store/common/size_provider.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

class MomentSingleAttachView extends StatelessWidget {
  final Widget child;
  final SizeProvider size;

  const MomentSingleAttachView({super.key, required this.size, required this.child});

  static final _aspect = //
      const [Tuple2(16, 9), Tuple2(4, 5), Tuple2(5, 7), Tuple2(3, 4), Tuple2(3, 5), Tuple2(2, 3)]
          .expand((it) => [it.value1 / it.value2, it.value2 / it.value1])
          .toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _bestAspectRatio(size.sizeOrNull()),
      child: XFrameWidget(
        child: child,
      ),
    );
  }

  static double _bestAspectRatio(Size? size) {
    if (size == null || size.width == size.height) return 1;

    double minRatio = double.maxFinite;
    double outRatio = 1;

    for (final it in _aspect) {
      final val = (it - size.aspectRatio).abs();

      if (minRatio > val) {
        outRatio = it;
        minRatio = val;
      }
    }

    return outRatio;
  }
}
