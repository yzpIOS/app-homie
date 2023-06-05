import 'package:app/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

typedef OnData<T> = Widget Function(T data);

class XFutureBuilder<T> extends StatelessWidget {
  final T? initialData;
  final Future future;
  final OnData<T> onData;
  final bool Function(dynamic) emptyAssert;

  const XFutureBuilder(
    this.future, {
    super.key,
    this.initialData,
    required this.onData,
    this.emptyAssert = _emptyAssert,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      initialData: initialData,
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;

          return emptyAssert(data) ? context.state<DataEmpty>() : onData(data);
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return context.state<DataLoading>();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return context.dataErrorState(null, snapshot.error);
              } else {
                final data = snapshot.data;

                return emptyAssert(data) ? context.state<DataEmpty>() : onData(data);
              }
            default:
              throw '';
          }
        }
      },
    );
  }

  static bool _emptyAssert(data) => data is Iterable && data.isEmpty;
}

class NotifierView<T> extends StatelessWidget {
  final ValueListenable<T> notifier;
  final OnData<T> onData;

  const NotifierView(this.notifier, {super.key, required this.onData});

  @override
  Widget build(BuildContext context) {
    return ValueListenableProvider.value(
      value: notifier,
      child: Consumer<T>(builder: (_, T v, __) => onData(v)),
    );
  }
}
