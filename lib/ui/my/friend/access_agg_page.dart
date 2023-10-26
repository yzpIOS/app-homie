import 'package:app/common/theme.dart';
import 'package:app/model/enum/sys_conv_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class AccessAggPage extends StatefulWidget {
  const AccessAggPage({super.key});

  @override
  State<AccessAggPage> createState() => _AccessAggPageState();
}

class _AccessAggPageState extends State<AccessAggPage> {
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
  Future fetchPage(PageNum page) => Api.UserInfo.accessAgg(page: page);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final UID uid = item['access_uid'];
    final count = '${item['access_count']}次';
    final time = TimeFormat.yyyyMMdd.formatEpoch(item['last_access_at']);

    return UserInfoCtrl.use(uid, builder: (it) {
      return ListTile(
        dense: false,
        onTap: toUserPage(uid),
        leading: AvatarView(it?.avatar, blur: it?.avatarEx, size: 50, isShowOnline: false,),
        title: Text(
          it?.showName() ?? '',
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        subtitle: Text(
          time,
          style: const TextStyle(fontSize: 12, color: AppPalette.c9),
        ),
        trailing: Text(
          count,
          style: const TextStyle(fontSize: 12, color: AppPalette.c9),
        ),
      );
    });
  }
}
