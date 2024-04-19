import 'package:app/tools/help.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

abstract class BaseConfig with IRefresh {
  final EdgeInsets? padding;

  bool needNorMore = true;

  BaseConfig({this.padding, this.needNorMore = true});

  Widget createBy(PagingController paging, PagedChildBuilderDelegate builder);

  // ignore: unnecessary_cast
  static final defaultProvider = Provider<BaseConfig>.value(value: ListConfig());
}

mixin SliverMixin {
  bool get isSliver => true;
}

mixin ISliverList implements SliverMixin {
  abstract final Widget? divider;
  abstract final double? itemExtent;
}

mixin IScroll {
  abstract final bool? shrinkWrap;
  abstract final ScrollPhysics? physics;
  abstract final ScrollController? scroll;
  abstract final Axis scrollDirection;
}

mixin IRefresh {
  Widget $RefreshBuild(Widget child, Future<void> Function() doRefresh) => child;
}

mixin RefreshMixin on IRefresh, IScroll {
  @override
  Widget $RefreshBuild(Widget child, Future<void> Function() doRefresh) {
    switch (scrollDirection) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        return RefreshIndicator(onRefresh: doRefresh, child: child);
    }
  }
}

class SliverListConfig extends BaseConfig with ISliverList, SliverMixin {
  @override
  final Widget? divider;
  @override
  final double? itemExtent;

  SliverListConfig({
    this.itemExtent,
    this.divider,
    super.padding,
    super.needNorMore = true,
  });

  @override
  Widget createBy(PagingController paging, PagedChildBuilderDelegate builder) {
    final _divider = divider;

    Widget sliver;

    if (_divider == null) {
      sliver = PagedSliverList(
        pagingController: paging,
        builderDelegate: builder,
        itemExtent: itemExtent,
      );
    } else {
      sliver = PagedSliverList.separated(
        pagingController: paging,
        builderDelegate: builder,
        separatorBuilder: (_, __) => _divider,
      );
    }

    return _$Padding(sliver, paging, padding);
  }
}

class ListConfig extends SliverListConfig with IScroll, RefreshMixin {
  @override
  final ScrollPhysics? physics;
  @override
  final ScrollController? scroll;
  @override
  final bool? shrinkWrap;
  @override
  final Axis scrollDirection;

  @override
  final isSliver = false;

  ListConfig({
    this.physics,
    this.scroll,
    this.shrinkWrap,
    this.scrollDirection = Axis.vertical,
    super.divider,
    super.itemExtent,
    super.padding,
    super.needNorMore = true,
  });

  @override
  Widget createBy(PagingController paging, PagedChildBuilderDelegate builder) {
    final sliver = super.createBy(paging, builder);

    return CustomScrollView(
      controller: scroll,
      physics: physics,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap ?? false,
      slivers: [sliver],
    );
  }
}

class SliverGridConfig extends BaseConfig with SliverMixin {
  final SliverGridDelegate gridDelegate;

  SliverGridConfig({
    required this.gridDelegate,
    super.padding,
  });

  @override
  Widget createBy(PagingController paging, PagedChildBuilderDelegate builder) {
    final sliver = PagedSliverGrid(
      pagingController: paging,
      gridDelegate: gridDelegate,
      builderDelegate: builder,
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
    );

    return _$Padding(sliver, paging, padding);
  }
}

class GridConfig extends BaseConfig with IScroll, RefreshMixin {
  @override
  final ScrollPhysics? physics;
  @override
  final ScrollController? scroll;
  @override
  final bool? shrinkWrap;
  @override
  final Axis scrollDirection;

  final SliverGridDelegate gridDelegate;

  GridConfig({
    required this.gridDelegate,
    this.physics,
    this.scroll,
    this.shrinkWrap,
    this.scrollDirection = Axis.vertical,
    super.padding,
  });

  @override
  Widget createBy(PagingController paging, PagedChildBuilderDelegate builder) {
    return PagedGridView(
      pagingController: paging,
      scrollController: scroll,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap ?? false,
      physics: physics,
      padding: padding,
      gridDelegate: gridDelegate,
      builderDelegate: builder,
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
    );
  }
}

