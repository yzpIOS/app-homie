import 'package:app/ui/moment/view_item/content.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/widgets.dart';

mixin MomentTxt implements ITxtView<MomentDtoAdapter> {
  @override
  final maxLines = null;
  @override
  final textStyle = null;

  @override
  InlineSpan $txt() {
    return TextSpan(text: vm.content.text, style: textStyle);
  }
}
