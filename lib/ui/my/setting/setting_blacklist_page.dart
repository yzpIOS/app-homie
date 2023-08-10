import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools/help.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class SettingBlackListPage extends StatefulWidget {
  const SettingBlackListPage({super.key});

  @override
  State<SettingBlackListPage> createState() => _SettingBlackListPageState();
}

class _SettingBlackListPageState extends State<SettingBlackListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '通讯录黑名单'),
      body: _DataView(),
    );
  }
}

class _DataView extends SimplePageView<String> {
  @override
  BaseConfig get config {
    return const ListConfig(
      divider: Divider(indent: 10, endIndent: 10),
    );
  }

  @override
  Future fetchPage(PageNum page) => Api.UserInfo.blackListQuery(page: page);

  @override
  Widget itemBuilder(BuildContext context, String item, int index) {
    late final UID uid = item;

    return Center(
      child: UserInfoCtrl.use(
        uid,
        builder: (it) {
          return ListTile(
            contentPadding: const Pad(vertical: 7, horizontal: 10),
            onTap: toUserPage(uid),
            leading: AvatarView(it?.avatar, blur: it?.avatarEx, size: 50),
            title: Text(
              it?.showName() ?? '',
              style: const TextStyle(fontSize: 14, color: AppPalette.c3),
            ),
            //trailing: action?.let((fn) => fn(uid, data, setState)),
            trailing: XOutlinedBtn(
              label: '移除',
              width: 60,
              height: 24,
              textStyle: const TextStyle(fontSize: 14, color: AppPalette.primary),
              onTap: () {
                simpleSub(
                  Api.UserInfo.blackListDelete(uid),
                  callback:  () {
                    controller.removeItem(item);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
