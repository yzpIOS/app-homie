import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/tools/special_text.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/blur_view.dart';
import 'package:flutter/material.dart';

class EmojiView extends StatelessWidget {
  final ValueChanged<String> onSelect;
  final VoidCallback? doSend;
  final VoidCallback? doBackspace;

  const EmojiView({super.key, required this.onSelect, this.doSend, this.doBackspace});

  @override
  Widget build(BuildContext context) {
    Widget child = $EmojiView();

    if (doSend != null || doBackspace != null) {
      child = Stack(
        children: [
          Positioned.fill(child: child),
          Positioned(right: 0, bottom: AppSize.safeBottom, child: $ActionView()),
        ],
      );
    }

    return child;
  }

  Widget itemBuilder(MapEntry data) {
    void onTap() {
      onSelect(data.key);
    }

    return InkResponse(
      onTap: onTap,
      child: Center(
        child: Image.asset(data.value, width: 32, height: 32, scale: 4),
      ),
    );
  }

  Widget $EmojiView() {
    const delegate = SliverGridDelegateWithMaxCrossAxisExtent(
      childAspectRatio: 1,
      maxCrossAxisExtent: 48,
    );

    return XFutureBuilder<Tuple2>(
      emojis,
      onData: (data) {
        final List items = data.value1;

        return XSnapshotWidget(
          child: GridView.builder(
            padding: const Pad(horizontal: 16, bottom: 48),
            gridDelegate: delegate,
            itemCount: items.length,
            itemBuilder: (_, i) => itemBuilder(items[i]),
          ),
        );
      },
    );
  }

  Widget $ActionView() {
    return BlurView(
      color: Colors.white54,
      borderRadius: const BorderRadius.only(topLeft: AppRadius.r8, bottomLeft: AppRadius.r4),
      child: Padding(
        padding: const Pad(horizontal: 8),
        child: Row(
          children: <Widget>[
            if (doBackspace != null) //
              $Icon(Icons.backspace_outlined, doBackspace),
            if (doSend != null) //
              $Icon(Icons.send_rounded, doSend),
          ].separator(Spacing.w4).toList(growable: false),
        ),
      ),
    );
  }

  IconButton $Icon(IconData icon, VoidCallback? onTap) {
    return IconButton(color: Colors.black, icon: Icon(icon), onPressed: onTap);
  }
}
