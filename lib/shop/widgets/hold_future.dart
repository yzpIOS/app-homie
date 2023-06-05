import 'package:app/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef DoHold = void Function(Object taskId, Future);

class HoldRoot extends StatefulWidget {
  final Widget child;

  const HoldRoot({super.key, required this.child});

  @override
  State<HoldRoot> createState() => _HoldRootState();
}

class _HoldRootState extends State<HoldRoot> {
  _Hold? _hold;

  @override
  Widget build(BuildContext context) {
    return Provider<DoHold>.value(
      value: _builder,
      child: Provider<_Hold?>.value(
        value: _hold,
        child: widget.child,
      ),
    );
  }

  void _builder(Object taskId, Future task) {
    final _task = task;

    _task.whenComplete(() {
      if (mounted) {
        if (_hold?.future == _task) {
          setState(() => _hold = null);
        } else {
          assert(false, '数据错误 -> $_task');
        }
      }
    });

    setState(() => _hold = _Hold(taskId, _task));
  }
}

class HoldView extends StatelessWidget {
  final Widget? child;
  final Widget Function(Object? taskId, DoHold doHold, Widget? child) builder;

  const HoldView({super.key, this.child, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Consumer2<_Hold?, DoHold>(
      child: child,
      builder: (_, val, hold, child) => builder(val?.id, hold, child),
    );
  }
}

class _Hold {
  final Object id;
  final Future future;

  _Hold(this.id, this.future);
}
