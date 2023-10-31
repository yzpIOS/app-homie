import 'package:app/common/theme.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/login/init/my_user_init_view_gender_model_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
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
      child: UiOverlayRegion.dark(
        child: Scaffold(
          resizeToAvoidBottomInset: false,//是否调整大小以避免底部嵌入(防止下一步按钮上移)
          body: Container(
            padding: Pad(top: AppSize.safeTop + 50, bottom: AppSize.safeBottom + 36),
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text('嗨，欢迎来到Homie世界', style: TextStyle(fontSize: 20, color: AppPalette.primary, fontWeight: fw$SemiBold),),
                const Spacing(height: 50, flex: null,),
                $Avatar(80),
                $NickView(),
                Expanded(child: $GenderView(),),
                $NextView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget $Avatar(double size) {
    Widget child = Obx(() {
      final asset = avatarRx()?.value2;
      return Box(
        width: size,
        height: size,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned.fill(child: asset == null ? Image.asset(IMG.format('login/default_avatar'), scale: 3)
                : ClipOval(child: Image(image: asset.toProvider(), width: size, height: size, fit: BoxFit.cover))),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                  IMG.format('login/login_small_camera'), width: 24,
                  height: 24,
                  scale: 3),
            ),
          ],
        ),
      );
    });

    child = OpacityButton(onTap: doSelectImage, child: child);

    return child;
  }

  Widget $NickView() {
    Widget child = Box(
      // height: 120,
      padding: const Pad(horizontal: 20, top: 40),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(child: XText('请输入您的昵称', style: TextStyle(
                fontSize: 16,
                color: AppPalette.txtDark,
                fontWeight: fw$Regular),)),
              Obx(() =>
                  XText('${nickNameCountRx.value}/8', style: const TextStyle(
                    fontSize: 14,
                    color: AppPalette.c9,
                    fontWeight: fw$Regular),)),
            ],
          ),
          const Spacing(height: 5, flex: null,),
          FormInputView(
            controller: inputs['昵称'],
            hint: '昵称',
            borderRadius: AppBorderRadius.a4,
            maxLength: 8,
            onChanged: (text) {
              nickNameCountRx.value = text.length;
            },
          ),
        ],
      ),
    );

    return child;
  }

  Widget $GenderView() {
    Widget child = Box(
      padding: const Pad(horizontal: 20, top: 29),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const XText('请选择您的性别', style: TextStyle(fontSize: 16, color: AppPalette.txtDark, fontWeight: fw$Regular),),
          const Spacing(height: 20, flex: null,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              $OneGenderItemView(80, GenderEnum.male),
              $OneGenderItemView(80, GenderEnum.female),
            ],
          )
        ],
      ),
    );

    return child;
  }

  Widget $OneGenderItemView(double size, GenderEnum gender) {
    return Column(
      children: [
        ClipOval(
            child: InkWell(
              splashColor: Theme.of(context).canvasColor,
              child: Obx(() {
                return Box(
                  alignment: Alignment.center,
                  width: size,
                  height: size,
                  color: selectedGender.value == gender ? (gender.code == 1 ? const Color(0x4D6A83FF) : const Color(0x4DFF6594))
                      : const Color(0xFFF5F5F5),
                  child: SvgView(SVG.$('common/性别_${gender.code}'), width: 52, height: 52),
                );
              }),
              onTap: () => selectedGender.value = gender,
            )
        ),
        const Spacing(height: 10, flex: null,),
        XText('${gender.label}生', style: const TextStyle(
            fontSize: 14, color: AppPalette.txtDark, fontWeight: fw$Regular),),
      ],
    );
  }

  Widget $NextView() {
    return Box(
      padding: const Pad(horizontal: 48),
      child: Obx(() {
        bool isEnable = nickNameCountRx.value > 0 && selectedGender.value != null;
        return XTextBtn(
          color: isEnable ? AppPalette.primary : AppPalette.cc,
          label: '下一步',
          textStyle: TextStyle(
              fontSize: 16, color: isEnable ? AppPalette.txtWhite : AppPalette.background2, fontWeight: fw$SemiBold),
          onTap: doSub,
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
