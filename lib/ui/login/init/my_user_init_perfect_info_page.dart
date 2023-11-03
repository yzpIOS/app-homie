import 'package:app/common/theme.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/login/init/my_user_init_view_gender_model_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_manager/photo_manager.dart';

/// 注册成功后完善资料（头像、昵称、性别）
class MyUserInitPerfectInfoPage extends StatefulWidget {
  final String token;

  const MyUserInitPerfectInfoPage({super.key, required this.token});

  @override
  State<MyUserInitPerfectInfoPage> createState() => _MyUserInitPerfectInfoPageState();
}

class _MyUserInitPerfectInfoPageState extends State<MyUserInitPerfectInfoPage> {
  final avatarRx = Rxn<Tuple2<int, AssetEntity>>();
  final inputs = Map.fromIterable(
    const {'昵称'},
    value: (_) => TextEditingController(),
  );
  final nickNameCountRx = RxInt(0); //昵称数字
  final selectedGender = Rxn<GenderEnum>(); //性别

  @override
  void initState() {
    super.initState();

    inputs['昵称']?.addListener(() {
      nickNameCountRx.value = inputs['昵称']!.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: xAppBar(bgColor: AppPalette.appBarForegroundColorDark.withAlpha(0)),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,//是否调整大小以避免底部嵌入(防止下一步按钮上移)
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(IMG.format('login/login_pic_bg'), scale: 3, fit: BoxFit.contain),
            ),
            Positioned.fill(
              top: AppSize.safeTop + 50,
              bottom: AppSize.safeBottom + 10,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  const Text('嗨，欢迎来到HOMIE世界~', style: TextStyle(fontSize: 22, color: AppPalette.primary, fontWeight: fw$SemiBold),),
                  const Spacing(height: 10, flex: null,),
                  const Text('有头像的小伙伴容易获得关注哦~', style: TextStyle(fontSize: 14, color: AppPalette.c9, fontWeight: fw$SemiBold),),
                  const Spacing(height: 50, flex: null,),
                  $Avatar(103),
                  const Spacing(height: 30, flex: null,),
                  $NickView(),
                  const Spacing(height: 30, flex: null,),
                  $ModeView(),
                  const Spacing(height: 10, flex: null,),
                  const XText('性别选择后不能修改哦~',style: TextStyle(fontSize: 13, color: AppPalette.primary, fontWeight: fw$Regular),),
                  const Expanded(child: SizedBox()),
                  $NextView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget $Avatar(double size) {
    Widget child = Obx(() {
      final asset = avatarRx()?.value2;

      return ClipOval(
        child: asset == null //
            ? Box(
          width: size,
          height: size,
          color: const Color(0xFFEBEBFF),
          alignment: Alignment.center,
          child: Image.asset(IMG.format('login/login_icon_xiangji'), width: 23, scale: 23, fit: BoxFit.contain))
            : Image(image: asset.toProvider(), width: size, height: size, fit: BoxFit.cover),
      );
    });

    child = OpacityButton(onTap: doSelectImage, child: child);

    return child;
  }

  Widget $NickView() {
    Widget child = Container(
      height: 57,
      width: 299,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        border: Border.all(color: AppPalette.primary, width: 1),
      ),
      child: Center(
        child: XInputView(
          controller: inputs['昵称'],
          hintText: '请输入您的昵称',
          bgColor: AppPalette.transparent,
          inputFormatters: [
            //只允许输入最大文本数
            LengthLimitingTextInputFormatter(8),
          ],
          textAlign: TextAlign.center,
          onChanged: (text) {
            nickNameCountRx.value = text.length;
          },
        ),
      )
    );

    return child;
  }

  Widget $ModeView() {
    const width = 299.0;

    Widget child = Stack(
      children: [
        Obx(() {
          if (selectedGender.value == null) {
            return Spacing.blank;
          }
          return AnimatedPositioned(
            duration: kTabScrollDuration,
            curve: Curves.easeOutCubic,
            left: selectedGender.value?.code == 1 ? 0 : null,
            right: selectedGender.value?.code == 2 ? 0 : null,
            top: 0,
            bottom: 0,
            width: width / 2,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEBCFFF),
                borderRadius: selectedGender.value?.code == 1
                    ? const BorderRadius.only(
                  topLeft: Radius.circular(100.0),
                  bottomLeft: Radius.circular(100.0),
                ) : const BorderRadius.only(
                  topRight: Radius.circular(100.0),
                  bottomRight: Radius.circular(100.0),
                ),
              ),
            ),
          );
        }),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          width: width / 2,
          child: $OneGenderItemView(80, GenderEnum.male),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          width: width / 2,
          child: $OneGenderItemView(80, GenderEnum.female),
        ),
      ],
    );

    child = Container(
      width: width,
      height: 57,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppPalette.primary, width: 1),
      ),
      child: child,
    );

    return child;
  }

  Widget $OneGenderItemView(double size, GenderEnum gender) {
    return InkWell(
      onTap: () => selectedGender.value = gender,
      child: Obx(() {
        bool isSelected = (selectedGender.value == gender);

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IMG.format('login/login_gender_${gender.code}'), scale: 3, color: isSelected ? null : const Color(0xFFB3B3B7), fit: BoxFit.contain),
            const Spacing(width: 5, flex: null,),
            XText(
              '${gender.label}生',
              style: TextStyle(
                fontSize: 18,
                color: isSelected ? AppPalette.txtDark : const Color(0xFFB3B3B7),
                fontWeight: fw$Bold
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget $NextView() {
    return Box(
      width: 299,
      height: 48,
      child: Obx(() {
        bool isEnable = nickNameCountRx.value > 0 && selectedGender.value != null;
        return XTextBtn(
          color: isEnable ? AppPalette.primary : AppPalette.cc,
          shape: const XRectangleBorder(
            borderRadius: AppBorderRadius.a8,
          ),
          label: '下一步',
          textStyle: TextStyle(fontSize: 20, color: isEnable ? AppPalette.txtWhite : AppPalette.background2, fontWeight: fw$SemiBold),
          onTap: isEnable ? doSub : null,
        );
      }),
    );
  }

  /// 选择图片
  void doSelectImage() {
    imagePicker(
      max: 1,
      okCall: (it) async {
        final asset = it.first;

        simpleSub(
          Api.Common.upImage(attach: AssetImageAttach(asset: asset), need_audit: true),
          callback1: (resp) {
            Tuple4 data = (resp as Tuple4);
            //头像是否通过审核
            if (data.value4['pass_audit'] != null && data.value4['pass_audit'] == false) {
              showToast('头像涉嫌违规');
            } else {
              avatarRx(
                Tuple2(data.value1, asset),
              );
            }
          },
        );
      },
    );
  }

  void doSub() async {
    if (inputs.validate()) {
      hideKeyboard();

      // 检查昵称是否合规
      simpleSub(
        () async {
          return await Api.UserInfo.userNameCheck(user_name: inputs.by('昵称'), token: widget.token);
        },
        callback1: (resp) async {
          if (resp.containsKey('check_ok')) {
            if (resp['check_ok'] == false) {
              showToast('用户名称已存在');
            } else {
              skipToNext();
            }
          }
        },
      );
    }
  }

  void skipToNext() async {
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

    final result = await holderProgress(
      Get.to(
            () => MyUserInitViewGenderModelPage(token: widget.token, nickName: inputs.by('昵称'), gender: selectedGender.value!, avatar: avatar),
        transition: Transition.noTransition,
      )!,
    );
    if (result != null) {
      Get.back(result: result);
    }
  }
}