// class StaggeredConfig extends BaseConfig with ScrollMixin {
//   @override
//   final ScrollPhysics? physics;
//   @override
//   final ScrollController? scroll;
//   @override
//   final bool? shrinkWrap;
//
//   final SliverStaggeredGridDelegateBuilder delegateBuilder;
//
//   StaggeredConfig({
//     required this.delegateBuilder,
//     this.physics,
//     this.scroll,
//     this.shrinkWrap,
//     EdgeInsets? padding,
//   }) : super(padding: padding);
//
//   @override
//   Widget createBy(PagingController paging, PagedChildBuilderDelegate builder) {
//     return PagedStaggeredGridView(
//       scrollController: scroll,
//       shrinkWrap: shrinkWrap ?? false,
//       physics: physics,
//       padding: padding,
//       builderDelegate: builder,
//       pagingController: paging,
//       gridDelegateBuilder: delegateBuilder,
//     );
//   }
// }

class GroupedListConfig<T> extends BaseConfig with IScroll, ISliverList, RefreshMixin {
  @override
  final Widget? divider;
  @override
  final double? itemExtent;

  @override
  final ScrollPhysics? physics;
  @override
  final ScrollController? scroll;
  @override
  final bool? shrinkWrap;
  @override
  final Axis scrollDirection;

  @override
  final isSliver = false;

  final String Function(T) groupBy;
  final Widget Function(int, String) groupBuilder;

  GroupedListConfig({
    required this.groupBy,
    this.itemExtent,
    this.divider,
    this.groupBuilder = _GroupBuilder,
    this.physics,
    this.scroll,
    this.shrinkWrap,
    this.scrollDirection = Axis.vertical,
    super.padding,
  });

  @override
  Widget createBy(PagingController paging, PagedChildBuilderDelegate builder) {
    return PagedListView(
      physics: physics,
      padding: padding,
      scrollController: scroll,
      shrinkWrap: shrinkWrap ?? false,
      pagingController: paging,
      builderDelegate: PagedChildBuilderDelegate(
        firstPageErrorIndicatorBuilder: builder.firstPageErrorIndicatorBuilder,
        firstPageProgressIndicatorBuilder: builder.firstPageProgressIndicatorBuilder,
        newPageErrorIndicatorBuilder: builder.newPageErrorIndicatorBuilder,
        newPageProgressIndicatorBuilder: builder.newPageProgressIndicatorBuilder,
        noItemsFoundIndicatorBuilder: builder.noItemsFoundIndicatorBuilder,
        noMoreItemsIndicatorBuilder: builder.noMoreItemsIndicatorBuilder,
        animateTransitions: builder.animateTransitions,
        transitionDuration: builder.transitionDuration,
        itemBuilder: (ctx, item, i) {
          Widget child = builder.itemBuilder(ctx, item, i);

          if (itemExtent != null) {
            child = SizedBox(width: itemExtent, child: child);
          }

          final group = groupBy(item as T);

          if (i < 1 || group != groupBy(paging.itemList![i - 1])) {
            child = Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (i > 1 && divider != null) divider!,
                groupBuilder(i, group),
                child,
              ],
            );
          } else if (divider != null) {
            child = Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                divider!,
                child,
              ],
            );
          }

          return child;
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  static Widget _GroupBuilder(int index, String label) {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      padding: const Pad(left: 16),
      child: XText(label, style: const TextStyle(fontSize: 12, color: Color(0xFF7E838E))),
    );
  }
}

class ConfigList extends StatelessWidget {
  final Widget child;
  final BaseConfig? config;

  const ConfigList({super.key, required this.child, this.config});

  @override
  Widget build(BuildContext context) {
    final _config = config;

    return _config != null //
        ? Provider<BaseConfig>.value(value: _config, child: child)
        : child;
  }
}

Widget _$Padding(Widget sliver, PagingController paging, EdgeInsets? padding) {
  const block = {
    PagingStatus.loadingFirstPage,
    PagingStatus.firstPageError,
    PagingStatus.noItemsFound,
  };

  return AnimatedBuilder(
    animation: paging,
    child: sliver,
    builder: (context, child) {
      Widget sliver = child!;

      EdgeInsetsGeometry? effectivePadding = padding;

      if (block.contains(paging.value.status) || padding == null) {
        final mediaQuery = MediaQuery.maybeOf(context);

        if (mediaQuery != null) {
          final mediaQueryVerticalPadding = mediaQuery.padding.copyWith(left: 0.0, right: 0.0);

          effectivePadding = mediaQueryVerticalPadding;
        }
      }

      if (effectivePadding != null) {
        sliver = SliverPadding(padding: effectivePadding, sliver: sliver);
      }

      return sliver;
    },
  );
}

extension XBaseConfig on BaseConfig {
  bool get isSliver => typeIf<SliverMixin>()?.isSliver ?? false;
}
