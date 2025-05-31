import 'package:app/tools.dart';
import 'package:app/widgets.dart';

class MicPanelSwitcher extends StatelessWidget {
  final Duration dur;
  final bool isShow;

  const MicPanelSwitcher({super.key, required this.dur, required this.isShow});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: dur,
      child: SvgView(
        key: ValueKey(isShow),
        SVG.$('room/麦位显示_${(!isShow).intVal}'),
        color: const Color(0x80000000),
      ),
    );
  }
}
