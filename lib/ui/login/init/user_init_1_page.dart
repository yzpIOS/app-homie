import 'dart:convert';

import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/unity_view.dart';
import 'package:app/ui/login/init/user_init_2_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class UserInit1Page extends StatefulWidget {
  final String token;

  const UserInit1Page({super.key, required this.token});

  @override
  State<UserInit1Page> createState() => _UserInit1PageState();
}

class _UserInit1PageState extends State<UserInit1Page> with BusStateMixin {
  final genderRx = Rxn<GenderEnum>();

  @override
  void initState() {
    super.initState();

    on<XUnityEvent>(
      test: (event) => event.code == Unity2AppEnum.UTF_SELECTED_GENDER,
      (event) {
        final data = jsonDecode(event.data);

        genderRx(
          GenderEnum.fromCode(data['gender']),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.simpleDialog(msg: '确定取消注册').then((it) => endOfFrame(() => it == '确定')),
      child: Scaffold(
        appBar: xAppBar(bgColor: Colors.transparent),
        extendBodyBehindAppBar: true,
        body: $BodyView(),
      ),
    );
  }

  Widget $BodyView() {
    return Stack(
      children: [
        UnityView(
          uniqueKey: 'SelectScene',
          onInit: (_, loader, __) => loader('SelectScene'),
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

  Widget $NextView() {
    void onTap(GenderEnum gender) {
      Get.simpleDialog(msg: '性别选定后将不能修改').onResult(okCall: () async {
        final result = await Get.to(
          () => UserInit2Page(token: widget.token, gender: gender),
          popGesture: false,
        );

        Get.back(result: result);
      });
    }

    return Obx(
      () {
        final gender = genderRx();

        return gender == null
            ? Spacing.blank
            : XTextBtn(
                label: '下一步',
                textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
                onTap: () => onTap(gender),
              );
      },
    );
  }
}
