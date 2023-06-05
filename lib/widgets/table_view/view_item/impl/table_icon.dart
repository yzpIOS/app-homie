import 'package:app/widgets.dart';
import 'package:app/widgets/table_view/view_item/table_data_adapter.dart';

mixin TableIcon implements LeadingView<ItemDataAdapter> {
  @override
  Widget? $leading() {
    final asset = vm.icon;

    return asset == null
        ? null
        : Box(
            padding: const Pad(right: 2),
            child: SvgView(asset, width: 48, fit: BoxFit.scaleDown),
          );
  }
}
