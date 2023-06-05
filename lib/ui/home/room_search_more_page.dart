import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/home/room_item_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoomSearchMorePage extends StatefulWidget {
  final String keyword;

  const RoomSearchMorePage({super.key, required this.keyword});

  @override
  State<RoomSearchMorePage> createState() => _RoomSearchMorePageState();
}

class _RoomSearchMorePageState extends State<RoomSearchMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '房间'),
      body: _DataView(keyword: widget.keyword),
    );
  }
}

class _DataView extends SimplePageView<Map> {
  final String keyword;

  _DataView({required this.keyword});

  @override
  BaseConfig get config {
    return const GridConfig(
      padding: Pad(horizontal: 10, top: 10, bottom: 30),
      gridDelegate: RoomItemView.delegate,
    );
  }

  @override
  Future fetchPage(PageNum page) {
    return Api.Room.search(page: page, keyword: keyword);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return RoomItemView(data: item);
  }
}
