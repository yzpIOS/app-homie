import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';

import 'package:app/ui/my/wealth_level_page.dart';

/// 财富等级
class WealthyLevelView extends StatelessWidget {
  final UID? uid;
  final String? level;
  final double height;

  const WealthyLevelView({super.key, this.level, this.uid, this.height = 17});

  @override
  Widget build(BuildContext context) {
    final _level = level;

    if (_level == '0' || _level == null || _level.isEmpty) return Spacing.blank;

    Widget child = Image.asset(
      IMG.format('level/$_level'),
      scale: 3,
      width: 72.3,
      height: 29,
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
