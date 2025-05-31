import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/table_view/view_item/table_data_adapter.dart';

mixin TableIcon implements LeadingView<ItemDataAdapter> {
  @override
  Widget? $leading() {
    final asset = vm.icon;

    return asset == null
        ? null
        : Box(
            child: Image.asset(IMG.format(asset), width: 31, height: 31, scale: 3, fit: BoxFit.scaleDown),
            // padding: const Pad(right: 2),
            // child: SvgView(asset, width: 48, fit: BoxFit.scaleDown),
          );
  }
}
