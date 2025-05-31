import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DataView$Page<CTRL extends PageListCtrl<T>, T> extends StatelessWidget {
  final ItemWidgetBuilder<T> itemBuilder;
  final PagingController<PageNum, T> paging;

  DataView$Page({super.key, CTRL? ctrl, required this.itemBuilder}) : paging = (ctrl ?? Get.find<CTRL>()).paging;

  @override
  Widget build(BuildContext context) {
    final config = context.read<BaseConfig>();

    Widget child;
    if(config.needNorMore) {

      child = config.createBy(
        paging,
        PagedChildBuilderDelegate(
          animateTransitions: false,
          noMoreItemsIndicatorBuilder: (ctx) => ctx.state<DataNoMore>(),
          noItemsFoundIndicatorBuilder: (ctx) => ctx.state<DataEmpty>(paging.refresh),
          firstPageProgressIndicatorBuilder: (ctx) => ctx.state<DataLoading>(),
          newPageProgressIndicatorBuilder: (ctx) => ctx.state<MoreDataLoading>(),
          firstPageErrorIndicatorBuilder: (ctx) => ctx.dataErrorState(paging.refresh, paging.error),
          itemBuilder: (ctx, item, i) => itemBuilder(ctx, item, i),
        ),
      );
    } else {
      child = config.createBy(
        paging,
        PagedChildBuilderDelegate(
          animateTransitions: false,
          noItemsFoundIndicatorBuilder: (ctx) => ctx.state<DataEmpty>(paging.refresh),
          firstPageProgressIndicatorBuilder: (ctx) => ctx.state<DataLoading>(),
          newPageProgressIndicatorBuilder: (ctx) => ctx.state<MoreDataLoading>(),
          firstPageErrorIndicatorBuilder: (ctx) => ctx.dataErrorState(paging.refresh, paging.error),
          itemBuilder: (ctx, item, i) => itemBuilder(ctx, item, i),
        ),
      );
    }

    if (!config.isSliver) {
      child = XSnapshotWidget(child: child);
    }

    return child;
  }
}
