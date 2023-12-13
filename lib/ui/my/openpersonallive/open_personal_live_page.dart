import 'package:app/common/theme.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/store/config_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class OpenPersonalLivePage extends StatefulWidget {
  const OpenPersonalLivePage({super.key});

  @override
  State<OpenPersonalLivePage> createState() => _OpenPersonalLivePageState();
}

class _OpenPersonalLivePageState extends State<OpenPersonalLivePage> {
  final imageRx = Rxn<String>();//直播头像
  final freeMicRx = RxBool(false);//是否自由麦
  final pactRx = RxBool(false);//是否选中直播规范
  final inputs = Map.fromIterable(
    const {'房间名称', '房间公告',},
    value: (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '开直播',),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                padding: const Pad(horizontal: 20,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    $LiveCover(),
                    ...$InputView(title: inputs.keys.first, multiline: false),
                    ...$InputView(title: inputs.keys.last, multiline: true),
                    ...$MoreView(),
                  ],
                )
            ),
          ),
          $BottomActionView(),
        ],
      ),
    );
  }

  Widget $LiveCover() {
    const double size = 85;

    Widget child = Obx(() {
      String? image = imageRx();

      if (image != null && image.isNotEmpty) {
        return NetImage(image, fit: BoxFit.cover);
      }

      return Column(
        children: [
          Expanded(
            child: Image.asset(
              IMG.format('my/rb_icon_jia'), width: 27, height: 27, scale: 3,),
          ),
          Container(
            width: double.infinity,
            height: 19,
            color: const Color(0xFF282828).withAlpha(80),
            child: const XText(
              '添加头像',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12,
                  color: AppPalette.txtDark,
                  fontWeight: fw$Regular),
            ),
          )
        ],
      );
    });

    child = Center(
      child: Container(
        width: size,
        height: size,
        margin: const Pad(top: 21),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const ShapeDecoration(
          color: AppPalette.background2,
          shape: XRectangleBorder(
            borderRadius: AppBorderRadius.a10,
            side: BorderSide(width: 0.5, color: Color(0xFFDFDFDF),),
          ),
        ),
        child: child,
      ),
    );

    child = OpacityButton(
      child: child,
      onTap: () {
        imagePicker(
          max: 1,
          okCall: (it) async {
            simpleSub(
                  () async {
                final asset = it.first;

                final originFile = await asset.originFile;
                final upFile = await ImageHelp.clip(originFile!, size: asset.size);

                return await Api.Common.upImage(
                  attach: FileImageAttach(asset: upFile),
                );
              },
              callback1: (resp) => imageRx((resp as Tuple4).value2),
            );
          },
        );
      },
    );

    return child;
  }

  InputDecoration $InputDecor(String hint, {bool multiline = false}) {
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: AppBorderRadius.a6,
    );

    return InputDecoration(
      hintText: '请输入$hint',
      hintStyle: const TextStyle(fontSize: 12, color: AppPalette.colorA9,),
      filled: true,
      fillColor: AppPalette.colorEB,
      contentPadding: multiline ? const Pad(all: 10) : const Pad(horizontal: 10),
      border: inputBorder,
    );
  }

  Iterable<Widget> $InputView({required String title, bool multiline = false}) {
    final int lines = multiline ? 5 : 1;
    final double top = multiline ? 20 : 39;

    return [
      Padding(
        padding: Pad(top: top, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: XText(
                title,
                style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: fw$Medium),
              ),
            ),
            if (multiline)
              const XRichText(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '0/',
                      style: TextStyle(color: AppPalette.colorA9),
                    ),
                    TextSpan(text: '150',),
                  ],
                  style: TextStyle(
                      fontSize: 12, color: AppPalette.txtDark, fontWeight: fw$Regular),
                ),
              ),
          ],
        ),
      ),
      TextField(
        controller: inputs[title],
        maxLines: lines,
        minLines: lines,
        style: const TextStyle(fontSize: 14),
        decoration: $InputDecor(title, multiline: multiline),
      ),
    ];
  }

  Iterable<Widget> $MoreView() {
    return [
      OpacityButton(
        child: Container(
          margin: const Pad(top: 20),
          height: 44,
          child: const Row(
            children: [
              Expanded(
                child: XText(
                  '场景',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: fw$Medium),
                ),
              ),
              XRichText(
                TextSpan(
                  children: [
                    TextSpan(text: '沙滩',),
                    WidgetSpan(child: RightArrowIcon(color: AppPalette.primary,), alignment: PlaceholderAlignment.middle,),
                  ],
                  style: TextStyle(fontSize: 15, color: AppPalette.primary, fontWeight: fw$Medium),
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
      const Divider(height: 1, color: Color(0xFFE3E7ED),),
      OpacityButton(
        child: SizedBox(
          height: 44,
          child: Row(
            children: [
              const Expanded(
                child: XText(
                  '自由麦',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: fw$Medium),
                ),
              ),
              Obx(() => Image.asset(IMG.format(freeMicRx() ? 'my/rb_icon_kai' : 'my/rb_icon_guan'), width: 49.5, height: 26,),),
            ],
          ),
        ),
        onTap: () => freeMicRx.toggle(),
      ),
      const Divider(height: 1, color: Color(0xFFE3E7ED),),
    ];
  }

  Widget $BottomActionView() {
    Widget child = Column(
      children: [
        $PactTxt(),
        Spacing.h10,
        XTextBtn(
          height: 42,
          label: '开始直播',
          shape: AppShape.a4,
          textStyle: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: fw$Medium),
          onTap: doStartLive,
        ),
        Spacing.h10,
        const XText(
          '需要完成主播人脸识别',
          style: TextStyle(fontSize: 12, color: AppPalette.colorA9, fontWeight: fw$Regular),
        ),
      ],
    );

    child = Padding(
      padding: Pad(horizontal: 35, bottom: AppSize.safeBottom + 11),
      child: child,
    );

    return child;
  }

  Widget $PactTxt() {
    return GetBuilder<ConfigCtrl>(
      initState: (state) => state.controller?.doRefresh(),
      builder: (ctrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return OpacityButton(
                child: Image.asset(IMG.format(pactRx.value ? 'shop/协议选中' : 'shop/协议未选中'),
                    width: 13, height: 13, scale: 3, fit: BoxFit.contain),
                onTap: () {
                  pactRx.toggle();
                },
              );
            }),
            Spacing.w4,
            StyledText(
              text: '我已阅读并同意<c>《<a1>直播规范</a1>》</c>',
              tags: {
                'c': StyledTextTag(style: const TextStyle(color: AppPalette.primary)),
                'a1': StyledTextActionTag((val, __) => ctrl.onTapLink(val!, 'recharge_agreement')),
              },
              style: const TextStyle(fontSize: 12, color: AppPalette.colorA9),
            ),
          ],
        );
      },
    );
  }

  void doStartLive() {

  }
}
