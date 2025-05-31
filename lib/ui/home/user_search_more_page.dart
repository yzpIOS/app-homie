import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/home/user_search_item_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class UserSearchMorePage extends StatefulWidget {
  final String keyword;

  const UserSearchMorePage({super.key, required this.keyword});

  @override
  State<UserSearchMorePage> createState() => _UserSearchMorePageState();
}

class _UserSearchMorePageState extends State<UserSearchMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '用户'),
      body: _DataView(keyword: widget.keyword),
    );
  }
}

class _DataView extends SimplePageView<Map> {
  final String keyword;

  _DataView({required this.keyword});

  @override
  Future fetchPage(PageNum page) {
    return Api.UserInfo.search(page: page, keyword: keyword);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return UserSearchItemView(data: item);
  }
}
