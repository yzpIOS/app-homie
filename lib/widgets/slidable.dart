import 'package:app/exception.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

const _pane = SlidableScrollActionPane();

Widget xSlidable({
  required Key key,
  required Widget child,
  required List<SlidAction> actions,
  required VoidCallback onDismissed,
}) {
  Future Function()? onWillDismiss;

  return Slidable.builder(
    key: key,
    actionPane: _pane,
    closeOnScroll: true,
    dismissal: SlidableDismissal(
      dragDismissible: false,
      onDismissed: (_) => onDismissed(),
      onWillDismiss: (_) async {
        final fn = onWillDismiss!;
        onWillDismiss = null;

        try {
          await fn();

          return true;
        } on LogicException catch (e) {
          showToast(e.msg);
        } catch (e, s) {
          errLog(e, s);

          showToast('操作失败');
        }

        return false;
      },
      child: const SlidableDrawerDismissal(),
    ),
    secondaryActionDelegate: SlideActionBuilderDelegate(
      actionCount: actions.length,
      builder: (context, i, animation, step) {
        final item = actions[i];

        return IgnorePointer(
          ignoring: step != SlidableRenderingMode.slide,
          child: SlideAction(
            color: item.bgColor,
            closeOnTap: false,
            onTap: () {
              onWillDismiss = item.onWillDismiss;

              Slidable.of(context)!.dismiss();
            },
            child: XText(
              item.label,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        );
      },
    ),
    child: child,
  );
}

class SlidAction {
  final String label;
  final Color bgColor;
  final Future Function() onWillDismiss;

  SlidAction({required this.label, required this.bgColor, required this.onWillDismiss});
}
