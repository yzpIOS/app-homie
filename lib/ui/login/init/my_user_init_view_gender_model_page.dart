import 'package:app/common/theme.dart';
import 'package:app/model/enum/gender_enum.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/unity_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 填好资料后查看对应性别人物模型
class MyUserInitViewGenderModelPage extends StatefulWidget {
  final String token;
  final String nickName;
  final GenderEnum gender;
  final int? avatar;

  const MyUserInitViewGenderModelPage({super.key, required this.token, required this.nickName, required this.gender, this.avatar});

  @override
  State<MyUserInitViewGenderModelPage> createState() => _MyUserInitViewGenderModelPageState();
}

class _MyUserInitViewGenderModelPageState extends State<MyUserInitViewGenderModelPage> {
  bool unityLoadComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(bgColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: $BodyView(),
    );
  }

  Widget $BodyView() {
    return Stack(
      children: [
        UnityView(
          uniqueKey: 'SelectScene',
          gestureRecognizers: {
            Factory<HorizontalDragGestureRecognizer>(() => HorizontalDragGestureRecognizer()),
          },
          onInit: (_, loader, __) => loader('SelectScene', doOnAfter: () {
            unityLoadComplete = true;
            setState(() { });
          }),
        ),
        if (unityLoadComplete)
          Positioned(
            left: 48,
            right: 48,
            bottom: AppSize.safeBottom + 36,
            child: Column(
              children: [
                const XText('性别选择后不能修改',style: TextStyle(fontSize: 12, color: AppPalette.primary, fontWeight: fw$Regular),),
                const Spacing(height: 10, flex: null,),
                XTextBtn(
                  label: '进入Homie',
                  textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$SemiBold),
                  onTap: doSub,
                ),
              ],
            ),
          ),
      ],
    );
  }

  /// 进入app
  void doSub() async {
    simpleSub(
      () async {
        await Api.UserInfo.setInfo(nickName: widget.nickName, gender: widget.gender, avatar: widget.avatar, token: widget.token);
        Map info = await Api.UserInfo.myInfo(token: widget.token);

        await KvBox.remove(PrefKey.OpenInstallBlindData);
        return info;
      },
      callback1: (resp) async {
        return Get.back(result: resp);
      },
    );
  }
}
