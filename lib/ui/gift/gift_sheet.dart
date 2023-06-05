import 'package:app/common/theme.dart';
import 'package:app/store/gift_ctrl.dart';
import 'package:app/store/room/my_gift_ctrl.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/gift/gift_send_logic.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GiftSheet extends StatelessWidget {
  final GiftSendLogic logic;

  GiftSheet._({required this.logic});

  final numRx = RxInt(1);

  static Future show(GiftSendLogic logic) {
    final sheet = GiftSheet._(logic: logic);

    const decor = ShapeDecoration(
      shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
      color: Color(0xCC333333),
    );

    return OrientationSheet.show(
      child: sheet,
      decoration: decor,
      direction: logic.layout.value1,
      constraints: logic.layout.value2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = <String, Widget>{
      if (logic.useMyGift != UseMyGift.only) //
        '礼物': DelayView(
          fadeIn: false,
          keepAlive: true,
          builder: (_) {
            return GetX<GiftCtrl>(
              initState: (it) => it.controller!.doRefresh(),
              builder: (it) => _DataView(data: it.autoGet(), selectRx: logic.selectRx),
            );
          },
        ),
      if (logic.useMyGift != UseMyGift.disable) //
        '背包': DelayView(
          fadeIn: false,
          keepAlive: true,
          builder: (_) {
            return GetX<MyGiftCtrl>(
              initState: (it) => it.controller!.doRefresh(),
              builder: (it) => _DataView(data: it.autoGet(), selectRx: logic.selectRx),
            );
          },
        ),
    };

    return XSnapshotWidget(
      child: DefaultTabController(
        length: data.length,
        child: Column(
          children: [
            SizedBox(height: 44, child: $TabView(data.keys)),
            SizedBox(child: logic.$MiddleView),
            Expanded(
              child: XFrameWidget(
                child: $PageView(data.values),
              ),
            ),
            Box(
              padding: Pad(bottom: AppSize.safeBottom),
              color: AppPalette.c3,
              child: $Bnb(),
            ),
          ],
        ),
      ),
    );
  }

  Widget $TabView(Iterable<String> keys) {
    return Padding(
      padding: const Pad(horizontal: 10),
      child: Row(
        children: [
          TabBar(
            isScrollable: true,
            indicator: const BoxDecoration(),
            labelPadding: const Pad(horizontal: 10),
            labelColor: AppPalette.primary,
            unselectedLabelColor: Colors.white,
            labelStyle: const TextStyle(fontSize: 16, fontWeight: fw$Medium),
            unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: fw$Regular),
            tabs: keys.map((it) => Tab(text: it, height: 32)).toList(growable: false),
          ),
          Spacing.exp,
          const CloseButton(color: Colors.white),
        ].separator(Spacing.w20).toList(growable: false),
      ),
    );
  }

  Widget $PageView(Iterable<Widget> values) {
    return GiftImgState(
      child: TabBarView(
        children: values.toList(growable: false),
      ),
    );
  }

  Widget $Bnb() {
    Widget $MoneyView() {
      Widget child = Row(
        children: [
          const MoneyIcon(type: MoneyType.diamond, size: 24),
          WalletCtrl.use(
            builder: (it) {
              return XText(
                '${it[MoneyType.diamond]}',
                style: const TextStyle(fontSize: 14, color: Colors.white),
              );
            },
          ),
        ],
      );

      child = Box(
        height: 30,
        padding: const Pad(horizontal: 10),
        child: child,
      );

      child = OpacityButton(
        onTap: () => Get.to(() => const RechargePage()),
        child: child,
      );

      return child;
    }

    Widget $BottomAction() {
      Widget $NumView() {
        const items = [1, 10, 66, 188, 520, 999, 1314];

        PopupMenuItem<int> itemBuilder(int item) {
          return PopupMenuItem(
            value: item,
            child: XText('$item'),
          );
        }

        return SizedBox(
          width: 65,
          height: 34,
          child: PopupMenuButton(
            tooltip: '赠送数量',
            onSelected: numRx,
            itemBuilder: (_) => items.map(itemBuilder).toList(growable: false),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => XText(
                    '${numRx()}',
                    style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
                  ),
                ),
                const Icon(Icons.arrow_drop_up_rounded, color: Colors.white),
              ],
            ),
          ),
        );
      }

      Widget $SendView() {
        return OpacityButton(
          onTap: doSend,
          child: const Box(
            width: 56,
            height: 34,
            color: AppPalette.primary,
            alignment: Alignment.center,
            child: XText(
              '送出',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        );
      }

      return Material(
        type: MaterialType.transparency,
        shape: const XStadiumBorder(
          side: BorderSide(color: AppPalette.primary),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [$NumView(), $SendView()],
        ),
      );
    }

    return Box(
      height: 50,
      padding: const Pad(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          $MoneyView(),
          $BottomAction(),
        ],
      ),
    );
  }

  void doSend() {
    final count = numRx();
    final data = logic.selectRx();

    if (data == null) {
      showToast('请选择礼物');

      return;
    }

    final whenErr = {
      11001: (_) {
        //TODO 判断货币

        Get.simpleDialog(msg: '余额不足', okLabel: '去充值').then((val) {
          if (val == '去充值') {
            Get.to(() => const RechargePage());
          }
        });
      },
    };

    HapticFeedback.mediumImpact();

    if (logic.isModal) {
      simpleSub(
        logic.doSend(data, count),
        whenErr: whenErr,
        callback1: (resp) => logic.onDone(data, resp),
      );
    } else {
      simpleTry<int>(
        () => logic.doSend(data, count),
        whenErr: whenErr,
        callback: (resp) => logic.onDone(data, resp),
      );
    }
  }
}

