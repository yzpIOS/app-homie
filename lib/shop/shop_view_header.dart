import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/shop/cart_sheet.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/my_dressup_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/shop_category_ctrl.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/activity/act_main_dialog.dart';
import 'package:app/ui/common/unity_view.dart';
import 'package:app/ui/dressup/model_overlay_cloth.dart';
import 'package:app/ui/dressup/model_overlay_wardrobe.dart';
import 'package:app/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyModelView extends StatefulWidget {

  static const ratio = 375 / 428;

  const MyModelView({super.key});

  @override
  _MyModelViewState createState() => _MyModelViewState();

}

class _MyModelViewState extends State<MyModelView> {
  final clothSelectorCtrl = Get.find<ClothSelectorCtrl>();
  bool unityLoadComplete = false;

  StreamSubscription? streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription = Bus.on<LoadScene>((event) {
      if(event.sceneName != "ModelScene") {
        unityLoadComplete = false;
        setState(() { });
      }
    });

    //注册镜头位置监听回调
    // SocketCtrl.ins.onDataCmd(CMD.C_CameraSwitch, onUnityRequest);
  }

  // //镜头位置监听回调
  // void onUnityRequest(int cmd, C_CameraSwitch? data) async {
  //   if (data == null) {
  //     return;
  //   }
  //
  //   //即将切换的镜头位置和已选中的位置一致，不处理
  //   if (data.position == 0 && Get.find<ClothSelectorCtrl>().groupListId.value == 1) {
  //     return;
  //   }
  //   if (data.position == 1 && Get.find<ClothSelectorCtrl>().groupListId.value == 2) {
  //     return;
  //   }
  //
  //   //position; 镜头位置 0：聚焦头部 1：概览全身
  //   Get.find<ClothSelectorCtrl>().groupListId.value = data.position == 0 ? 1 : 2;
  //   Get.find<ShopCategoryCtrl>().doRefresh();
  //   Get.find<MyDressUpCtrl>().getMyDressList();
  // }

  @override
  void dispose() {
    super.dispose();
    streamSubscription?.cancel();

    //移除镜头位置监听回调
    // SocketCtrl.ins.removeOnDataCmd(CMD.C_CameraSwitch, onUnityRequest);
  }

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
                    'instruction': Get.find<ClothSelectorCtrl>().isShopMode ? 1 : 2,
                  },
                );
                unityLoadComplete = true;
                myInfo.modeUnityLoadStatus.value = true;
                setState(() { });
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
        AspectRatio(aspectRatio: MyModelView.ratio, child: child),
        // 加载成功后，根据"商城"、"我的衣柜"、"我的其他"显示
        if(unityLoadComplete)
          Positioned.fill(
            child: GetX<ClothSelectorCtrl>(
              builder: (it) {
                return it.isShopMode
                    ? const ModelOverlay$Shop()
                    : (it.isWardrobeMode ? ModelOverlay$Wardrobe() : ModelOverlay$Cloth());
              },
            ),
          ),
        // 加载成功后，才显示广场按钮
        if(unityLoadComplete)
          Positioned(
            bottom: 100,
            left: 20,
            child: $Btn(action: '广场'),
            // left: 10,
            // child: $Btn(action: '装扮抽奖入口'),
          ),
        // 加载成功后，才显示聚焦头部、概览全身的切换视图
        if(unityLoadComplete)
          Positioned(
            top: AppSize.safeTop + 60,
            right: 25,
            child: $HeadChangeCameraDressTypeView(),
          ),
        // 加载成功后，才显示"商城""我的"切换视图
        if(unityLoadComplete)
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
          onTap: () {
            it.setShopMode(!isShopMode);
            it.sendFlutterSwitchCloth();
          },
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
      child: Image.asset(IMG.format('shop/$action'), scale: 3),
    );
  }

  Widget $HeadChangeCameraDressTypeView() {
    changeCameraSwitch();

    return GetX<ClothSelectorCtrl>(
      builder: (it) {
        int groupListId = it.groupListId.value;
        return Container(
          width: 30,
          padding: const Pad(vertical: 10),
          decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0xFFF5F5F5)),
          child: Column(
            children: [
              OpacityButton(
                onTap: () => onChangeCameraDressTypeClick(1),
                child: Image.asset(IMG.format(groupListId == 1 ? 'shop/shangcheng_icon_tb_selected' : 'shop/shangcheng_icon_tb_unselected'), scale: 3),
              ),
              const Spacing(height: 10, flex: null),
              OpacityButton(
                onTap: () => onChangeCameraDressTypeClick(2),
                child: Image.asset(IMG.format(groupListId == 2 ? 'shop/shangcheng_icon_fz_selected' : 'shop/shangcheng_icon_fz_unselected'), scale: 3),
              ),
            ],
          ),
        );
      },
    );
  }

  void onItemClick(String action) {
    switch (action) {
      case '广场':
        Get.find<RoomManagerCtrl>().toSquare();
        break;
      case '装扮抽奖入口':
        ActMainDialog.show();
        break;
    }
  }

  // 点击切换groupListId 1.聚焦头部、2.概览全身按钮
  void onChangeCameraDressTypeClick(int groupListId) {
    if (groupListId == clothSelectorCtrl.groupListId.value) {
      return;
    }

    clothSelectorCtrl.groupListId.value = groupListId;
    changeCameraSwitch();
    Get.find<ShopCategoryCtrl>().doRefresh();
    Get.find<MyDressUpCtrl>().getMyDressList();
  }

  void changeCameraSwitch() {
    //position 镜头位置 0：聚焦头部 1：概览全身
    S_CameraSwitch s_cameraSwitch = S_CameraSwitch();
    s_cameraSwitch.position = clothSelectorCtrl.groupListId.value == 1 ? 0 : 1;
    SocketCtrl.ins.sendUnity(CMD.S_CameraSwitch, message: s_cameraSwitch);
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
          child: buyView(),
        ),
      ],
    );
  }

  Widget buyView() {
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
