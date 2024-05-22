
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/widgets.dart';

class CharmLevelUpdateMarqueeView extends StatelessWidget {
  final S_UpdateLevel_All data;

  const CharmLevelUpdateMarqueeView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
    );
    }
  }
