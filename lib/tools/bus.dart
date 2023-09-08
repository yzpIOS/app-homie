import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/tools.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/widgets.dart';

typedef OnData<T> = void Function(T event);

class CmdEvent<T> {
  final String action;
  final T data;

  CmdEvent(this.action, this.data);

  @override
  String toString() => 'CmdEvent{action: $action, data: $data}';
}

final _bus = EventBus();

class Bus {
  Bus._();

  static StreamSubscription<T> sub<T>(String event, OnData<T> f, {bool Function(T event)? test}) {
    var stream = _bus //
        .on<CmdEvent<T>>()
        .where((it) => it.action == event)
        .map((it) => it.data);

    if (test != null) {
      stream = stream.where(test);
    }

    return stream.listen(f);
  }

  static void send<T>(String event, T data) => fire(CmdEvent<T>(event, data));

  static void cmd(String event) => send(event, null);

  static StreamSubscription<T> on<T>(OnData<T> onData, {bool Function(T event)? test}) {
    var stream = _bus.on<T>();

    if (test != null) {
      stream = stream.where(test);
    }

    return stream.listen(onData);
  }

  static void fire(event) {
    xlog(() => 'FIRE => $event', type: LogType.BUS);

    _bus.fire(event);
  }
}

mixin BusStateMixin<T extends StatefulWidget> on State<T> {
  final _listeners = <StreamSubscription>[];

  void bus<Type>(String event, OnData<Type> call, {bool Function(Type event)? test}) {
    _listeners.add(Bus.sub<Type>(event, call, test: test));
  }

  void sub<Type>(String event, OnData<Type> call, {bool Function(Type event)? test}) {
    _listeners.add(Bus.sub<Type>(event, call, test: test));
  }

  void on<Type>(OnData<Type> call, {bool Function(Type event)? test}) {
    _listeners.add(Bus.on<Type>(call, test: test));
  }

  void cancelAll() {
    _listeners
      ..forEach((it) => it.cancel())
      ..clear();
  }

  @override
  void dispose() {
    cancelAll();

    super.dispose();
  }
}

mixin BusGetLifeMixin on GetLifeCycleBase {
  final _listeners = <StreamSubscription>[];

  void bus<T>(String event, OnData<T> call, {bool Function(T event)? test}) {
    _listeners.add(Bus.sub<T>(event, call, test: test));
  }

  void on<T>(OnData<T> call, {bool Function(T event)? test}) {
    _listeners.add(Bus.on<T>(call, test: test));
  }

  void cancelAll() {
    _listeners
      ..forEach((it) => it.cancel())
      ..clear();
  }

  @override
  @mustCallSuper
  void onClose() {
    cancelAll();

    super.onClose();
  }
}

class BusView<T> extends StatefulWidget {
  final Widget child;
  final bool Function(T event)? test;
  final void Function(BuildContext context, T event) onData;

  const BusView({super.key, required this.child, required this.onData, this.test});

  @override
  State<BusView<T>> createState() => _BusViewState();
}

class _BusViewState<T> extends State<BusView<T>> with BusStateMixin {
  @override
  void initState() {
    super.initState();

    on<T>(
      test: widget.test,
      (event) => widget.onData(context, event),
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
