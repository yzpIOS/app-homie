import 'package:app/common/theme.dart';
import 'package:app/exception.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SignDialog extends StatelessWidget {
  final List data;
  final RxList data2;
  final int total;
  final int weekday;
  final bool isEnable;

  const SignDialog._({
    required this.weekday,
    required this.isEnable,
    required this.data,
    required this.data2,
    required this.total,
  });

  static Future<void> show({required bool isManual}) async {
    try {
      final isModal = isManual;
      final api = Future.wait([Api.Activity.list(), Api.Activity.myList()]);

      if (isModal) {
        await showProgress(api);
      }

      final resp = await api;

      final data = resp[0]?['list'];

      final total = resp[1]?['day_num'] ?? 0;
      final data2 = resp[1]?['list'] ?? [];

      if ((data is! List || data.isEmpty) || (total is! int) || (data2 is! List)) {
        return;
      }

      final weekday = DateTime.now().weekday;
      final isEnable = data.firstWhereOrNull((it) => it['week'] == weekday)?['status'] == 2;

      if (isManual || isEnable) {
        await Get.dialog(
          SignDialog._(weekday: weekday, isEnable: isEnable, data: data, data2: RxList(data2), total: total),
        );
      }
    } on LogicException catch (e, s) {
      errLog(e, s);

      showToast(e.msg);
    } catch (e, s) {
      errLog(e, s);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        ...$DecoratedView(),
        Positioned.fill(top: 205, child: $Body()),
      ],
    );

    child = Box(
      width: 375,
      padding: const Pad(bottom: 30, horizontal: 10),
      child: AspectRatio(
        aspectRatio: 345 / 546,
        child: child,
      ),
    );

    child = FittedBox(fit: BoxFit.fitWidth, child: child);

    return Material(
      type: MaterialType.transparency,
      textStyle: const TextStyle(fontSize: 12, color: AppPalette.c9, fontWeight: fw$Medium),
      child: child,
    );
  }

  List<Widget> $DecoratedView() {
    Widget bgView = Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(IMG.format('task/qd_pic_bg')), scale: 3, fit: BoxFit.cover),
        ),
      ),
    );

    const title1View = Positioned(
      top: 117,
      // width: 133,
      // height: 30,
      child: XText(
        '每日签到',
        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: fw$SemiBold),
      ),
    );

    Widget title2View = Positioned(
      top: 150,
      child: Container(
        height: 18,
        padding: const Pad(horizontal: 10),
        decoration: const BoxDecoration(color: Color(0xFFEBEBFF), borderRadius: AppBorderRadius.max),
        child: XRichText(
          TextSpan(
            text: '已累计签到: ',
            children: [
              TextSpan(
                text: '$total天',
                style: const TextStyle(color: AppPalette.primary),
              ),
            ],
          ),
          style: const TextStyle(fontSize: 12, color: Color(0xFF878585), fontWeight: fw$Regular),
        ),
      ),
    );

    return [
      bgView,
      title1View,
      title2View,
    ];
  }

  Widget $Body() {
    Widget child = Box(
      padding: const Pad(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const Pad(left: 5),
            child: $TaskView(weekday),
          ),
          const Spacing(flex: 20),
          if (isEnable)
            XTextBtn(
              label: '签 到',
              width: 235,
              height: 40,
              textStyle: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: fw$SemiBold),
              onTap: _doSign,
            )
          else
            XTextBtn(
              label: '已签到',
              width: 235,
              height: 40,
              color: AppPalette.cc,
              textStyle: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: fw$SemiBold),
            ),
          const Spacing(flex: 20),
        ],
      ),
    );

    return child;
  }

  Widget $TaskView(int weekday) {
    const areas = //
        '''
        1 2 3 4
        5 6 7 7
        x x x x
        ''';

    return LayoutGrid(
      areas: areas,
      rowGap: 12,
      columnGap: 12,
      rowSizes: [90.px, 90.px, 73.px],
      columnSizes: const [auto, auto, auto, auto],
      children: [
        ...data.map(
          (it) {
            final int week = it['week'];

            final child = _ItemView(
              data: it,
              day: week,
              isToday: week == weekday,
            );

            return child.inGridArea('$week');
          },
        ),
        _DayTotalView(data2).inGridArea('x'),
      ],
    );
  }

  void _doSign() {
    simpleSub(
      Api.Activity.sign(),
      msg: '签到成功',
      callback1: (resp) => Get.back(result: resp),
    );
  }
}

class _ItemView extends StatelessWidget {
  final Map data;
  final int day;
  final bool isToday;

  _ItemView({required this.data, required this.day, required this.isToday}) : super(key: ValueKey(day));

