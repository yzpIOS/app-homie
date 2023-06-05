import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/search_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/home/room_item_view.dart';
import 'package:app/ui/home/room_search_more_page.dart';
import 'package:app/ui/home/search_blank_view.dart';
import 'package:app/ui/home/user_search_item_view.dart';
import 'package:app/ui/home/user_search_more_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  final keywordRx = RxnString();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: _FlexibleSpace(child: $SearchView())),
      body: Obx(() {
        final keyword = keywordRx();

        return keyword == null || keyword.isEmpty ? SearchBlankView(doSearch: _doSearch) : _DataView(keyword);
      }),
    );
  }

  Widget $SearchView() {
    return XInputView(
      controller: controller,
      height: 32,
      autofocus: true,
      hintText: '搜索用户/房间',
      textInputAction: TextInputAction.search,
      suffixIcon: $SuffixIcon(),
      onSubmitted: keywordRx,
    );
  }

  Widget $SuffixIcon() {
    return Obx(() {
      final keyword = keywordRx();

      return keyword == null || keyword.isEmpty
          ? Spacing.blank
          : IntrinsicWidth(
              child: OpacityButton(
                onTap: () => _doSearch(''),
                child: const Center(
                  child: Icon(CupertinoIcons.xmark_circle_fill, size: 16),
                ),
              ),
            );
    });
  }

  void _doSearch(String keyword) {
    controller
      ..clear()
      ..join(keyword);

    keywordRx(keyword);
  }
}

class _DataView extends StatefulWidget {
  final String keyword;

  _DataView(this.keyword) : super(key: ValueKey(keyword));

  @override
  State<_DataView> createState() => _DataViewState();
}

class _DataViewState extends State<_DataView> {
  late final keyword = widget.keyword;

  late final api = Future.wait(
    [
      Api.Room.search(page: const PageNum(size: 3), keyword: keyword),
      Api.UserInfo.search(page: const PageNum(size: 5), keyword: keyword),
    ],
  );

  @override
  void initState() {
    super.initState();

    Get.find<HomeSearchCtrl>().addKeyword(keyword);
  }

  @override
  Widget build(BuildContext context) {
    return XFutureBuilder<List>(
      api,
      onData: (data) {
        final List? rooms = data[0];
        final List? users = data[1];

        return (rooms == null || rooms.isEmpty) && (users == null || users.isEmpty)
            ? Align(
                alignment: const Alignment(0, -0.5),
                child: LayoutBuilder(
                  builder: (_, c) {
                    return SizedBox(
                      width: c.maxWidth,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: context.state<DataEmpty>(),
                      ),
                    );
                  },
                ),
              )
            : CustomScrollView(
                slivers: [
                  if (rooms != null && rooms.isNotEmpty) $RoomView(rooms),
                  if (users != null && users.isNotEmpty) $UserView(users),
                ],
              );
      },
    );
  }

  Widget $RoomView(List data) {
    return $ItemWrap(
      onTap: () => Get.to(() => RoomSearchMorePage(keyword: keyword)),
      title: '相关房间',
      sliver: SliverPadding(
        padding: const Pad(top: 8, horizontal: 10),
        sliver: SliverGrid(
          gridDelegate: RoomItemView.delegate,
          delegate: SliverChildBuilderDelegate(
            childCount: data.length,
            (_, i) => RoomItemView(data: data[i]),
          ),
        ),
      ),
    );
  }

  Widget $UserView(List data) {
    return $ItemWrap(
      onTap: () => Get.to(() => UserSearchMorePage(keyword: keyword)),
      title: '相关用户',
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: data.length,
          (_, i) => UserSearchItemView(data: data[i]),
        ),
      ),
    );
  }

  Widget $ItemWrap({required Widget sliver, required String title, VoidCallback? onTap}) {
    Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
        ),
        const DecoratedBox(
          decoration: ShapeDecoration(shape: AppShape.a4, color: Color(0xFFF5F5F5)),
          child: Box(
            width: 70,
            height: 22,
            alignment: Alignment.center,
            child: Text(
              '查看更多',
              style: TextStyle(fontSize: 14, color: AppPalette.c9),
            ),
          ),
        ),
      ],
    );

    child = Padding(
      padding: const Pad(horizontal: 10, top: 20, bottom: 4),
      child: child,
    );

    child = OpacityButton(onTap: onTap, child: child);

    return MultiSliver(
      children: [
        const Divider(height: 10, thickness: 10, color: AppPalette.background2),
        child,
        SliverPadding(
          padding: const Pad(bottom: 20),
          sliver: sliver,
        ),
      ],
    );
  }
}

class _FlexibleSpace extends StatelessWidget {
  final Widget child;

  const _FlexibleSpace({required this.child});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Box(
        height: AppSize.appBar,
        padding: const Pad(left: AppSize.appBar, right: 16),
        alignment: Alignment.centerLeft,
        child: child,
      ),
    );
  }
}
