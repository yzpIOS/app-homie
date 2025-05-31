import 'package:app/common/theme.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

class NickView extends StatelessWidget {
  final String? nickName;
  final GenderEnum? gender;

  const NickView({super.key, this.nickName, this.gender});

  @override
  Widget build(BuildContext context) {
    Widget nickView = XText(
      nickName ?? '',
      style: const TextStyle(fontSize: 16, fontWeight: fw$SemiBold),
    );

    final gender = this.gender;

    if (gender != null) {
      nickView = Row(
        children: [
          Flexible(child: nickView),
          Spacing.w2,
          SvgView(SVG.$('common/性别_${gender.code}'), width: 20, height: 20),
        ],
      );
    }

    return nickView;
  }
}