  @override
  Widget build(BuildContext context) {
    final isFinish = data['status'] == 1;

    Widget child = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XText(
          '$day',
          style: const TextStyle(fontSize: 22),
        ),
        const Padding(
          padding: Pad(left: 1, top: 4),
          child: XText(
            'DAY',
            style: TextStyle(fontSize: 12, fontWeight: fw$Regular),
          ),
        ),
      ],
    );

    child = Stack(
      alignment: Alignment.center,
      children: [
        Positioned(top: 5, left: 5, child: child),
        ...$AwardView(day),
        if (isFinish) ...[
          Positioned(
            width: 26,
            height: 26,
            child: Image.asset(IMG.format('task/已签到'), scale: 3),
          ),
        ]
      ],
    );

    child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 10, color: AppPalette.primary, fontWeight: fw$Medium),
      child: child,
    );

    child = _ItemDecor(
      hasBorder: isToday && !isFinish,
      isFinish: isFinish,
      child: child,
    );

    return child;
  }

  Iterable<Positioned> $AwardView(int day) {
    double size = (day == 7) ? 50 : 40;
    double iconTop = (day == 7) ? 18 : 28;
    double? textRight = (day == 7) ? 10 : null;

    late final Map? obj = data['obj'];

    final (title, icon) = switch (data['type']) {
      //金币
      1 => (
          MoneyType.gold.label,
          MoneyIcon(type: MoneyType.gold, size: size),
        ),
      //钻石
      2 => (
          MoneyType.diamond.label,
          MoneyIcon(type: MoneyType.diamond, size: size),
        ),
      //商品
      3 ||
      //礼物
      4 ||
      _ =>
        (
          obj?['name'] ?? '',
          GiftImgState(
            child: NetImage(obj?['img_url'], width: size, height: size),
          ),
        ),
    };

    return [
      Positioned(top: iconTop, width: size, height: size, child: icon),
      Positioned(
        bottom: 7,
        right: textRight,
        child: XText('${title}X${data['number']}'),
      ),
    ];
  }
}

class _ItemDecor extends StatelessWidget {
  final Widget child;
  final bool hasBorder;
  final bool isFinish;

  const _ItemDecor({required this.child, this.hasBorder = false, this.isFinish = false});

  @override
  Widget build(BuildContext context) {
    final decor = BoxDecoration(
      color: isFinish ? const Color(0xFFCFBCEB) : const Color(0xFFEBEBFF),
      borderRadius: AppBorderRadius.a10,
      border: hasBorder
          ? Border.all(
              width: 2,
              color: AppPalette.primary,
              strokeAlign: BorderSide.strokeAlignCenter,
            )
          : null,
      boxShadow: [
        BoxShadow(
          color: AppPalette.primary.withAlpha(80),
          blurRadius: 5,
          spreadRadius: 0,
          offset: const Offset(0, 3),
        ),
      ],
    );

    return DecoratedBox(decoration: decor, child: child);
  }
}

class _DayTotalView extends StatelessWidget {
  final RxList dataRx;

  const _DayTotalView(this.dataRx);

  @override
  Widget build(BuildContext context) {
    Widget $ImageView(double size, Map data) {
      switch (data['type']) {
        case 1: //金币
          return Padding(
            padding: const Pad(all: 6),
            child: MoneyIcon(type: MoneyType.gold, size: size),
          );
        case 2: //钻石
          return Padding(
            padding: const Pad(all: 6),
            child: MoneyIcon(type: MoneyType.diamond, size: size),
          );
        case 3: //礼物
        case 4: //商品
        default:
          final obj = data['obj'];

          return GiftImgState(
            child: NetImage(obj?['img_url'], width: size, height: size),
          );
      }
    }

    Widget child = Obx(
      () {
        final item = dataRx().let((it) {
          return it.firstWhereOrNull((it) => it['status'] == 2) ?? it.firstWhereOrNull((it) => it['status'] == 0);
        });

        return item is Map
            ? ConstraintLayout(
                children: [
                  XRichText(
                    TextSpan(
                      children: [
                        const TextSpan(text: '累计签到'),
                        TextSpan(
                          text: '${item['day_num']}天',
                          style: const TextStyle(color: AppPalette.primary),
                        ),
                        const TextSpan(text: '可领取'),
                      ],
                    ),
                    style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: fw$Medium),
                  ).applyConstraint(
                    centerLeftTo: parent.leftMargin(12),
                  ),
                  $ImageView(
                    60,
                    item,
                  ).applyConstraint(
                    id: ConstraintId('img'),
                    width: 60,
                    height: 60,
                    centerTo: parent.leftMargin(45),
                  ),
                  Text(
                    'X${item['number']}',
                    style: const TextStyle(fontSize: 15, color: Color(0xFFFF0024)),
                  ).applyConstraint(
                    centerVerticalTo: parent,
                    left: ConstraintId('img').right,
                  ),
                  SizedBox(
                    child: item['status'] == 2
                        ? $Btn(color: AppPalette.primary, onTap: () => _doGet(item))
                        : $Btn(color: AppPalette.cc),
                  ).applyConstraint(
                    id: ConstraintId('btn'),
                    centerRightTo: parent.rightMargin(12),
                  ),
                ],
              )
            : Spacing.blank;
      },
    );

    return _ItemDecor(
      child: child,
    );
  }

  Widget $Btn({required Color color, VoidCallback? onTap}) {
    return XTextBtn(
      label: '领 取',
      width: 55.5,
      height: AppSize.btnTiny,
      color: color,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
      onTap: onTap,
    );
  }

  void _doGet(Map item) {
    simpleSub(
      Api.Activity.accSign(item['acc_daily_sign_id']),
      callback: () {
        dataRx.remove(item);
      },
    );
  }
}
