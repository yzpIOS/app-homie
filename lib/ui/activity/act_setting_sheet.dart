import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

class ActSettingSheet extends ISheetWidget {
  @override
  late final Widget title = const Text('设置');
  @override
  late final Tuple2<Widget, VoidCallback>? leading = null;
  @override
  late final Tuple2<Widget, VoidCallback>? trailing = closeBtn;

  ActSettingSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Widget child = GetBuilder<MyInfoCtrl>(
      builder: (ctrl) {
        final items = [
          Obx(
            () => TableItem$Switch(
              title: '不对外提供中奖信息',
              isChecked: ctrl.dataRx().showWinningLottery == true,
              onChanged: ctrl.updateLotteryWinning,
            ),
          ),
          // TableItem$Switch(title: '自动购买尾灯', isChecked: b2, onChanged: b2),
        ];

        return TableView([TableGroup(items)]);
      },
    );

    return Padding(
      padding: const Pad(top: 16),
      child: child,
    );
  }
}