class _DataView extends StatelessWidget {
  final List data;
  final Rxn<Map> selectRx;

  const _DataView({required this.data, required this.selectRx});

  static const _ratio = 80 / 62;
  static const _fixedH = 30.0;

  static const _delegate = XGridDelegate(
    childAspectRatio: _ratio,
    crossAxisCount: 4,
    mainAxisSpacing: 5,
    crossAxisSpacing: 10,
    fixedHeight: _fixedH,
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const Pad(horizontal: 10, top: 5, bottom: 10),
      gridDelegate: _delegate,
      addRepaintBoundaries: false,
      addAutomaticKeepAlives: false,
      itemCount: data.length,
      itemBuilder: (_, i) => _ItemView(data: data[i], selectRx: selectRx),
    );
  }
}

class _ItemView extends StatelessWidget {
  final Map data;
  final Rxn<Map> selectRx;

  const _ItemView({required this.data, required this.selectRx});

  @override
  Widget build(BuildContext context) {
    const _decor = {
      false: XRectangleBorder(
        borderRadius: AppBorderRadius.a8,
      ),
      true: XRectangleBorder(
        borderRadius: AppBorderRadius.a8,
        side: BorderSide(width: 2, color: AppPalette.primary),
      ),
    };

    return OpacityButton(
      onTap: () => selectRx(data),
      child: LayoutBuilder(
        builder: (_, c) {
          final itemView = $ItemView(c.biggest);

          return Obx(
            () {
              final isSelected = selectRx() == data;
              final decor = _decor[isSelected];

              Widget child = Material(
                shape: decor,
                clipBehavior: Clip.antiAlias,
                type: MaterialType.transparency,
                textStyle: const TextStyle(fontSize: 10, color: Colors.white, height: 1),
                child: itemView,
              );

              return child;
            },
          );
        },
      ),
    );
  }

  Widget $ItemView(Size size) {
    late final count = data['backpack_count'];

    final imageW = size.width;
    final imageH = size.height - _DataView._fixedH;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: imageH,
          child: $ImageView(imageW, imageH),
        ),
        if (count is int)
          Positioned(
            right: 6,
            bottom: _DataView._fixedH + 6,
            child: XText('×$count'),
          ),
        Positioned.fill(
          top: imageH,
          left: 0,
          right: 0,
          child: $InfoView(),
        ),
      ],
    );
  }

  Widget $ImageView(double width, double height) {
    const padding = 6 * 2;

    final w = width - padding;
    final h = height - padding;

    return Center(
      child: XFrameWidget(
        width: w,
        height: h,
        child: NetImage(data['cover'], width: w, height: h),
      ),
    );
  }

  Widget $InfoView() {
    final type = MoneyType.fromVal(data['currency']);

    Widget child = XRichText(
      TextSpan(
        children: [
          if (type != null)
            WidgetSpan(
              child: MoneyIcon(type: type, size: 14),
              alignment: PlaceholderAlignment.middle,
            ),
          TextSpan(text: '${data['price']}'),
        ],
      ),
    );

    child = Column(
      children: [
        const Spacing(flex: 2),
        XText(data['name']),
        child,
        const Spacing(flex: 1),
      ],
    );

    return child;
  }
}
