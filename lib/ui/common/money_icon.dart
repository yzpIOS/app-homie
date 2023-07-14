import 'package:app/model/enum/money_type.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

export 'package:app/model/enum/money_type.dart';

class MoneyIcon extends StatelessWidget {
  final double size;
  final int? variant;
  final MoneyType type;

  const MoneyIcon({super.key, this.type = MoneyType.gold, this.size = 32, this.variant});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      IMG.format('money_${type.name}${variant == null ? '' : '_$variant'}'),
      width: size,
      height: size,
      scale: 3,
      fit: BoxFit.contain,
    );
  }
}
