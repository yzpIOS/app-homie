import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingPermissionPage extends StatefulWidget {
  const SettingPermissionPage({super.key});

  @override
  State<SettingPermissionPage> createState() => _SettingPermissionPageState();
}

class _SettingPermissionPageState extends State<SettingPermissionPage> with BusStateMixin {
  List<Tuple3<String, String, VoidCallback?>>? _items;

  Future<List<Tuple3<String, String, VoidCallback?>>> api() async {
    //TODO openAppSettings

    const items = [
      // Tuple4('位置权限', '附近的人，位置展示均需要授权该权限', Permission.location, openAppSettings),
      Tuple4('通知权限', '开启信息提醒，不错过好友信息', Permission.notification, openAppSettings),
      Tuple4('相机权限', '在拍照时需获取该权限', Permission.camera, openAppSettings),
      Tuple4('麦克风权限', '上传语音条时需要获取该权限', Permission.microphone, openAppSettings),
      Tuple4('照片权限', '发图文动态或头像时需要获取该权限', Permission.photos, openAppSettings),
    ];

    return _items = await Future.wait(
      items.map(
        (it) async {
          final isGranted = await it.value3.isGranted;

          return Tuple3<String, String, VoidCallback?>(it.value1, it.value2, isGranted ? null : it.value4);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    on<AppLifecycleEvent>(
      test: (event) => event.state == AppLifecycleState.resumed,
      (_) {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background2,
      appBar: xAppBar(title: '隐私'),
      body: XFutureBuilder(api(), initialData: _items, onData: $Body),
    );
  }

  Widget $Body(List<Tuple3<String, String, VoidCallback?>> items) {
    return CustomScrollView(
      slivers: [
        // const SliverToBoxAdapter(
        //   child: Box(
        //     padding: Pad(horizontal: 10, top: 10, bottom: 5),
        //     child: Text(
        //       '系统权限设置',
        //       style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Bold),
        //     ),
        //   ),
        // ),
        $PermissionView(items),
        // const SliverToBoxAdapter(
        //   child: Box(
        //     height: 54,
        //     padding: Pad(horizontal: 10),
        //     alignment: Alignment.centerLeft,
        //     child: Text(
        //       '为了保障产品功能使用，本APP会向您申请以上手机权限，您可以 在这里完成权限操作管理',
        //       style: TextStyle(fontSize: 12, color: AppPalette.c9),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget $PermissionView(List<Tuple3<String, String, VoidCallback?>> items) {
    Widget itemBuilder(Tuple3<String, String, VoidCallback?> data) {
      return Material(
        color: Colors.white,
        child: ListTile(
          onTap: data.value3,
          dense: true,
          contentPadding: const Pad(horizontal: 10),
          title: Text(
            data.value1,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          subtitle: Text(
            data.value2,
            style: const TextStyle(fontSize: 10, color: AppPalette.c9),
          ),
          trailing: data.value3 == null
              ? const Padding(
                  padding: Pad(right: 24),
                  child: Text(
                    '已授权',
                    style: TextStyle(fontSize: 14, color: AppPalette.c9),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '去设置',
                      style: TextStyle(fontSize: 14, color: AppPalette.primary),
                    ),
                    $Arrow(),
                  ],
                ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildListDelegate(
        items.map(itemBuilder).separator(const Divider(indent: 10, endIndent: 10)).toList(growable: false),
      ),
    );
  }

  Widget $Arrow() {
    return const SizedBox(
      width: 24,
      height: 24,
      child: RightArrowIcon(),
    );
  }
}
