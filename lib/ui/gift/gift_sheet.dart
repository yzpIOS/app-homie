import 'package:app/common/theme.dart';
import 'package:app/common/utils/en.dart';
import 'package:app/store/gift_ctrl.dart';
import 'package:app/store/room/my_gift_ctrl.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/gift/gift_blind_box_details_sheet.dart';
import 'package:app/ui/gift/gift_send_logic.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GiftSheet extends StatelessWidget {
  static bool isPopUp = false;

  final GiftSendLogic logic;

  final bool hasShowUnityView;

  GiftSheet._({required this.logic, required this.hasShowUnityView});

  final numRx = RxInt(1);

  static Future show(GiftSendLogic logic, {bool hasShowUnityView = false}) {
    if(isPopUp) {
      return Future.value(null);
    }
    // 配置请求礼物列表类型 true房间礼物列表  false普通礼物列表
    Get.find<GiftCtrl>().hasShowUnityView = hasShowUnityView;

    final sheet = GiftSheet._(logic: logic, hasShowUnityView: hasShowUnityView);

    // 刷新金币
    WalletCtrl.ins.doRefresh();

    isPopUp = true;
    Future.delayed(Duration(seconds: 2)).then((value) {
      isPopUp = false;
    });

    return OrientationSheet.show(
      child: WillPopScope(
        child: sheet,
        onWillPop:() {
          isPopUp = false;
          debugPrint("debug ...");
          return Future.value(true);
        }
      ),
      decoration: null,
      direction: logic.layout.value1,
      constraints: logic.layout.value2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = <String, Widget>{
      if (logic.useMyGift != UseMyGift.only) //
        '礼物'.en(): DelayView(
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
        '背包'.en(): DelayView(
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

    Widget child = XSnapshotWidget(
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

    child = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Obx(
          () {
            ////  礼物类型货币枚举值，目前：0—2D静态礼物, 1—2D动态礼物, 2—3D礼物，4-抽奖烟花, 5-buff礼物, 6-盲盒礼物
            return (logic.selectRx() != null && logic.selectRx()?['type'] == 6)
                ? GestureDetector(
                    child: SvgView(SVG.$('room/manhe_pic_fc'), width: 145, height: 46.9,),
                    onTap: () {
                      int giftId = logic.selectRx()?["id"];
                      String image = logic.selectRx()?["blind_box_probability_image"] ?? "";
                      GiftBlindBoxDetailsSheet.show(price: logic.selectRx()?['price'], giftId: giftId, blinkRateUrl: image);
                    },
                  )
                : const Spacing(height: 46.9, flex: null);
          }
        ),
        const Spacing(height: 6, flex: null),
        Expanded(
          child: DecoratedBox(
            decoration: const ShapeDecoration(
              shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
              color: Color(0xCC333333),
            ),
            child: child,
          ),
        )
      ],
    );

    return child;
  }

  Widget $TabView(Iterable<String> keys) {
    return Padding(
      padding: const Pad(left: 10),
      child: Row(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
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
    Widget moneyView() {
      Widget child = Row(
        children: [
          const MoneyIcon(type: MoneyType.diamond, size: 24),
          WalletCtrl.use(
            builder: (it) {
              var data = int.tryParse(it[MoneyType.diamond].toString()) ?? 0;
              if(data < 0) {
                data = 0;
              }
              return XText(
                '$data',
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
        onTap: () => Get.to(() => RechargePage(hasShowUnityView: hasShowUnityView,)),
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
            tooltip: '赠送数量'.en(),
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

      Widget _sendView() {
        return OpacityButton(
          onTap: doSend,
          child: Box(
            width: 56,
            height: 34,
            color: AppPalette.primary,
            alignment: Alignment.center,
            child: XText(
              '送出'.en(),
              style: const TextStyle(fontSize: 14, color: Colors.white),
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
          children: [$NumView(), _sendView()],
        ),
      );
    }

    return Box(
      height: 50,
      padding: const Pad(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          moneyView(),
          $BottomAction(),
        ],
      ),
    );
  }

  void doSend() {
    final count = numRx();
    final data = logic.selectRx();

    if (data == null) {
      showToast('请选择礼物'.en());

      return;
    }

    final whenErr = {
      11001: (_) {
        //TODO 判断货币

        Get.simpleDialog(msg: '余额不足'.en(), okLabel: '去充值'.en()).then((val) {
          if (val == '去充值'.en()) {
            Get.to(() => RechargePage(hasShowUnityView: hasShowUnityView,));
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
