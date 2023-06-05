import 'package:app/tools.dart';
import 'package:app/widgets/list/list_config.dart';
import 'package:app/widgets/list/list_ctrl.dart';
import 'package:app/widgets/list/list_view.dart';
import 'package:app/widgets/view_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef DataTr<T> = Iterable<T> Function(dynamic);

class SimplePageListCtrl<T> extends PageListCtrl<T> {
  final bool isSinglePage;
  final Future Function(PageNum) api;
  final DataTr<T>? _transform;

  // ignore: library_private_types_in_public_api
  SimplePageListCtrl(this.api, {DataTr<T>? transform, this.isSinglePage = false}) : _transform = transform;

  @override
  Future fetchPage(PageNum page) => api(page);

  @override
  void appendPage(List<T> items, PageNum? next) {
    if (isSinglePage) {
      paging.appendLastPage(items);
    } else {
      super.appendPage(items, next);
    }
  }

  @override
  Iterable<T> transform(data) => (_transform ?? super.transform)(data);
}

mixin _SimpleMixin<T> {
  final BaseConfig? config = null;

  Widget itemBuilder(BuildContext context, T item, int index);

  Widget _rxDataView<CTRL extends GetxController>({CTRL? init, required GetControllerBuilder<CTRL> builder}) {
    return ConfigList(
      config: config,
      child: GetBuilder<CTRL>(
        global: false,
        init: init,
        builder: builder,
        //TODO dispose: (it) => it.controller?.onDelete(),
      ),
    );
  }
}

mixin _DataView<T> implements _SimpleMixin<T> {
  bool get isSinglePage => false;

  DataTr<T>? get transform => null;

  late final controller = SimplePageListCtrl<T>(
    fetchPage,
    transform: transform,
    isSinglePage: isSinglePage,
  );

  Future fetchPage(PageNum page);

  Widget _$DataView() {
    return _rxDataView<SimplePageListCtrl<T>>(
      init: controller,
      builder: (it) {
        return $RefreshBuild(
          child: DataView$Page(ctrl: it, itemBuilder: itemBuilder),
        );
      },
    );
  }

  Widget $RefreshBuild({required Widget child}) {
    return Consumer<BaseConfig>(
      builder: (_, val, __) => val.$RefreshBuild(child, controller.doRefresh),
    );
  }

  void doRefresh() => controller.doRefresh();
}

abstract class SimplePageView<T> extends StatelessWidget with _DataView<T>, _SimpleMixin<T> {
  SimplePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return _$DataView();
  }
}

abstract class SimpleDataView<T> extends SimplePageView<T> {
  SimpleDataView({super.key});

  @override
  final bool isSinglePage = true;

  @override
  Future fetchPage(PageNum page) => fetch();

  Future fetch();
}

abstract class SimplePageState<T, W extends StatefulWidget> extends State<W> with _DataView<T>, _SimpleMixin<T> {
  @override
  Widget build(BuildContext context) {
    return _$DataView();
  }
}

abstract class SimpleDataState<T, W extends StatefulWidget> extends State<W> with _DataView<T>, _SimpleMixin<T> {
  @override
  final bool isSinglePage = true;

  @override
  Future fetchPage(PageNum page) => fetch();

  Future fetch();

  @override
  Widget build(BuildContext context) {
    return _$DataView();
  }
}

class SimpleListView<T> extends StatelessWidget {
  final List<T>? data;
  final Widget? divider;
  final double? itemExtent;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final VoidCallback? doRefresh;

  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  const SimpleListView(
    this.data, {
    super.key,
    required this.itemBuilder,
    this.padding,
    this.divider,
    this.itemExtent,
    this.shrinkWrap = false,
    this.physics,
    this.doRefresh,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    final _data = data;

    if (_data == null) {
      return context.state<DataLoading>();
    } else if (_data.isEmpty) {
      return context.state<DataEmpty>(doRefresh);
    } else {
      final _divider = divider;

      if (_divider == null) {
        return ListView.builder(
          scrollDirection: scrollDirection,
          shrinkWrap: shrinkWrap,
          padding: padding,
          physics: physics,
          itemExtent: itemExtent,
          itemCount: _data.length,
          itemBuilder: (ctx, i) => itemBuilder(ctx, _data[i], i),
        );
      } else {
        return ListView.separated(
          scrollDirection: scrollDirection,
          shrinkWrap: shrinkWrap,
          padding: padding,
          physics: physics,
          itemCount: _data.length,
          itemBuilder: (ctx, i) => itemBuilder(ctx, _data[i], i),
          separatorBuilder: (_, __) => _divider,
        );
      }
    }
  }
}

class SimpleRxListView<T> extends StatelessWidget {
  final RxObjectMixin data;
  final Widget? divider;
  final double? itemExtent;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;
  final VoidCallback? doRefresh;

  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  const SimpleRxListView(
    this.data, {
    super.key,
    required this.itemBuilder,
    this.padding,
    this.divider,
    this.itemExtent,
    this.physics,
    this.doRefresh,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final _data = data is RxList<T> || data is Rxn<List<T>> || data is Rx<List<T>> ? data() : null;

      return SimpleListView(
        _data,
        scrollDirection: scrollDirection,
        padding: padding,
        physics: physics,
        divider: divider,
        itemExtent: itemExtent,
        itemBuilder: itemBuilder,
        doRefresh: doRefresh,
      );
    });
  }
}
