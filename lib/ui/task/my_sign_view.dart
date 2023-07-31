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
        Positioned.fill(top: 124, child: $Body()),
      ],
    );

    child = Box(
      width: 375,
      padding: const Pad(horizontal: 20),
      child: AspectRatio(
        aspectRatio: 335 / 494,
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
    const bgView = Positioned.fill(
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: AppShape.a20,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, -0.2),
            colors: [Color(0xFFD5C3F7), Colors.white],
          ),
        ),
      ),
    );

    final title1View = Positioned(
      top: 32,
      width: 93,
      height: 64,
      child: Image.asset(IMG.format('task/装饰_2'), scale: 3),
    );

    final title2View = Positioned(
      top: 82,
      width: 133,
      height: 30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(IMG.format('task/装饰_3'), scale: 3),
          const Padding(
            padding: Pad(bottom: 8),
            child: XText(
              '每日签到',
              style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
            ),
          ),
        ],
      ),
    );

    final image = Image.asset(IMG.format('task/装饰_1'), width: 44, scale: 3);

    return [
      bgView,
      Positioned(top: -20, left: 55, child: image),
      Positioned(top: -20, right: 55, child: image),
      title1View,
      title2View,
    ];
  }

  Widget $Body() {
    Widget child = const XText('签到越多奖励越多~');

    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        XRichText(
          TextSpan(
            text: '已累计签到 ',
            children: [
              TextSpan(
                text: '$total天',
                style: const TextStyle(color: AppPalette.primary),
              ),
            ],
          ),
        ),
        child,
      ],
    );

    child = Box(
      padding: const Pad(horizontal: 10),
      child: Column(
        children: [
          Box(
            height: 17,
            alignment: Alignment.centerLeft,
            child: child,
          ),
          const Spacing(flex: 10),
          $TaskView(weekday),
          const Spacing(flex: 20),
          if (isEnable)
            XTextBtn(
              label: '立即签到',
              width: 235,
              height: 40,
              textStyle: const TextStyle(fontSize: 16, fontWeight: fw$SemiBold),
              onTap: _doSign,
            )
          else
            XTextBtn(
              label: '已签到',
              width: 235,
              height: 40,
              color: AppPalette.cc,
              textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$SemiBold),
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
      rowGap: 10,
      columnGap: 10,
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
        ...$AwardView(),
        if (isFinish) ...[
          const Positioned.fill(child: Box(color: Color(0x4DCCCCCC))),
          Positioned(
            width: 26,
            height: 26,
            child: Image.asset(IMG.format('task/已签到'), scale: 3),
          ),
        ]
      ],
    );

    child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: Color(0xFFF1A43A), fontWeight: fw$Medium),
      child: child,
    );

    child = _ItemDecor(
      hasBorder: isToday && !isFinish,
      child: child,
    );

    return child;
  }

  Iterable<Positioned> $AwardView() {
    const double size = 40;

    late final Map? obj = data['obj'];

    final (title, icon) = switch (data['type']) {
      //金币
      1 => (
          MoneyType.gold.label,
          const MoneyIcon(type: MoneyType.gold, size: size),
        ),
      //钻石
      2 => (
          MoneyType.diamond.label,
          const MoneyIcon(type: MoneyType.diamond, size: size),
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
      Positioned(top: 28, width: size, height: size, child: icon),
      Positioned(
        bottom: 5,
        child: XText('${title}x${data['number']}'),
      ),
    ];
  }
}

class _ItemDecor extends StatelessWidget {
  final Widget child;
  final bool hasBorder;

  const _ItemDecor({required this.child, this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    final decor = BoxDecoration(
      color: Colors.white,
      borderRadius: AppBorderRadius.a10,
      border: hasBorder
          ? Border.all(
              width: 2,
              color: AppPalette.primary,
              strokeAlign: BorderSide.strokeAlignCenter,
            )
          : null,
      boxShadow: const [
        BoxShadow(
          color: Color(0x29000000),
          blurRadius: 6,
          spreadRadius: 1,
          offset: Offset(0, 3),
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
                  XText(
                    '累计签到${item['day_num']}天可领取',
                    style: const TextStyle(fontSize: 14, color: Color(0xFFF1A43A)),
                  ).applyConstraint(
                    centerLeftTo: parent.leftMargin(16),
                  ),
                  $ImageView(
                    60,
                    item,
                  ).applyConstraint(
                    id: ConstraintId('img'),
                    width: 60,
                    height: 60,
                    centerTo: parent.leftMargin(20),
                  ),
                  Text(
                    'x${item['number']}',
                    style: const TextStyle(fontSize: 14, color: Color(0xFFF1A43A)),
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
                    centerRightTo: parent.rightMargin(16),
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
      label: '领取',
      width: 50,
      height: AppSize.btnTiny,
      color: color,
      textStyle: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: fw$Medium),
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
