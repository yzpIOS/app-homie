import 'package:app/tools.dart';
import 'package:app/widgets.dart';

class RightArrowIcon extends StatelessWidget {
  final Color? color;

  const RightArrowIcon({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgView(SVG.$('arrow'), color: color, fit: BoxFit.none);
  }
}
