import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

abstract class ISheetWidget extends StatelessWidget {
  ISheetWidget({super.key});

  Widget? get hint => null;

  Widget? get title => null;

  Tuple2<Widget, VoidCallback?>? get leading => closeBtn;

  Tuple2<Widget, VoidCallback?>? get trailing => null;

  late final Tuple2<Widget, VoidCallback> closeBtn = Tuple2(SvgView(SVG.$('ic_close')), Get.back);
}

class XBottomSheet extends StatelessWidget {
  final ISheetWidget sheet;

  final bool needIndicator;

  XBottomSheet._({required this.sheet, this.needIndicator = true});

  static Future<T?> show<T>({required ISheetWidget child, double? maxHeight, bool needIndicator = true}) {
    const _shape = XRectangleBorder(
      borderRadius: AppBorderRadius.t10,
    );

    final constraints = BoxConstraints(
      maxHeight: maxHeight != null ? maxHeight + AppSize.safeBottom : Get.height * 0.8,
    );

    return showModalBottomSheet<T>(
      context: Get.context!,
      shape: _shape,
      backgroundColor: Colors.white,
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      constraints: constraints,
      builder: (_) => XBottomSheet._(sheet: child, needIndicator: needIndicator,),
    );
  }

  static final _indicator = Box(
    height: 32,
    alignment: Alignment.center,
    child: Container(
      width: 40,
      height: 5,
      decoration: const ShapeDecoration(color: Color(0xFFCCCCCC), shape: XStadiumBorder()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Widget child = sheet;

    final _hint = sheet.hint;

    child = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if(needIndicator)
          _indicator,
        $TitleView(),
        if (_hint != null)
          DefaultTextStyle.merge(
            style: const TextStyle(fontSize: 10, color: AppPalette.c9),
            child: _hint,
          ),
        Flexible(child: child),
      ],
    );

    return child;
  }

  Widget $TitleView() {
    Widget? btn(Tuple2<Widget, VoidCallback?> data) {
      return InkResponse(
        onTap: data.value2,
        child: DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 16, color: AppPalette.primary),
          child: IntrinsicWidth(
            child: Container(
              constraints: const BoxConstraints(minWidth: 32, maxWidth: 88, minHeight: 24, maxHeight: 24),
              margin: const Pad(horizontal: 16),
              alignment: Alignment.center,
              child: data.value1,
            ),
          ),
        ),
      );
    }

    final _leading = sheet.leading;
    final _title = sheet.title;
    final _trailing = sheet.trailing;

    return Stack(
      alignment: Alignment.center,
      children: [
        if (_leading != null)
          Align(
            alignment: Alignment.centerLeft,
            child: btn(_leading),
          ),
        if (_title != null)
          DefaultTextStyle.merge(
            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
            child: _title,
          ),
        if (_trailing != null)
          Align(
            alignment: Alignment.centerRight,
            child: btn(_trailing),
          ),
      ],
    );
  }
}
