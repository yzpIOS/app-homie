import 'package:app/event/event.dart';
import 'package:app/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin OverlayMixin<T extends StatefulWidget> on State<T> implements BusStateMixin<T> {
  final _entry = <Object, OverlayEntry>{};

  @override
  void initState() {
    super.initState();

    if (overlay.isNotEmpty) {
      final group = overlay.groupListsBy((it) => it.rootOverlay == true);

      post(
        () {
          for (final item in group.entries) {
            final overlay = Overlay.maybeOf(context, rootOverlay: item.key);

            assert(overlay != null);

            if (overlay != null) {
              for (final item in item.value) {
                final entry = OverlayEntry(builder: (_) => item);

                final uniqueKey = item.uniqueKey ?? UniqueKey();

                assert(!_entry.containsKey(uniqueKey));

                overlay.insert(_entry[uniqueKey] = entry);
              }
            }
          }

          on<CloseOverlayEvent>(
            (event) => _entry.remove(event.key)?.remove(),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _entry
      ..values.forEach((it) => it.remove())
      ..clear();

    super.dispose();
  }

  List<XOverlayWidget> get overlay;
}

class XOverlayWidget extends StatelessWidget {
  final Widget child;
  final bool? rootOverlay;
  final bool? ignorePointer;
  final bool? absorbPointer;
  final Object? uniqueKey;

  const XOverlayWidget({
    super.key,
    required this.child,
    this.rootOverlay,
    this.ignorePointer,
    this.absorbPointer,
    this.uniqueKey,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Material(
      type: MaterialType.transparency,
      elevation: 0,
      textStyle: const TextStyle(fontSize: 14, color: Colors.black),
      child: this.child,
    );

    if (ignorePointer == true) {
      child = IgnorePointer(child: child);
    } else if (absorbPointer == true) {
      child = AbsorbPointer(child: child);
    }

    if (uniqueKey != null) {
      child = Provider<CloseOverlayEvent>.value(
        value: CloseOverlayEvent(uniqueKey!),
        child: child,
      );
    }

    return child;
  }
}
