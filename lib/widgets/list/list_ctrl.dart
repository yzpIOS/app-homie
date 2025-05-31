import 'package:app/tools.dart';
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PageNum {
  final int size;
  final int index;

  final int page;
  final int offset;
  final int limit;

  const PageNum({this.index = 0, this.size = 20})
      : page = index + 1,
        offset = index * size,
        limit = size;

  Map<String, dynamic> operator +(Map other) {
    return {
      ...other,
      'offset': offset,
      'limit': limit,
    };
  }

  PageNum nextPage() => PageNum(index: index + 1, size: size);

  bool firstPage() => page == 1;
}

mixin LazyData<T> {
  Future fetchPage(PageNum page);

  PageNum? nextPage(PageNum page) => page.nextPage();

  Iterable<T> transform(data) {
    if (data is Iterable<T>) {
      return data;
    } else if (data is Iterable) {
      return data.cast();
    } else {
      throw ArgumentError();
    }
  }
}

abstract class PageListCtrl<T> extends GetxController with LazyData<T> {
  final paging = PagingController<PageNum, T>(
    firstPageKey: const PageNum(),
    invisibleItemsThreshold: 10,
  );

  List<T> get data => paging.itemList ?? [];

  @override
  void onInit() {
    super.onInit();

    paging
      ..addPageRequestListener(_fetchPage)
      ..addStatusListener((status) {
        switch (status) {
          case PagingStatus.completed:
            break;
          case PagingStatus.noItemsFound:
            break;
          case PagingStatus.loadingFirstPage:
            break;
          case PagingStatus.ongoing:
            break;
          case PagingStatus.firstPageError:
            break;
          case PagingStatus.subsequentPageError:
            break;
        }
      });
  }

  Future<void> doRefresh() => Future.sync(paging.refresh);

  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  void _notify() => paging.notifyListeners();

  void insertItem(int index, T item) {
    final _data = paging.itemList;

    if (_data != null) {
      _data.insert(index, item);
      _notify();
    } else {
      assert(false, '数据错误');

      // paging.itemList = [item];
    }
  }

  void updateItem(int index, T item) {
    final _data = paging.itemList;

    if (_data != null && index < _data.length) {
      _data[index] = item;
      _notify();
    }
  }

  void removeItem(T item) {
    final _data = paging.itemList;

    if (_data != null && _data.remove(item)) {
      if (_data.isEmpty) paging.notifyStatusListeners(PagingStatus.noItemsFound);

      _notify();
    } else {
      assert(false, '数据错误');
    }
  }

  void removeOne(bool Function(T element) test) {
    final _data = paging.itemList;

    if (_data != null) {
      final item = _data.firstWhereOrNull(test);

      if (item != null) removeItem(item);
    }
  }

  void removeWhere(bool Function(T element) test) {
    final _data = paging.itemList;

    if (_data != null) {
      _data.removeWhere(test);

      if (_data.isEmpty) paging.notifyStatusListeners(PagingStatus.noItemsFound);

      _notify();
    }
  }

  void removeAll() {
    paging.itemList?.also((it) {
      it.clear();

      _notify();
    });
  }

  @override
  @mustCallSuper
  void onClose() {
    paging.removePageRequestListener(_fetchPage);

    //延迟，等待别的地方先解除监听
    Timer(const Duration(seconds: 1), () => paging.dispose());

    super.onClose();
  }

  void _fetchPage(PageNum page) async {
    try {
      final result = await fetchPage(page);

      if (result == null) {
        paging.appendLastPage([]);
      } else if (result is FinalPageData<T>) {
        paging.appendLastPage(result.data);
      } else {
        final items = _useResult(result)?.toList(growable: false);

        if (items == null || items.isEmpty) {
          paging.appendLastPage([]);
        } else if (items.length < page.size) {
          paging.appendLastPage(items);
        } else {
          appendPage(items, nextPage(page));
        }
      }
    } catch (e, s) {
      errLog(e, s);

      paging.error = e;
    }
  }

  void appendPage(List<T> items, PageNum? next) => paging.appendPage(items, next);

  Iterable<T>? _useResult(result) {
    if (result is Map) {
      if (result.containsKey('items')) {
        return (result['items'] as Object?)?.let(transform);
      } else if (result.containsKey('list')) {
        return (result['list'] as Object?)?.let(transform);
      }
    }

    return transform(result);
  }
}

class FinalPageData<T> {
  final List<T> data;

  FinalPageData(this.data);
}
