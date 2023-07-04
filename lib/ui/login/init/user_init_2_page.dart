import 'package:app/common/theme.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/login/init/user_init_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class UserInit2Page extends StatefulWidget {
  final String token;
  final GenderEnum gender;

  const UserInit2Page({super.key, required this.token, required this.gender});

  @override
  State<UserInit2Page> createState() => _UserInit2PageState();
}

class _UserInit2PageState extends State<UserInit2Page> {
  late final token = widget.token;
  late final gender = widget.gender;

  final avatarRx = Rxn<Tuple2<int, AssetEntity>>();
  final inputs = Map.fromIterable(
    const {'昵称'},
    value: (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return UserInitView(
      children: [
        Positioned(
          top: AppSize.safeTop + 10,
          child: const XText(
            '完善资料',
            style: TextStyle(fontSize: 18, fontWeight: fw$Medium),
          ),
        ),
        Positioned(
          top: AppSize.safeTop + 120,
          left: 10,
          right: 10,
          child: $NickView(),
        ),
        Positioned(
          top: AppSize.safeTop + 74,
          width: 90,
          height: 90,
          child: $Avatar(90),
        ),
        Positioned(
          left: 48,
          right: 48,
          bottom: AppSize.safeBottom + 30,
          child: $NextView(),
        ),
      ],
    );
  }

  Widget $Avatar(double size) {
    Widget child = Obx(
      () {
        final asset = avatarRx()?.value2;

        return ClipOval(
          child: asset == null //
              ? Box(
                  width: size,
                  height: size,
                  color: const Color(0xFFF5F5F5),
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacing.h6,
                      Icon(Icons.camera_alt_rounded, color: Colors.black),
                      Spacing.h2,
                      Text(
                        '上传头像',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                )
              : Image(image: asset.toProvider(), width: size, height: size, fit: BoxFit.cover),
        );
      },
    );

    child = OpacityButton(onTap: doSelectImage, child: child);

    return child;
  }

  Widget $NickView() {
    Widget child = Box(
      height: 260,
      padding: const Pad(horizontal: 36, top: 75, bottom: 40),
      child: Column(
        children: [
          Row(
            children: [
              const XText(
                '昵称',
                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
              ),
              Spacing.w10,
              Expanded(
                child: FormInputView(
                  controller: inputs['昵称'],
                  hint: '昵称',
                ),
              ),
            ],
          ),
        ],
      ),
    );

    child = Material(
      elevation: 6,
      color: Colors.white,
      borderRadius: AppBorderRadius.a10,
      shadowColor: const Color(0x7F000000),
      child: child,
    );

    return child;
  }

  Widget $NextView() {
    return XTextBtn(
      label: '立即进入${appInfo.appName}',
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
      onTap: doSub,
    );
  }

  void doSelectImage() {
    imagePicker(
      max: 1,
      okCall: (it) async {
        final asset = it.first;

        simpleSub(
          Api.Common.upImage(attach: AssetImageAttach(asset: asset)),
          callback1: (resp) {
            avatarRx(
              Tuple2((resp as Tuple3).value1, asset),
            );
          },
        );
      },
    );
  }

  void doSub() async {
    if (inputs.validate()) {
      hideKeyboard();

      final avatar = avatarRx()?.value1;

      if (avatar == null) {
        final resp = await Get.simpleDialog(msg: '上传头像', okLabel: '确定', cancelLabel: '跳过');

        switch (resp) {
          case '跳过':
            break;
          case '确定':
            doSelectImage();
            return;
          default:
            return;
        }
      }

      simpleSub(
        () async {
          await Api.UserInfo.setInfo(nickName: inputs.by('昵称'), gender: gender, avatar: avatar, token: token);
          Map info = await Api.UserInfo.myInfo(token: token);
          // await OAuthCtrl.ins.updateUserInfo(info, token);
          return info;
        },
        callback1: (resp) {
          Get.find<MyInfoCtrl>().doRefresh();
          return Get.back(result: resp);
        },
      );
    }
  }
}
