import 'package:app/common/theme.dart';
import 'package:app/shop/cart_sheet.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/unity_view.dart';
import 'package:app/ui/dressup/model_overlay_cloth.dart';
import 'package:app/ui/dressup/model_overlay_wardrobe.dart';
import 'package:app/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyModelView extends StatelessWidget {
  const MyModelView({super.key});

  static const ratio = 375 / 428;

  @override
  Widget build(BuildContext context) {
    Widget child = UnityView(
      uniqueKey: 'ModelScene',
      gestureRecognizers: {
        Factory<HorizontalDragGestureRecognizer>(() => HorizontalDragGestureRecognizer()),
      },
      onInit: (unity, loader, onProcess) {
        return unity.loadSceneCombo(
          () => loader(
            'ModelScene',
            doOnAfter: () async {
              onProcess(0.6);

              try {
                final myInfo = Get.find<MyInfoCtrl>();

                await unity.sendMessage(
                  App2UnityEnum.FTU_GENDER_CLOTHING_SCENE,
                  data: {
                    'gender': myInfo.dataRx().gender!.code,
                    'goodsIds': await Get.find<ClothSelectorCtrl>().initIds(),
                  },
                );
              } catch (e, s) {
                errLog(e, s);
              }
            },
          ),
        );
      },
    );

    child = Stack(
      children: [
        AspectRatio(aspectRatio: ratio, child: child),
        Positioned.fill(
          child: GetX<ClothSelectorCtrl>(
            builder: (it) {
              return it.isShopMode
                  ? const ModelOverlay$Shop()
                  : (it.isWardrobeMode ? ModelOverlay$Wardrobe() : ModelOverlay$Cloth());
            },
          ),
        ),
        Positioned(
          top: AppSize.safeTop + 50,
          right: 10,
          child: $Btn(action: '广场'),
        ),
        Positioned(
          left: 10,
          bottom: 20,
          height: 30,
          child: $ModeView(),
        ),
      ],
    );

    if (!Env.useUnity) {
      child = DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFBC7BE7), Color(0xFFFFBAE3)],
          ),
        ),
        child: child,
      );
    }

    return child;
  }

  Widget $ModeView() {
    const width = 100.0;

    Widget $Text(String title, bool isSelect) {
      return Center(
        child: DefaultTextStyle(
          style: isSelect
              ? const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$SemiBold)
              : const TextStyle(fontSize: 12, color: Colors.white),
          child: XText(title),
        ),
      );
    }

    Widget child = GetX<ClothSelectorCtrl>(
      builder: (it) {
        final isShopMode = it.isShopMode;

        return OpacityButton(
          onTap: () => it.setShopMode(!isShopMode),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: kTabScrollDuration,
                curve: Curves.easeOutCubic,
                left: isShopMode ? 0 : width / 2,
                top: 0,
                bottom: 0,
                width: width / 2,
                child: Container(
                  decoration: const ShapeDecoration(shape: XStadiumBorder(), color: AppPalette.primary),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: width / 2,
                child: $Text('商城', isShopMode),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: width / 2,
                child: $Text('我的', !isShopMode),
              ),
            ],
          ),
        );
      },
    );

    child = Container(
      width: width,
      decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0x4DFFFFFF)),
      child: child,
    );

    return child;
  }

  Widget $Btn({required String action}) {
    return OpacityButton(
      onTap: () => onItemClick(action),
      child: Image.asset(IMG.$('shop/$action'), scale: 3),
    );
  }

  void onItemClick(String action) {
    switch (action) {
      case '广场':
        Get.find<RoomManagerCtrl>().toSquare();
        break;
    }
  }
}

class ModelOverlay$Shop extends StatelessWidget {
  const ModelOverlay$Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 10,
          bottom: 20,
          width: 60,
          height: 30,
          child: $BuyView(),
        ),
      ],
    );
  }

  Widget $BuyView() {
    const ts = TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$SemiBold);

    return GetX<ShoppingCartCtrl>(
      builder: (it) {
        final count = it.count();

        return count == 0
            ? XTextBtn(label: '购买', textStyle: ts, color: AppPalette.hint)
            : XTextBtn(
                label: '购买$count',
                textStyle: ts,
                color: AppPalette.primary,
                onTap: () => onItemClick('购物车'),
              );
      },
    );
  }

  void onItemClick(String action) {
    switch (action) {
      case '购物车':
        CartSheet.show();
        break;
    }
  }
}
