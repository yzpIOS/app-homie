import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class SelectUserPage extends StatelessWidget {
  final int roomId;
  final String? title;

  const SelectUserPage({super.key, required this.roomId, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: title),
      body: _DataView(roomId),
    );
  }
}

class _DataView extends SimplePageView<Map> {
  final int roomId;

  _DataView(this.roomId);

  @override
  Future fetchPage(PageNum page) {
    return Api.Room.onlineUser(page: page, roomId: roomId);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return UserInfoCtrl.use(item['uid'], builder: (it) {
      return TileView(
        data: TileDataAdapter2(title: it?.showName() ?? '', leading: it?.avatar ?? ''),
        onTapOver: Some(
          () => Get.back(result: item),
        ),
      );
    });
  }
}
