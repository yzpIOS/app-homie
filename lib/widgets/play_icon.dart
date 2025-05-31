import 'package:app/tools.dart';
import 'package:app/widgets.dart';

class PlayIcon extends StatelessWidget {
  final double size;

  const PlayIcon({super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return SvgView(SVG.$('ic_play'), width: size, height: size);
  }
}
