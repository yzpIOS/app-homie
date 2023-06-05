import 'package:app/common/theme.dart';
import 'package:app/exception.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/activity/act_buy_sheet.dart';
import 'package:app/ui/activity/act_help_sheet.dart';
import 'package:app/ui/activity/act_history_sheet.dart';
import 'package:app/ui/activity/act_pool_sheet.dart';
import 'package:app/ui/activity/act_result_dialog.dart';
import 'package:app/ui/activity/act_setting_sheet.dart';
import 'package:app/ui/activity/act_top_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

class ActMainDialog extends StatefulWidget {
  final MovieEntity svga;

  const ActMainDialog._({required this.svga});

  static var _isOpen = false;

  static void show() async {
    if (_isOpen) return;

    MovieEntity? svga;

    try {
      _isOpen = true;

      svga = //
          await SVGAParser.shared.decodeFromAssets('assets/蛋.svga')
            ..autorelease = false;

      final dialog = ActMainDialog._(svga: svga);

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
  State<ActMainDialog> createState() => _ActMainDialogState();
}

class _ActMainDialogState extends State<ActMainDialog> with TickerProviderStateMixin {
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
    Widget child = Stack(alignment: Alignment.center, clipBehavior: Clip.none, children: $Body());

    child = Material(
      color: const Color(0xFFE6BFFF),
      shape: const XRectangleBorder(
        borderRadius: AppBorderRadius.a14,
        side: BorderSide(width: 2, color: Color(0xFFF7E9FF), strokeAlign: BorderSide.strokeAlignInside),
      ),
      child: child,
    );

    child = Container(
      width: 310,
      height: 453,
      margin: const Pad(horizontal: 20),
      child: child,
    );

    child = FittedBox(
      fit: BoxFit.contain,
      alignment: const FractionalOffset(0.5, (154 + 453 / 2) / 812),
      child: child,
    );

    return child;
  }

  List<Positioned> $Body() {
    return [
      Positioned(
        top: 20,
        left: 20,
        height: 30,
        child: $BalanceView(),
      ),
      Positioned(
        top: 110,
        left: 68,
        child: Image.asset(IMG.$('activity/蛋背景'), width: 174, height: 174, scale: 3, fit: BoxFit.contain),
      ),
      Positioned(
        top: 336,
        left: 45,
        width: 220,
        height: 32,
        child: $UseBtn(),
      ),
      const Positioned(
        bottom: 20,
        child: Text(
          '理性游戏，娱乐为主，适度消费',
          style: TextStyle(fontSize: 12, color: Color(0xFFF7E9FF)),
        ),
      ),
      ...{
        const Tuple2('开一次', 1): const Offset(45, 378),
        const Tuple2('开十次', 10): const Offset(125, 378),
        const Tuple2('开百次', 100): const Offset(205, 378),
      }.entries.map((it) => Positioned(top: it.value.dy, left: it.value.dx, child: $CountBtn(it.key))),
      ...const {
        '排行榜': Offset(20, 70),
        '记录': Offset(20, 118),
        '帮助': Offset(262, 22),
        '礼物': Offset(262, 70),
        '设置': Offset(262, 118),
      }.entries.map((it) => Positioned(top: it.value.dy, left: it.value.dx, child: $IconBtn(it.key))),
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
        style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
      );
    });

    child = Padding(
      padding: const Pad(left: 7, right: 5),
      child: IntrinsicWidth(
        child: Row(
          children: [
            Image.asset(IMG.$('activity/锤子'), width: 24, height: 24, scale: 3),
            Expanded(
              child: Center(child: child),
            ),
            Spacing.w2,
            SvgView(SVG.$('activity/加')),
          ],
        ),
      ),
    );

    child = DecoratedBox(
      decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0x80FFFFFF)),
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
    Widget child = SvgView(SVG.$('activity/$icon'), width: 28, height: 28);

    return InkResponse(
      child: child,
      onTap: () => onItemClick(icon),
    );
  }

  Widget $CountBtn(Tuple2<String, int> data) {
    return Obx(() {
      final b = data.value2 == countRx();

      return XTextBtn(
        key: ValueKey(data.value1),
        label: data.value1,
        width: 60,
        height: 28,
        color: b ? AppPalette.primary : Colors.white,
        textStyle: TextStyle(fontSize: 14, color: b ? Colors.white : AppPalette.primary),
        onTap: () => countRx(data.value2),
      );
    });
  }

  Widget $UseBtn() {
    Widget child = const Text(
      '马上开启',
      style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
    );

    child = Container(
      decoration: const ShapeDecoration(
        shape: XStadiumBorder(),
        gradient: LinearGradient(
          colors: [Color(0xFFFFD064), Color(0xFFFFA779)],
        ),
      ),
      alignment: Alignment.center,
      child: child,
    );

    child = OpacityButton(
      child: child,
      onTap: () => onItemClick('使用'),
    );

    return Obx(
      () => IgnorePointer(ignoring: enableRx.isFalse, child: child),
    );
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

          final dialog = ActResultDialog(data: resp['items']);

          final again = await Get.dialog(
            dialog,
            useSafeArea: false,
            barrierColor: Colors.transparent,
            routeSettings: dialog.toRouteSettings(),
          );

          isAgain = again == true;

          if (isAgain) post(() => _doUse(count, b: true));
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
    XBottomSheet.show(child: ActBuySheet(balanceRx), maxHeight: 360);
  }

  void _showBalanceDialog() {
    Get.simpleDialog(msg: '锤子数量不足，去购买锤子').onResult(okCall: _showBuySheet);
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
        XBottomSheet.show(child: ActTopSheet(this), maxHeight: 360);
        break;
      case '记录':
        XBottomSheet.show(child: ActHistorySheet(), maxHeight: 360);
        break;
      case '帮助':
        XBottomSheet.show(child: ActHelpSheet(), maxHeight: 360);
        break;
      case '礼物':
        XBottomSheet.show(child: ActPoolSheet(), maxHeight: 360);
        break;
      case '设置':
        XBottomSheet.show(child: ActSettingSheet(), maxHeight: 360);
        break;
    }
  }
}

class _AnimeHelp {
  final SVGAAnimationController ctrl;

  _AnimeHelp(TickerProvider vsync, MovieEntity entity)
      : ctrl = SVGAAnimationController(vsync: vsync)..videoItem = entity;

  late final frames = ctrl.frames;
  late final dur = ctrl.duration ?? const Duration(seconds: 1);
  late final step = (frames - 20) / frames;

  bool _isDispose = false;

  Future<void> doStart<T>(Future<T> Function() task, {required Future Function(T) callback}) async {
    bool running = true;

    final anim = Future.doWhile(
      () async {
        await ctrl.animateTo(step, duration: dur * step).orCancel;
        await ctrl.reverse().orCancel;

        return running;
      },
    );

    try {
      final resp = await task();
      if (_isDispose) return;

      running = false;

      await anim;
      if (_isDispose) return;

      await ctrl.fling().orCancel.catchError((_) {});
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
