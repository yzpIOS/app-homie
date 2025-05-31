import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/table_view/view_item/table_item.dart';

import 'package:app/widgets/table_view/view_item/table_data_adapter.dart';

mixin TableTips implements ITipsView<ItemDataAdapter> {
  @override
  Widget? $tips() {
    final tips = vm.tips;

    if (tips == null) return null;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: Get.width / 2),
      child: XText(
        tips,
        style: const TextStyle(fontSize: 14, color: Color(0xFF979797), fontWeight: fw$Medium),
      ),
    );
  }
}
