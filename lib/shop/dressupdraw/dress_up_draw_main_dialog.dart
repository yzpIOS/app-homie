import 'package:app/common/theme.dart';
import 'package:app/exception.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/blur_view.dart';
import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/parser.dart';
import 'package:svgaplayer_flutter/player.dart';
import 'package:svgaplayer_flutter/proto/svga.pb.dart';

class DressUpDrawMainDialog extends StatefulWidget {
  final MovieEntity svga;

  const DressUpDrawMainDialog._({required this.svga});

  static var _isOpen = false;

  static void show() async {
    if (_isOpen) return;

    MovieEntity? svga;

    try {
      _isOpen = true;

      svga = //
      await SVGAParser.shared.decodeFromAssets('assets/蛋.svga')
        ..autorelease = false;

      final dialog = DressUpDrawMainDialog._(svga: svga);

      await Get.dialog(
        dialog,
        useSafeArea: false,
        routeSettings: dialog.toRouteSettings(),
      );
    } finally {
      _isOpen = false;

      svga?.dispose();
    }
  }

  @override
  State<DressUpDrawMainDialog> createState() => _DressUpDrawMainDialogState();
}

class _DressUpDrawMainDialogState extends State<DressUpDrawMainDialog>
    with TickerProviderStateMixin {
  final countRx = RxInt(1);
  final balanceRx = RxInt(0);
  final enableRx = RxBool(true);

  late final _AnimeHelp anime;

  @override
  void initState() {
    super.initState();

    anime = _AnimeHelp(this, widget.svga);

    _doRefreshBalance();
  }

  @override
  void dispose() {
    anime.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Stack(alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: $Body());

    child = Container(
      width: 375,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(IMG.format('shop/cj_pic_bg')),
            scale: 3,
            fit: BoxFit.cover),
      ),
      child: AspectRatio(
        aspectRatio: 375 / 445,
        child: child,
      ),
    );

    child = FittedBox(fit: BoxFit.fitWidth, child: child);

    return Material(
      type: MaterialType.transparency,
      textStyle: const TextStyle(
          fontSize: 12, color: AppPalette.c9, fontWeight: fw$Medium),
      child: child,
    );
  }

  List<Positioned> $Body() {
    return [
      Positioned(
        top: 14.5,
        left: 55,
        height: 25,
        child: $BalanceView(),
      ),
      Positioned(
        top: 110,
        left: 68,
        child: Image.asset(IMG.format('activity/蛋背景'), width: 174,
            height: 174,
            scale: 3,
            fit: BoxFit.contain),
      ),
      Positioned(
        top: 309,
        left: 113,
        child: $UseBtn(),
      ),
      const Positioned(
        left: 108,
        bottom: 20,
        child: Text(
          '理性游戏， 娱乐为主，适度消费',
          style: TextStyle(fontSize: 12, color: Color(0xFFFEFEFE)),
        ),
      ),
      // ...{
      //   const Tuple2('开一次', 1): const Offset(45, 378),
      //   const Tuple2('开十次', 10): const Offset(125, 378),
      //   const Tuple2('开百次', 100): const Offset(205, 378),
      // }.entries.map((it) => Positioned(top: it.value.dy, left: it.value.dx, child: $CountBtn(it.key))),
      Positioned(
        bottom: 44,
        left: 56,
        child: $ModeView(),
      ),
      ...const {
        'draw设置': Offset(36, 14.5),
        'draw礼物': Offset(102, 14.5),
        'draw排行榜': Offset(168, 14.5),
      }.entries.map((it) =>
          Positioned(
              top: it.value.dy, right: it.value.dx, child: $IconBtn(it.key))),
      Positioned(
        top: 60,
        width: 266,
        height: 266,
        child: RepaintBoundary(
          child: SVGAImage(
            anime.ctrl,
            fit: BoxFit.cover,
            clearsAfterStop: false,
            allowDrawingOverflow: true,
          ),
        ),
      ),
    ];
  }

  Widget $BalanceView() {
    Widget child = Obx(() {
      return XText(
        '${balanceRx()}',
        overflow: TextOverflow.visible,
        style: const TextStyle(
            fontSize: 12, color: Colors.white, fontWeight: fw$Medium),
      );
    });

    child = Padding(
      padding: const Pad(left: 5, right: 5),
      child: IntrinsicWidth(
        child: Row(
          children: [
            Image.asset(
                IMG.format('shop/cj_icon_cz'), width: 21, height: 21, scale: 3),
            Expanded(
              child: Center(child: child),
            ),
            Spacing.w2,
            Image.asset(IMG.format('shop/cj_icon_jia'), width: 18,
                height: 18,
                scale: 3),
          ],
        ),
      ),
    );

    child = DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0x80BFDBFF),
        borderRadius: AppBorderRadius.max,
        border: Border.all(color: AppPalette.txtWhite, width: 0.5),
      ),
      child: child,
    );

    child = OpacityButton(
      child: child,
      onTap: () => onItemClick('购买'),
    );

    child = ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 64, maxWidth: 84 * 2),
      child: child,
    );

    return child;
  }

  Widget $IconBtn(String icon) {
    Widget child = Image.asset(
        IMG.format('shop/$icon'), width: 31, height: 29.6);

    return InkResponse(
      child: child,
      onTap: () => onItemClick(icon),
    );
  }

  Widget $UseBtn() {
    Widget child = OpacityButton(
      child: Image.asset(
        IMG.format('shop/cj_button_kq'), width: 169, height: 53.5, scale: 3,),
      onTap: () => onItemClick('使用'),
    );

    return Obx(() => IgnorePointer(ignoring: enableRx.isFalse, child: child),);
  }

  Widget $ModeView() {
    Widget child = Container(
      width: 279,
      height: 35,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0x808797AD),
        borderRadius: AppBorderRadius.max,
        border: Border.all(color: const Color(0xFFF3F9FF), width: 0.5),
      ),
      child: Padding(
        padding: const Pad(top: 0.5, horizontal: 0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            $CountBtn(const Tuple2('开一次', 1)),
            $CountBtn(const Tuple2('开十次', 10)),
            $CountBtn(const Tuple2('开百次', 100)),
          ],
        ),
      ),
    );

    return child;
  }

  Widget $CountBtn(Tuple2<String, int> data) {
    return Obx(() {
      final b = data.value2 == countRx();
      BorderRadiusGeometry? borderRadius;
      if (data.value2 == 1 && b) {
        borderRadius = const BorderRadius.only(topLeft: AppRadius.max, bottomLeft: AppRadius.max);
      } else if (data.value2 == 100 && b) {
        borderRadius = const BorderRadius.only(topRight: AppRadius.max, bottomRight: AppRadius.max);
      }

      return Expanded(
        child: OpacityButton(
          onTap: () => countRx(data.value2),
          child: Container(
            decoration: BoxDecoration(
              color: b ? const Color(0xFF5D91FF) : AppPalette.transparent,
              borderRadius: borderRadius,
            ),
            child: Center(
              child: XText(
                data.value1,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      );
    });
  }

  void _doUse(int count, {bool? b}) async {
    final isEnable = b ?? enableRx.isTrue;

    if (!isEnable) {
      assert(isEnable);

      return;
    }

    Future<dynamic> api() async {
      final dynamic resp;

      try {
        resp = await Api.Lottery.start(count);
      } catch (e) {
        if (e is LogicException) {
          switch (e.code) {
            case 22004:
              _showBalanceDialog();
              break;
            default:
              showToast(e.msg);
          }
        } else {
          showToast('服务异常');
        }

        rethrow;
      }

      return resp;
    }

    bool isAgain = false;

    try {
      enableRx(false);

      await anime.doStart(
        api,
        callback: (resp) async {
          balanceRx.value -= count;

          // final dialog = ActResultDialog(data: resp['items']);
          //
          // final again = await Get.dialog(
          //   dialog,
          //   useSafeArea: false,
          //   barrierColor: Colors.transparent,
          //   routeSettings: dialog.toRouteSettings(),
          // );
          //
          // isAgain = again == true;
          //
          // if (isAgain) post(() => _doUse(count, b: true));
        },
      );
    } finally {
      enableRx(!isAgain);
    }
  }

  void _doRefreshBalance() {
    Api.Lottery.balance().then((value) => balanceRx(value['total']));
  }

  void _showBuySheet() {
    // XBottomSheet.show(child: ActBuySheet(balanceRx), maxHeight: 360);
  }

  void _showBalanceDialog() {
    Get.simpleDialog(msg: '锤子数量不足，去购买锤子').onResult(
        okCall: _showBuySheet);
  }

  void onItemClick(String action, [args]) {
    switch (action) {
      case '购买':
        _showBuySheet();
        break;
      case '使用':
        _doUse(countRx());
        break;
      case '排行榜':
      // XBottomSheet.show(child: ActTopSheet(this), maxHeight: 360);
        break;
      case '记录':
      // XBottomSheet.show(child: ActHistorySheet(), maxHeight: 360);
        break;
      case '帮助':
      // XBottomSheet.show(child: ActHelpSheet(), maxHeight: 360);
        break;
      case '礼物':
      // XBottomSheet.show(child: ActPoolSheet(), maxHeight: 360);
        break;
      case '设置':
      // XBottomSheet.show(child: ActSettingSheet(), maxHeight: 360);
        break;
    }
  }
}

class _AnimeHelp {
  final SVGAAnimationController ctrl;

  _AnimeHelp(TickerProvider vsync, MovieEntity entity)
      : ctrl = SVGAAnimationController(vsync: vsync)
    ..videoItem = entity;

  late final frames = ctrl.frames;
  late final dur = ctrl.duration ?? const Duration(seconds: 1);
  late final step = (frames - 20) / frames;

  bool _isDispose = false;

  Future<void> doStart<T>(Future<T> Function() task,
      {required Future Function(T) callback}) async {
    bool running = true;

    final anim = Future.doWhile(
          () async {
        await ctrl
            .animateTo(step, duration: dur * step)
            .orCancel;
        await ctrl
            .reverse()
            .orCancel;

        return running;
      },
    );

    try {
      final resp = await task();
      if (_isDispose) return;

      running = false;

      await anim;
      if (_isDispose) return;

      await ctrl
          .fling()
          .orCancel
          .catchError((_) {});
      if (_isDispose) return;

      await callback(resp);
    } finally {
      if (!_isDispose) ctrl.reset();
    }
  }

  void dispose() {
    _isDispose = true;

    ctrl
      ..stop()
      ..dispose();
  }
}
