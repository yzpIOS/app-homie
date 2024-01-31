
import 'package:app/common/theme.dart';
import 'package:app/model/api/user_info_dto.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/common/nick_view.dart';
import 'package:app/ui/my/common/uid_view.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/app_bar2.dart';
import 'package:app/widgets/image/image_gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///
/// 礼物墙
///
class UserGiftWallDialog extends StatefulWidget {

  UID uid;
  NUID? nuid;

  UserGiftWallDialog({required this.uid, this.nuid});

  @override
  State<StatefulWidget> createState() => _UserGiftWallDialogState();

}

class _UserGiftWallDialogState extends State<UserGiftWallDialog> with SingleTickerProviderStateMixin {

  Map<String, Widget> data = {
    "礼物": GiftPannel(type: 0, lighten: [], notLighten: [],),
  };

  // 点亮礼物
  List? lighten;
  // 没点亮礼物
  List? notLighten;

  Map? userInfo;

  late final controller = TabController(vsync: this, length: data.length);

  @override
  void initState() {
    super.initState();
    delay(100, () async {
      WaitingCtrl.obj.show();
      Map mapValue = {};
      try {
        mapValue = await Api.UserInfo.getWallGift(uid: widget.uid);
      } catch(e, s) {
        debugPrint(e.toString());
      } finally {
        WaitingCtrl.obj.hidden();
      }
      // 礼物数据
      lighten = mapValue.containsKey("lighten_items") ? mapValue["lighten_items"] : null;
      notLighten = mapValue.containsKey("not_lighten_items") ? mapValue["not_lighten_items"] : null;
      if((lighten == null || lighten?.isEmpty == true) && (notLighten == null || notLighten?.isEmpty == true)) {
        showToast("数据为空");
        Get.back();
        return;
      }
      // 设置礼物的值
      data = {
        "礼物": GiftPannel(type: 0, lighten: lighten, notLighten: notLighten,),
      };

      setState(() { });

      userInfo = await Api.UserInfo.detail(widget.uid);

      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD898FF),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    _creaetBgView(),
                    $UserView().margin(top: 60, left: 10),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: Image.asset(IMG.format("my/gift_box"), width: 121, height: 94,),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    color: Color(0xFF312753),
                  ),
                  child: GiftPannel(type: 0, lighten: lighten, notLighten: notLighten,),
                ),
              ),
            ],
          ),

          AppBar2(),
        ],
      ),
    );
  }

  Widget _creaetBgView() {
    return Container(
      height: AppSize.safeTop + 202,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFD89BFE), Color(0xFFE6BFFF), Color(0xFFD898FF)],
        ),
      ),
    );
  }

  Widget $UserView() {
    Widget builder(UserInfoDto? data) {
      final avatar = data?.avatar;

      final onTap = avatar == null
          ? null
          : () {
        ImageGallery.show(
          data: ImageGalleryItem(
            image: const ImageToWebp().toProvider(Left(avatar)),
            thumb: const ImageToThumb().toProvider(Left(avatar)),
          ),
        );
      };

      return Row(
        children: [
          OpacityButton(
            onTap: onTap,
            child: AvatarView(
              avatar,
              blur: data?.avatarEx,
              avatarFrameUrl: data?.avatar_frame,
              size: 70,
              avatarFrameSize: 16,
              side: const BorderSide(color: Colors.white, width: 1),
            ),
          ),
          Spacing.w10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NickView(nickName: data?.showName()),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(25),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                  child: Text(
                    "已收集星星 ${userInfo?["collect_start_count"] ?? "0"}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget child = UserInfoCtrl.use(widget.uid, builder: builder);

    child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: Colors.white),
      child: child,
    );

    return child;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

}

class GiftPannel extends StatelessWidget {

  int type;
  // 点亮礼物
  List? lighten;
  // 没点亮礼物
  List? notLighten;

  GiftPannel({required this.type, this.lighten, this.notLighten});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: CustomScrollView(
        slivers: [
          if(lighten != null && (lighten?.length ?? 0) > 0)
            const SizedBox(height: 10,).toSliver(),
          if(lighten != null && (lighten?.length ?? 0) > 0)
            _createTitle("已点亮", lighten?.length ?? 0),
          if(lighten != null && (lighten?.length ?? 0) > 0)
            const SizedBox(height: 10,).toSliver(),
          if(lighten != null && (lighten?.length ?? 0) > 0)
            _createGridView(lighten!, true),

          if(notLighten != null && (notLighten?.length ?? 0) > 0)
            if(lighten != null && (lighten?.length ?? 0) > 0)
              const SizedBox(height: 20,).toSliver(),
            if(lighten == null || lighten?.isEmpty == true)
              const SizedBox(height: 10,).toSliver(),

          if(notLighten != null && (notLighten?.length ?? 0) > 0)
            _createTitle("未点亮", notLighten?.length ?? 0),
          if(notLighten != null && (notLighten?.length ?? 0) > 0)
            const SizedBox(height: 10,).toSliver(),
          if(notLighten != null && (notLighten?.length ?? 0) > 0)
            _createGridView(notLighten!, false),
        ],
      ),
    );
  }

  Widget _createTitle(String text, count) {
    return Text(
      "$text $count",
      style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal
      ),
    ).toSliver();
  }

  Widget _createGridView(List data, bool lighten) {
    double ratio = type == 0 ? (110.0 / 144.0) : (110.0 / 116.0);
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          if(type == 0) {
            return _createGiftItem(data[index], lighten);
          }
          return _createDecorationItem(data[index]);
        },
        childCount: data.length
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 13,
        crossAxisSpacing: 10,
        childAspectRatio: ratio,
      ),
    );
  }

  ///
  /// 礼物下面的Item
  ///
  Widget _createGiftItem(Map data, bool lighten) {
    int accept_count = data["count"];
    int lighten_need_count = data["lighten_need_count"];

    // 点亮图标
    Widget giftImage;
    bool isLighten = false;
    if(lighten) {
      giftImage = AspectRatio(
        aspectRatio: 1.0 / 1.0,
        child: NetImage(data["cover"], fit: BoxFit.cover),
      );
      isLighten = true;
    } else {
      const ColorFilter sepia = ColorFilter.matrix(<double>[
        0.2126, 0.7152, 0.0722, 0, 0,
        0.2126, 0.7152, 0.0722, 0, 0,
        0.2126, 0.7152, 0.0722, 0, 0,
        0,      0,      0,      1, 0,
      ]);

      giftImage = AspectRatio(
        aspectRatio: 1.0 / 1.0,
        child: ColorFiltered(
          colorFilter: sepia,
          child: NetImage(data["cover"], fit: BoxFit.cover),
        ),
      );
    }

    // 计算进度
    double ratio =  (accept_count.toDouble() / (lighten_need_count.toDouble() + 0.001));
    if(ratio >= 1.0) {
      ratio = 1.0;
    }
    double progressWidth = ((AppSize.width - 10 * 2 - 12 * 2) / 3.0 - 14) * ratio;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // 背景
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(IMG.format("wd_pic_bg_lwq")),
        ),

        // 礼物图片, 用户名称, 进度等
        Column(
          children: [
            // 礼物图片
            Container(width: 76, height: 76,child: giftImage,),
            const SizedBox(height: 5,),
            // 礼物名称
            Expanded(
              child: Text(
                data["name"],
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: TextStyle(
                  color: isLighten ? Colors.white : const Color(0xFF999999),
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ),

            // 进度条上的文字
            const SizedBox(height: 5,),
            Row(
              children: [
                const SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    "${data["count"]}/${data["lighten_need_count"]}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12
                    ),
                  ),
                ),
                if(lighten)
                  Text(
                    "+${data["start_count"]}星",
                    style: TextStyle(
                        color: Color(0xFFF54390),
                        fontWeight: FontWeight.normal,
                        fontSize: 12
                    ),
                  ),
                const SizedBox(width: 10,)
              ],
            ),
            SizedBox(
              height: 6,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(30),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: progressWidth,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9F5284), Color(0xFFF54390)],
                      ),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
          ],
        ),

        // 活动标签
        Visibility(
          visible: false,
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 26,
              height: 14,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(16),
                borderRadius: BorderRadius.circular(2),
              ),
              child: const Text(
                "活动",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  ///
  /// 礼物下面的Item
  ///
  Widget _createDecorationItem(Map data) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // 背景
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(IMG.format("wd_pic_bg_zs")),
        ),

        // 礼物图片, 用户名称, 进度等
        Column(
          children: [
            // 礼物图片
            Container(color: Colors.red, width: 86, height: 86,),
            const SizedBox(height: 5,),
            // 礼物名称
            const Expanded(
              child: Text(
                "西瓜少女",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),

        // 活动标签
        Visibility(
          visible: false,
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 26,
              height: 14,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(16),
                borderRadius: BorderRadius.circular(2),
              ),
              child: const Text(
                "活动",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}


