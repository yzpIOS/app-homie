import 'package:app/model/enum/sys_conv_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  @override
  void initState() {
    super.initState();

    Get.find<ConvManagerCtrl>().markConvAsRead(SysConvEnum.guest);
  }

  @override
  void dispose() {
    super.dispose();

    Get.find<ConvManagerCtrl>().markConvAsRead(SysConvEnum.guest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '我的访客'),
      body: _DtaView(),
    );
  }
}

class _DtaView extends SimplePageView<Map> {
  @override
  Future fetchPage(PageNum page) => Api.UserInfo.accessList(page: page);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final UID uid = item['access_uid'];
    final time = TimeUtils.fromNow(item['create_at']);
    final bool onlineStatus = (item['status'] == 1);//是否直播中

    return UserHomeWrap(
      uid: uid,
      child: UserInfoCtrl.use(uid, builder: (it) {
        return _ItemView(
          data: TileDataAdapter4(title: it?.showName() ?? '', leading: it?.avatar ?? '', subtitle: time, isShowOnline: onlineStatus),
        );
      }),
    );
  }
}

class _ItemView extends TileView<TileDataAdapter4> with TileSubtitle<TileDataAdapter4> {
  _ItemView({required super.data});
}
