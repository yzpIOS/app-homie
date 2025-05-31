import 'package:app/common/theme.dart';
import 'package:app/model/api/user_info_model.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/x_input_page.dart';
import 'package:app/widgets.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';

class PersonalPage extends GetView<MyInfoCtrl> {
  const PersonalPage({super.key});

  final _divider = const Divider(height: 1, color: Color(0xFFE3E7ED));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '编辑个人资料'),
      body: SingleChildScrollView(
        padding: const Pad(bottom: 64),
        child: Obx(
          () => $BodyView(controller.dataRx()),
        ),
      ),
    );
  }

  Widget $BodyView(UserInfoModel data) {
    String? tempBirthDay;
    final birthDay = data.birthDay;
    if (birthDay != null) {
      tempBirthDay = '${birthDay.year}-${birthDay.month}-${birthDay.day}';
    }

    final items = <Tuple4<String?, String, String?, void Function()?>>[
      Tuple4(
        'my/编辑昵称',
        '昵称',
        data.nickName,
        () {
          XInputPage.go(InputCfg(title: '修改昵称', maxLength: null, initial: data.nickName)) //
              .onNotNull(controller.updateNick);
        },
      ),
      Tuple4(
        'my/编辑简介',
        '简介',
        data.desc ?? '介绍一下自己',
        () {
          XInputPage.go(InputCfg(title: '修改简介', maxLength: null, initial: data.desc)) //
              .onNotNull(controller.updateDesc);
        },
      ),
      Tuple4(
        'my/编辑性别',
        '性别',
        data.gender?.label,
        null,
      ),
      Tuple4(
        'my/编辑生日',
        '生日',
        tempBirthDay,//data.birthDay?.let(TimeFormat.yyyyMMdd.format),
        () {
          final now = DateTime.now();
          showDatePicker(
            context: Get.context!,
            initialDate: now.copyWith(year: now.year - 20, month: 1, day: 1),
            firstDate: DateTime(1970, 1, 1),
            lastDate: now,
            initialDatePickerMode: DatePickerMode.year,
          ).onNotNull(controller.updateBirthDay);
        },
      ),
      Tuple4(
        'my/编辑星座',
        '星座',
        data.starSign,
        null,
      ),
      Tuple4(
        'my/编辑地区',
        '地区',
        data.location,
        () async {
          Result? result = await CityPickers.showCityPicker(
            context: Get.context!,
            showType: ShowType.p,
          );
          if (result != null) {
            String location = (result.provinceName ?? '');
            controller.updateLocation(location);
          }
        },
      ),
      // [
      //   Tuple4(
      //     '性别',
      //     data.gender?.label,
      //     null,
      //     '',
      //     // () {
      //     //   Get.showSheet(GenderEnum.values, toTitle: (it) => Tuple2(it.label, null)) //
      //     //       .onNotNull(controller.updateGender);
      //     // },
      //   ),
      //   Tuple4(
      //     '生日',
      //     data.birthDay?.let(TimeFormat.yyyyMMdd.format),
      //     () {
      //       final now = DateTime.now();
      //
      //       showDatePicker(
      //         context: Get.context!,
      //         initialDate: now.copyWith(year: now.year - 20, month: 1, day: 1),
      //         firstDate: now.copyWith(year: now.year - 100),
      //         lastDate: now,
      //         initialDatePickerMode: DatePickerMode.year,
      //       ).onNotNull(controller.updateBirthDay);
      //     },
      //     '',
      //   ),
      //   // Tuple3(
      //   //   '所在地',
      //   //   null,
      //   //   () {},
      //   // ),
      // ],
    ];

    return Column(
      children: [
        $AvatarView(data),
        TableView(
          // divider: const Some(Divider()),
          divider: Some(PreferredSize(preferredSize: Size.fromHeight(1), child: _divider)),
          [
            TableGroup(
              [
                for (final item in items)
                  TableItem(icon: item.value1, title: item.value2, tips: item.value3, onTap: item.value4),
              ],
            ),
            // for (final item in items)
            //   TableGroup(
            //     divider: const None(),
            //     [
            //       for (final it in item) //
            //         TableItem(title: it.value1, tips: it.value2, onTap: it.value3),
            //     ],
            //   ),
          ],
        ),
      ],
    );
  }

  Box $AvatarView(UserInfoModel data) {
    return Box(
      height: 140,
      alignment: Alignment.center,
      child: OpacityButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarView(
                data.avatarUrl,
                blur: data.avatarExtra,
                size: 82.6,
              avatarFrameUrl: data.avatarFrame,
              avatarFrameSize: 16,
            ),
            Spacing.h10,
            const XText(
              '点击编辑头像',
              style: TextStyle(fontSize: 13, color: AppPalette.primary),
            ),
          ],
        ),
        onTap: () {
          imagePicker(
            max: 1,
            okCall: (it) async {
              String? filePath = await ImageHelp.cropImage(it.first);
              if (filePath != null) {
                controller.updateAvatar(filePath);
              }
            },
          );
        },
        // onTap: () => imagePicker(
        //   max: 1,
        //   okCall: (it) => controller.updateAvatar(it.first),
        // ),
      ),
    );
  }
}
