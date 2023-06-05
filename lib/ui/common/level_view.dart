import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';

import 'package:app/ui/my/level_page.dart';

class LevelView extends StatelessWidget {
  final UID? uid;
  final String? level;
  final double height;

  const LevelView({super.key, this.level, this.uid, this.height = 17});

  @override
  Widget build(BuildContext context) {
    final _level = level;

    if (_level == '0' || _level == null || _level.isEmpty) return Spacing.blank;

    Widget child = Image.asset(
      IMG.$('level/$_level'),
      scale: 3,
      width: 34,
      height: 17,
      fit: BoxFit.fill,
    );

    child = SizedBox(
      height: height,
      child: FittedBox(fit: BoxFit.fitHeight, child: child),
    );

    if (uid != null) {
      child = OpacityButton(
        onTap: () => Get.to(() => LevelPage(uid: uid!)),
        child: child,
      );
    }

    return child;
  }
}
