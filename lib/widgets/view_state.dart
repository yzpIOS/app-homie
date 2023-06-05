import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/image/blur_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

abstract class ViewState<T> {
  static final _imageLoading = () {
    final svg = SVG.$('default');

    SvgView.preload(svg);

    return ClipPath(
      key: const Key('DEFAULT_IMAGE_LOADING'),
      clipBehavior: Clip.hardEdge,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFFF8F7FC)),
        child: SvgView(svg, fit: BoxFit.cover),
      ),
    );
  }();

  static const _dataLoading = Center(
    child: RepaintBoundary(
      child: SpinKitPulse(color: AppPalette.primary, size: 44),
    ),
  );

  static const _moreDataLoading = Box(
    height: 24,
    alignment: Alignment.center,
    child: RepaintBoundary(
      child: SpinKitPulse(color: AppPalette.primary, size: 24),
    ),
  );

  static Widget _emptyView([VoidCallback? arg]) => TipsView(doRefresh: arg);

  static Widget _noMoreView([_]) {
    return const Box(
      height: 32,
      alignment: Alignment.center,
      child: XText(
        '---- 没有更多了 ----',
        style: TextStyle(fontSize: 14, color: AppPalette.tips),
      ),
    );
  }

  static Widget _errorView([VoidCallback? doRefresh, dynamic e]) {
    return Center(
      child: OpacityButton(
        onTap: doRefresh,
        child: XText(
          Env.isRelease ? 'Error' : '$e',
          style: const TextStyle(color: Colors.black54),
        ),
      ),
    );
  }

  static final providers = [
    Provider<ImgErr>.value(value: ImgErr(_imageLoading)),
    Provider<ImgLoading>.value(value: ImgLoading._(([_]) => _imageLoading)),
    Provider<DataEmpty>.value(value: DataEmpty._(_emptyView)),
    Provider<DataError>.value(value: DataError._(_errorView)),
    Provider<DataNoMore>.value(value: DataNoMore._(_noMoreView)),
    Provider<DataLoading>.value(value: DataLoading._(_dataLoading)),
    Provider<MoreDataLoading>.value(value: MoreDataLoading._(_moreDataLoading)),
  ];

  ViewState._();

  Widget build([T? arg]);
}

abstract class _StateWidget extends StatelessWidget {
  final Widget child;

  const _StateWidget(this.child);

  @override
  Widget build(BuildContext context) {
    return //
        providers.isNotEmpty //
            ? MultiProvider(providers: providers, child: child)
            : child;
  }

  List<Provider> get providers;
}

class ImgLoading<T extends Tuple2<String?, double?>> extends ViewState<T> {
  final Widget Function([T? arg]) builder;

  ImgLoading._(this.builder) : super._();

  @override
  Widget build([T? arg]) => BlurImage(blurHash: arg?.value1, child: builder(arg));
}

class ImgErr<T extends Tuple3<String?, Object, StackTrace?>> extends ViewState<T> {
  final Widget errView;

  ImgErr(this.errView) : super._();

  @override
  Widget build([T? arg]) => BlurImage(blurHash: arg?.value1, child: errView);
}

typedef BuildEmptyView = Widget Function([VoidCallback? arg]);
typedef BuildErrorView = Widget Function([VoidCallback? arg, dynamic e]);
typedef BuildNoMoreView = Widget Function([VoidCallback? arg]);

class DataEmpty extends ViewState<VoidCallback?> {
  final BuildEmptyView buildEmptyView;

  DataEmpty._(this.buildEmptyView) : super._();

  factory DataEmpty.build(BuildEmptyView builder) => DataEmpty._(builder);

  @override
  Widget build([VoidCallback? arg]) => buildEmptyView(arg);
}

class DataError extends ViewState<Tuple2<VoidCallback?, dynamic>?> {
  final BuildErrorView buildErrView;

  DataError._(this.buildErrView) : super._();

  @override
  Widget build([Tuple2<VoidCallback?, dynamic>? arg]) => buildErrView(arg?.value1, arg?.value2);
}

class DataNoMore extends ViewState<VoidCallback?> {
  final BuildNoMoreView buildNoMoreView;

  DataNoMore._(this.buildNoMoreView) : super._();

  @override
  Widget build([VoidCallback? arg]) => buildNoMoreView(arg);
}

class DataLoading extends ViewState {
  final Widget loading;

  DataLoading._(this.loading) : super._();

  @override
  Widget build([arg]) => loading;
}

class MoreDataLoading extends ViewState {
  final Widget loading;

  MoreDataLoading._(this.loading) : super._();

  @override
  Widget build([arg]) => loading;
}

class ConfigImgState extends _StateWidget {
  final Widget? errView;
  final Widget Function(Tuple2<String?, double?>? arg)? loading;

  const ConfigImgState({required Widget child, this.errView, this.loading}) : super(child);

  @override
  List<Provider> get providers {
    final errView = this.errView;
    final loading = this.loading;

    return [
      if (errView != null) //
        Provider<ImgErr>.value(value: ImgErr(errView)),
      if (loading != null) //
        Provider<ImgLoading>.value(value: ImgLoading._(([it]) => loading(it)))
    ];
  }
}

class ConfigListState extends _StateWidget {
  final Widget? loading;
  final BuildEmptyView? buildEmptyView;
  final BuildErrorView? buildErrorView;
  final BuildNoMoreView? buildNoMoreView;

  const ConfigListState(
      {required Widget child, this.loading, this.buildEmptyView, this.buildErrorView, this.buildNoMoreView})
      : super(child);

  @override
  List<Provider> get providers {
    final buildEmptyView = this.buildEmptyView;
    final buildErrorView = this.buildErrorView;
    final buildNoMoreView = this.buildNoMoreView;
    final loading = this.loading;

    return [
      if (buildEmptyView != null) //
        Provider<DataEmpty>.value(value: DataEmpty._(buildEmptyView)),
      if (buildErrorView != null) //
        Provider<DataError>.value(value: DataError._(buildErrorView)),
      if (buildNoMoreView != null) //
        Provider<DataNoMore>.value(value: DataNoMore._(buildNoMoreView)),
      if (loading != null) //
        Provider<DataLoading>.value(value: DataLoading._(loading)),
    ];
  }
}

class BlankListState extends ConfigListState {
  BlankListState({required super.child})
      : super(
          loading: Spacing.blank,
          buildEmptyView: ([_]) => Spacing.blank,
          buildErrorView: ([_, __]) => Spacing.blank,
        );
}

class BlankImgState extends ConfigImgState {
  static const _loading = Spacing.blank;
  static const _errView = Env.isRelease ? Spacing.blank : Icon(Icons.bug_report, color: Colors.red);

  BlankImgState({required super.child}) : super(loading: (_) => _loading, errView: _errView);
}

class GiftImgState extends ConfigImgState {
  static const _loading = Spacing.blank;
  static const _errView = Env.isRelease ? Spacing.blank : Icon(Icons.bug_report, color: Colors.red);

  GiftImgState({required super.child}) : super(loading: (_) => _loading, errView: _errView);
}

extension ViewStateContext on BuildContext {
  Widget state<T extends ViewState>([arg]) => read<T>().build(arg);

  Widget dataErrorState([VoidCallback? callback, e]) => state<DataError>(Tuple2(callback, e));
}
