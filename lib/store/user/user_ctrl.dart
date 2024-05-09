import 'package:app/3rd/sentry/sentry.dart';
import 'package:app/model/auth_info.dart';
import 'package:app/store/activity_banner_ctrl.dart';
import 'package:app/store/banner_ctrl.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/gift_ctrl.dart';
import 'package:app/store/im/conv_manager_ctrl.dart';
import 'package:app/store/im/im_ctrl.dart';
import 'package:app/store/im/message_manager_ctrl.dart';
import 'package:app/store/mq_ctrl.dart';
import 'package:app/store/my_anime_ctrl.dart';
import 'package:app/store/my_dressup_ctrl.dart';
import 'package:app/store/my_wardrobe_ctrl.dart';
import 'package:app/store/room/my_gift_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/search_ctrl.dart';
import 'package:app/store/shop_category_ctrl.dart';
import 'package:app/store/shopping_cart_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/store/user/setting_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/dialog/guild_level_dialog.dart';
import 'package:app/ui/my/guild_center/model/guild_level_info_model.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

typedef UseBox = Future<R> Function<R>(FutureOr<R> Function(LazyBox box) callback);

class UserCtrl extends GetxController with GetDisposableMixin {
  final Map? init;
  bool? showTransition;

  final AuthInfo _auth;
  final UserLazyBox _box;

  UserCtrl(this._auth, {this.init, this.showTransition = true}) : _box = UserLazyBox(uid: _auth.uid, name: 'UserStore');

  bool roomLoadingHasBeenDisplayed = false;//房间加载图是否已经显示
  bool squareLoadingHasBeenDisplayed = false;//广场加载图是否已经显示

  final List<GuildLevelInfoModel> guildLevelInfoModelList =
  <GuildLevelInfoModel>[
    GuildLevelInfoModel(
        levelString: '1星公会',
        fireString: '自然月音浪(火力)≥0紫钻',
        userCountString: '自然月有效主播人数≥10人',
        levelImageName: 'my/guild_center_level_star_1'),
    GuildLevelInfoModel(
        levelString: '2星公会',
        fireString: '自然月音浪(火力)≥5百万紫钻',
        userCountString: '自然月有效主播人数≥20人',
        levelImageName: 'my/guild_center_level_star_2'),
    GuildLevelInfoModel(
        levelString: '3星公会',
        fireString: '自然月音浪(火力)≥2千万紫钻',
        userCountString: '自然月有效主播人数≥30人',
        levelImageName: 'my/guild_center_level_star_3'),
    GuildLevelInfoModel(
        levelString: '4星公会',
        fireString: '自然月音浪(火力)≥5千万紫钻',
        userCountString: '自然月有效主播人数≥50人',
        levelImageName: 'my/guild_center_level_star_4'),
    GuildLevelInfoModel(
        levelString: '5星公会',
        fireString: '自然月音浪(火力)≥1亿紫钻',
        userCountString: '自然月有效主播人数≥100人',
        levelImageName: 'my/guild_center_level_star_5'),
  ];

  /// 点击公会等级
  void clickGuildLevel({required Offset anchorPoint,required int level}) {
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (context) {
        if(level < guildLevelInfoModelList.length) {
          return GuildLevelDialog(showAnchorPoint: anchorPoint, guildLevelInfoModel: guildLevelInfoModelList[level],);
        }else{
          return GuildLevelDialog(showAnchorPoint: anchorPoint, guildLevelInfoModel: guildLevelInfoModelList.last,);
        }
      },
      useSafeArea: false,
    );
  }

  @override
  void onInit() {
    super.onInit();

    final uid = _auth.uid;

    bindGet(ImAuth(uid: uid));
    bindGet(SettingCtrl(_box));
    bindGet(HomeSearchCtrl(_box));
    bindGet(MyInfoCtrl(_box, uid: uid, init: init));
    bindGet(ConvManagerCtrl());
    bindGet(MessageManagerCtrl());
    bindGet(RoomManagerCtrl());

    // bindGet(MqCtrl());
    bindGet(BannerCtrl());
    bindGet(ActivityBannerCtrl());
    bindGet(GiftCtrl(uid: uid));
    bindGet(WalletCtrl(uid: uid));
    bindGet(UserInfoCtrl(uid: uid));

    bindGet(MyDressUpCtrl(uid: uid));
    bindGet(MyWardrobeCtrl(uid: uid));
    bindGet(MyGiftCtrl(uid: uid));
    bindGet(MyAnimeCtrl(uid: uid));
    bindGet(ShopCategoryCtrl(uid: uid));
    // bindGet(ShopRecommendCtrl(uid: uid));
    bindGet(ShoppingCartCtrl(uid: uid));
    bindGet(ClothSelectorCtrl());

    SentryHelp.setUser(uid);
  }

  @override
  void onReady() {
    super.onReady();

    if (Env.useUnity && showTransition == true) {
      // Get.find<UnityCtrl>() //
      //     .loadScene('Transition');
    }
  }

  @override
  @mustCallSuper
  void onClose() {
    _box.close();

    SentryHelp.setUser(null);

    super.onClose();
  }

  static UseBox get useBox => Get.find<UserCtrl>()._box.use;
}
