import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

class TipsView extends StatelessWidget {
  final String tips;
  final VoidCallback? doRefresh;

  const TipsView({super.key, this.doRefresh, this.tips = '啊咧？怎么找不到呢~'});

  @override
  Widget build(BuildContext context) {
    Widget child = $TipsView();

    child = FittedBox(
      fit: BoxFit.fitWidth,
      child: child,
    );

    if (doRefresh != null) {
      child = OpacityButton(onTap: doRefresh, child: child);
    }

    return Center(
      child: child,
    );
  }

  Widget $TipsView() {
    return SizedBox(
      width: 375,
      height: 375,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IMG.$('state/$tips'), width: 174, cacheWidth: 174.toPx(), scale: 3),
          Spacing.h10,
          XText(
            tips,
            style: const TextStyle(fontSize: 14, color: AppPalette.c6),
          ),
        ],
      ),
    );
  }
}
