import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef ItemBuilder = Function(BuildContext context, ScrollController, int index);

class XPageView extends StatefulWidget {
  final PageController? controller;

  final int itemCount;
  final ItemBuilder itemBuilder;

  const XPageView({super.key, required this.itemCount, required this.itemBuilder, this.controller});

  @override
  State<XPageView> createState() => _XPageViewState();
}

class _XPageViewState extends State<XPageView> {
  late final itemCount = widget.itemCount;
  late final itemBuilder = widget.itemBuilder;

  late final _pageCtrl = widget.controller ?? PageController();
  late final _listCtrl = List.generate(itemCount, (_) => ScrollController());

  late final gestures = <Type, GestureRecognizerFactory>{
    VerticalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
      () => VerticalDragGestureRecognizer(),
      (it) {
        it
          ..onStart = _handleDragStart
          ..onUpdate = _handleDragUpdate
          ..onEnd = _handleDragEnd
          ..onCancel = _handleDragCancel;
      },
    )
  };

  Drag? _drag;
  late ScrollController _activeCtrl = _pageCtrl;

  late MediaQueryData mqData;
  late ScrollBehavior scrollBehavior;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    mqData = MediaQuery.of(context);
    scrollBehavior = ScrollConfiguration.of(context);
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    _listCtrl.forEach((it) => it.dispose());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageCtrl,
      scrollDirection: Axis.vertical,
      itemCount: itemCount,
      itemBuilder: _itemBuilder,
      findChildIndexCallback: _findChildIndex,
    );

    child = MediaQuery(
      data: mqData.copyWith(gestureSettings: const DeviceGestureSettings(touchSlop: 50)),
      child: child,
    );

    child = ScrollConfiguration(
      behavior: scrollBehavior.copyWith(overscroll: false),
      child: child,
    );

    child = RawGestureDetector(
      gestures: gestures,
      behavior: HitTestBehavior.opaque,
      child: child,
    );

    return child;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return KeyedSubtree(
      key: ValueKey(index),
      child: MediaQuery(
        data: mqData,
        child: itemBuilder(context, _listCtrl[index], index),
      ),
    );
  }

  int? _findChildIndex(Key key) {
    return key is ValueKey<int> ? key.value : null;
  }

  void _usePageCtrl(DragUpdateDetails details) {
    _activeCtrl = _pageCtrl;
    _drag?.cancel();

    _drag = _pageCtrl.position.drag(
      DragStartDetails(globalPosition: details.globalPosition, localPosition: details.localPosition),
      _disposeDrag,
    );
  }

  //<editor-fold desc="手势">
  void _handleDragStart(DragStartDetails details) {
    for (final item in _listCtrl) {
      if (item.hasClients == true) {
        final box = item.position.context.storageContext.findRenderObject() as RenderBox;

        if (box.paintBounds.shift(box.localToGlobal(Offset.zero)).contains(details.globalPosition)) {
          _drag = (_activeCtrl = item).position.drag(details, _disposeDrag);

          return;
        }
      }
    }

    _activeCtrl = _pageCtrl;
    _drag = _pageCtrl.position.drag(details, _disposeDrag);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_activeCtrl != _pageCtrl) {
      final pos = _activeCtrl.position;
      final px = pos.pixels;

      if (details.primaryDelta! > 0) {
        if (px == 0) _usePageCtrl(details);
      } else {
        if (px == pos.maxScrollExtent) _usePageCtrl(details);
      }
    }

    _drag?.update(details);
  }

  void _handleDragEnd(DragEndDetails details) => _drag?.end(details);

  void _handleDragCancel() => _drag?.cancel();

  void _disposeDrag() => _drag = null;
//</editor-fold>
}
