import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class YoungDialog extends StatelessWidget {
  const YoungDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Widget child = Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // ...$DecoratedView(),
        Positioned.fill(top: 123, child: $Body()),
      ],
    );

    child = Container(
      width: 298,
      height: 369,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(IMG.format('青少年背景')), scale: 3),
      ),
      margin: const Pad(horizontal: 37),
      child: child,
    );

    child = FittedBox(fit: BoxFit.contain, child: child);

    return Material(
      type: MaterialType.transparency,
      textStyle: const TextStyle(fontSize: 14, color: Colors.black),
      child: child,
    );
  }

  // List<Widget> $DecoratedView() {
  //   return [
  //     const Positioned.fill(
  //       child: DecoratedBox(
  //         decoration: ShapeDecoration(shape: AppShape.a10, color: Colors.white),
  //       ),
  //     ),
  //     Positioned(
  //       top: -33,
  //       child: Image.asset(IMG.format('青少年'), width: 120, scale: 2),
  //     ),
  //   ];
  // }

  Widget $Body() {
    Widget child = OpacityButton(
      onTap: _doSub,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '查看青少年模式',
            style: TextStyle(fontSize: 14, color: AppPalette.primary),
          ),
          RightArrowIcon(color: AppPalette.primary),
        ],
      ),
    );

    child = Column(
      children: [
        const Spacing(flex: 20),
        const Text(
          '为保护青少年健康成长，HOMIE特别推出青少年模式。该模式下，部分功能使用受到限制，系统将推荐适合青少年的优质内容。点击[查看青少年模式]可了解详请。',
        ),
        const Spacing(flex: 30),
        child,
        const Spacing(flex: 25),
        Container(
          width: 213,
          height: 39.5,
          decoration: const BoxDecoration(
            borderRadius: AppBorderRadius.max,
            gradient:
              LinearGradient(
                colors: [Color(0xFFBD7CE5), Color(0xFFDDA8FF)],
              ),
            ),
          child: XTextBtn(
            color: AppPalette.transparent,
            label: '我知道了',
            textStyle: const TextStyle(fontSize: 16, fontWeight: fw$SemiBold),
            onTap: Get.back,
          ),
        ),
        const Spacing(flex: 25),
      ],
    );

    child = Box(
      padding: const Pad(horizontal: 20),
      child: child,
    );

    return child;
  }

  void _doSub() async {
    Get.back(result: await Get.to(() => const YoungPage()));
  }
}

class YoungPage extends StatelessWidget {
  const YoungPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '青少年模式'),
      body: Padding(
        padding: const Pad(horizontal: 24, top: 42),
        child: Column(
          children: [
            const Center(
              child: Text(
                '青少年模式简介',
                style: TextStyle(fontSize: 16, fontWeight: fw$Medium),
              ),
            ),
            Spacing.h20,
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        '在“青少年模式”下，我们精选了一批适合未成年人观看的优质内容，且无法在HOMIE进行充值打赏、购买兑换、动态发布等互动性操作。每日22时至次日6时将无法使用，单日累计使用时长超过40分钟，需要输入监护密码才能继续使用。',
                  ),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                    text: '时间锁：40分钟',
                    style: TextStyle(color: AppPalette.primary),
                  ),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                    text: '单日使用时长超过上述时间，需要输入密码才能继续使用',
                    style: TextStyle(color: AppPalette.c9),
                  ),
                  TextSpan(text: '\n\n'),
                  TextSpan(
                    text: '禁用时间 22:00-6:00，该时间段内无法使用HOMIE',
                    style: TextStyle(color: AppPalette.primary),
                  ),
                ],
              ),
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            Spacing.h54,
            XTextBtn(
              label: '开启青少年模式',
              width: 160,
              height: 34,
              textStyle: const TextStyle(fontSize: 16, fontWeight: fw$SemiBold),
              onTap: _doSub,
            )
          ],
        ),
      ),
    );
  }

  void _doSub() {
    Get.alertSub(
      alert: '禁止未成人使用，暂时冻结您的账号， 请联系客服',
      () async {
        await Api.UserAuth.tooYoung();

        Get.find<OAuthCtrl>().doLogout(reqApi: false);
      },
    );
  }
}
