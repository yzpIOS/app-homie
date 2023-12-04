import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';

import 'package:app/ui/my/wealth_level_page.dart';

class WealthyLevelView extends StatelessWidget {
  final UID? uid;
  final String? level;
  final double height;
  final double width;
  final double scale;

  const WealthyLevelView({super.key, this.level, this.uid, this.height = 17, this.width = 34, this.scale = 3});

  @override
  Widget build(BuildContext context) {
    final _level = level;

    if (_level == '0' || _level == null || _level.isEmpty) return Spacing.blank;

    Widget child = Image.asset(
      IMG.format('level/$_level'),
      scale: scale,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );

    child = SizedBox(
      height: height,
      child: FittedBox(fit: BoxFit.fitHeight, child: child),
    );

    if (uid != null) {
      child = OpacityButton(
        onTap: () => Get.to(() => WealthLevelPage(uid: uid!)),
        child: child,
      );
    }

    return child;
  }
}
