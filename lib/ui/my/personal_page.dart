import 'package:app/common/theme.dart';
import 'package:app/model/api/my_info_dto.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/x_input_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class PersonalPage extends GetView<MyInfoCtrl> {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '编辑个人资料'),
      body: SingleChildScrollView(
        padding: const Pad(horizontal: 10, top: 10, bottom: 64),
        child: Obx(
          () => $BodyView(controller.dataRx()),
        ),
      ),
    );
  }

  Widget $BodyView(MyInfoDto data) {
    final items = <List<Tuple3<String, String?, VoidCallback?>>>[
      [
        Tuple3(
          '昵称',
          data.nickName,
          () {
            XInputPage.go(InputCfg(title: '修改昵称', maxLength: null, initial: data.nickName)) //
                .onNotNull(controller.updateNick);
          },
        ),
        Tuple3(
          '简介',
          data.desc,
          () {
            XInputPage.go(InputCfg(title: '修改简介', maxLength: null, initial: data.desc)) //
                .onNotNull(controller.updateDesc);
          },
        ),
      ],
      [
        Tuple3(
          '性别',
          data.gender?.label,
          null,
          // () {
          //   Get.showSheet(GenderEnum.values, toTitle: (it) => Tuple2(it.label, null)) //
          //       .onNotNull(controller.updateGender);
          // },
        ),
        Tuple3(
          '生日',
          data.birthDay?.let(TimeFormat.yyyyMMdd.format),
          () {
            final now = DateTime.now();

            showDatePicker(
              context: Get.context!,
              initialDate: now.copyWith(year: now.year - 20, month: 1, day: 1),
              firstDate: now.copyWith(year: now.year - 100),
              lastDate: now,
              initialDatePickerMode: DatePickerMode.year,
            ).onNotNull(controller.updateBirthDay);
          },
        ),
        // Tuple3(
        //   '所在地',
        //   null,
        //   () {},
        // ),
      ],
    ];

    return Column(
      children: [
        $AvatarView(data),
        TableView(
          divider: const Some(Divider()),
          [
            for (final item in items)
              TableGroup(
                divider: const None(),
                [
                  for (final it in item) //
                    TableItem(title: it.value1, tips: it.value2, onTap: it.value3),
                ],
              ),
          ],
        ),
      ],
    );
  }

  Box $AvatarView(MyInfoDto data) {
    return Box(
      height: 160,
      alignment: Alignment.center,
      child: OpacityButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarView(data.avatar, blur: data.avatarEx, size: 80),
            Spacing.h10,
            const XText(
              '点击更换头像',
              style: TextStyle(fontSize: 14, color: AppPalette.primary),
            ),
          ],
        ),
        onTap: () => imagePicker(
          max: 1,
          okCall: (it) => controller.updateAvatar(it.first),
        ),
      ),
    );
  }
}
