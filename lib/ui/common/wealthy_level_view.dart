import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';

import 'package:app/ui/my/wealth_level_page.dart';

import '../my/charm_level_page.dart';

/// 财富等级
class WealthyLevelView extends StatelessWidget {
  final UID? uid;
  final String? level;
  final double height;
  final String? charmLevel;
  final int? num;

  const WealthyLevelView({super.key, this.level, this.uid, this.height = 17, this.charmLevel,this.num});

  @override
  Widget build(BuildContext context) {
    final _level = level;
    final _charmLevel = charmLevel;

    Widget child;
    if(num == 1){
      // if (_charmLevel == null || _charmLevel.isEmpty) return Spacing.blank;CharmLevelPage
      child = Image.asset(
        IMG.format('level/charm/$_charmLevel'),
        scale: 3,
        // width: 72.3,
        // height: 29,
        // fit: BoxFit.fill,
      );

      child = SizedBox(
        height: height,
        width: height / 84 * 184,
        child: FittedBox(fit: BoxFit.fitHeight, child: child),
      );

      if (uid != null) {
        child = OpacityButton(
          onTap: () => Get.to(() => CharmLevelPage(uid: uid!)),
          child: child,
        );
      }

    }else{
      if (_level == null || _level.isEmpty) return Spacing.blank;
      child = Image.asset(
        IMG.format('level/$_level'),
        scale: 3,
        // width: 72.3,
        // height: 29,
        // fit: BoxFit.fill,
      );

      child = SizedBox(
        height: height,
        width: height / 84 * 184,
        child: FittedBox(fit: BoxFit.fitHeight, child: child),
      );

      if (uid != null) {
        child = OpacityButton(
          onTap: () => Get.to(() => WealthLevelPage(uid: uid!)),
          child: child,
        );
      }
    }




    return child;
  }
}
