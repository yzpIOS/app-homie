import 'dart:math';

import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/search_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/home/room_item_view.dart';
import 'package:app/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class SearchBlankView extends StatefulWidget {
  final ValueChanged<String> doSearch;

  const SearchBlankView({super.key, required this.doSearch});

  @override
  State<SearchBlankView> createState() => _SearchBlankViewState();
}

class _SearchBlankViewState extends State<SearchBlankView> {
  final searchCtrl = Get.find<HomeSearchCtrl>();
  final dataRx = RxList();

  @override
  void initState() {
    super.initState();

    Api.Room.hotRoomList(page: const PageNum(size: 5)).onType<List>(dataRx);
  }

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: 10, thickness: 10, color: AppPalette.background2);

    return Obx(() {
      final rooms = dataRx();
      final keywords = searchCtrl.dataRx();

      return Column(
        children: <Widget>[
          if (keywords.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: Pad(horizontal: 10, top: 10),
                      child: Text(
                        '搜索历史',
                        style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Medium),
                      ),
                    ),
                    InkResponse(
                      onTap: searchCtrl.doClear,
                      child: Padding(
                        padding: const Pad(top: 8, right: 10),
                        child: SvgView(SVG.$('icon_qingchu'), width: 24, height: 24),
                      ),
                    ),
                  ],
                ),
                $HistoryView(keywords),
              ],
            ),
          if (rooms.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: Pad(all: 10),
                  child: Text(
                    '热门房间',
                    style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Medium),
                  ),
                ),
                $RoomView(rooms),
              ],
            ),
        ].separator(divider).toList(growable: false),
      );
    });
  }

  Widget $RoomView(List data) {
    const double height = 70 + 10 + 17;

    const delegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      mainAxisExtent: height,
    );

    return SizedBox(
      height: height,
      child: GridView.builder(
        padding: const Pad(horizontal: 10),
        gridDelegate: delegate,
        itemCount: min(data.length, 5),
        itemBuilder: (_, i) => RoomItemView(
          data: data[i],
          isShowMore: false,
          textStyle: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );
  }

  Widget $HistoryView(List<String> data) {
    Widget itemBuilder(String data) {
      Widget child = XText(
        data,
        style: const TextStyle(fontSize: 12, color: AppPalette.c3),
      );

      child = Container(
        alignment: Alignment.center,
        padding: const Pad(horizontal: 8),
        margin: const Pad(horizontal: 5, vertical: 4),
        decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0xFFF5F5F5)),
        child: child,
      );

      child = IntrinsicWidth(child: child);

      child = ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 40, maxWidth: 120, minHeight: 32, maxHeight: 32),
        child: child,
      );

      child = OpacityButton(
        onTap: () => widget.doSearch(data),
        child: child,
      );

      return child;
    }

    return Padding(
      padding: const Pad(horizontal: 5, top: 2, bottom: 14),
      child: WrapSuper(
        spacing: 10,
        wrapFit: WrapFit.min,
        alignment: WrapSuperAlignment.left,
        children: data.take(10).map(itemBuilder).toList(growable: false),
      ),
    );
  }
}
