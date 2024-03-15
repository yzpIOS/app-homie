import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 盲盒
class GiftBlindBoxDetailsSheet extends StatelessWidget {
  final int price;
  final int giftId;
  final String blinkRateUrl;
  const GiftBlindBoxDetailsSheet._({super.key, this.price = 20, required this.giftId, required this.blinkRateUrl});

  static Future show({required int price, required int giftId, required String blinkRateUrl}) {
    final sheet = GiftBlindBoxDetailsSheet._(price: price, giftId: giftId, blinkRateUrl: blinkRateUrl,);

    return OrientationSheet.show(
      child: sheet,
      direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
      constraints: BoxConstraints.tightFor(
        width: AppSize.width,
        height: 313 + AppSize.safeBottom,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = <String, Widget>{
      '盲盒规则': DelayView(
        fadeIn: false,
        keepAlive: true,
        builder: (_) {
          return $BlindBoxRulesView(blinkRateUrl);
        },
      ),
      '盲盒记录': DelayView(
        fadeIn: false,
        keepAlive: true,
        builder: (_) {
          return _BlindBoxRecordingDataView(giftId);
        },
      ),
      // '排行榜': DelayView(
      //   fadeIn: false,
      //   keepAlive: true,
      //   builder: (_) {
      //     return _BlindBoxRankingListMainDataView(giftId);
      //   },
      // ),
    };

    Widget child = XSnapshotWidget(
      child: DefaultTabController(
        length: data.length,
        child: Column(
          children: [
            SizedBox(height: 62, child: $TabView(data.keys, context)),
            Expanded(
              child: XFrameWidget(
                child: $PageView(data.values),
              ),
            ),
          ],
        ),
      ),
    );

    return child;
  }

  Widget $TabView(Iterable<String> keys, BuildContext context) {
    return Padding(
      padding: const Pad(left: 40),
      child: Row(
        children: [
          Expanded(
            child: ColoredBox(
              color: Theme.of(context).canvasColor,
              child: TabBar(
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: const Color(0xFFFCF6FF),),
                labelColor: AppPalette.primary,
                labelPadding: const Pad(),
                unselectedLabelColor: AppPalette.c9,
                labelStyle: const TextStyle(fontSize: 16, fontWeight: fw$SemiBold),
                unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: fw$Regular),
                tabs: keys.map((it) => Tab(text: it, height: 32)).toList(growable: false),
              ),
            ),
          ),
          const Spacing(width: 10, flex: null,),
          const CloseButton(color: Colors.black),
        ],
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

  Widget $BlindBoxRulesView(String image) {
    String explainImageName = 'activity/说明$price';

    return SingleChildScrollView(
      padding: Pad(horizontal: 15, vertical: 4, bottom: AppSize.safeBottom),
      child: Column(
        children: [
          const Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 12, color: Colors.black),
              children: [
                TextSpan(
                  text: '一、玩法说明\n',
                  style: TextStyle(fontSize: 14, fontWeight: fw$Medium),
                ),
                TextSpan(text: '1.平台内惊喜盲盒玩法正在逐步开放中，不同用户玩法有所不同。直播间未展示惊喜盲盒玩法的用户，暂时无法参与。\n'),
                TextSpan(text: '2.被判定为消费异常账号的用户无法参与惊喜盲盒玩法。\n'),
                TextSpan(text: '3.用户不得以不正当手段或舞弊行为参与本活动，包括但不限于: 第三方代充；利用系统bug或通过机器人软件、蜘蛛软件、爬虫 软件、刷屏软件等任何程序或技术手段参与本活动。\n'),
                TextSpan(text: '4.用户不得在活动期间违反法律法规、平台规则或本活动规则；如Homie世界发现或有合理理由认为用户存在前述行为，Homie世界有权单方面采取取消参与资格、取消权益、收回已发放权益、封禁相关账号等措施。\n'),
                TextSpan(text: '5.平台内其他榜单与数值加分按照盲盒实际开出的礼物价值进行积分计算。\n'),
                TextSpan(text: '6.本活动与Apple inc无关\n\n'),
                TextSpan(
                  text: '二、玩法奖励\n',
                  style: TextStyle(fontSize: 14, fontWeight: fw$Medium),
                ),
                TextSpan(text: '幸运礼物及概率如下'),
              ],
            ),
          ),
          Spacing.h10,
          Image.network(image, fit: BoxFit.contain),
        ],
      ),
    );
  }
}

class _BlindBoxRecordingDataView extends SimpleDataView<Map> {
  int giftId;

  _BlindBoxRecordingDataView(this.giftId);

  @override
  BaseConfig get config {
    return GridConfig(
      padding: Pad(horizontal: 20, top: 8, bottom: AppSize.safeBottom),
      gridDelegate: const XGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 26,
        crossAxisSpacing: 38,
        fixedHeight: 20 + 16,
      ),
    );
  }

  @override
  Future fetch() => Api.Lottery.winning2(giftId);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final type = MoneyType.fromVal(item['currency']);

    Widget $NumView() {
      return Container(
        constraints: const BoxConstraints(minWidth: 26),
        alignment: Alignment.center,
        padding: const Pad(horizontal: 4),
        decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0xFF6BE5B0)),
        child: XText(
          'X${item['count']}',
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
          style: const TextStyle(fontSize: 10, color: Colors.white, height: 1),
        ),
      );
    }

    Widget child = Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -6,
          right: 0,
          height: 14,
          child: $NumView(),
        ),
        Positioned(
          top: 12,
          left: 12,
          right: 12,
          bottom: 12,
          child: XFrameWidget(
            child: NetImage(item['image']),
          ),
        ),
      ],
    );

    child = AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: const ShapeDecoration(color: Color(0xFFF5F5F5), shape: AppShape.a4),
        child: child,
      ),
    );

    child = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        child,
        XText(
          item['prize_name'],
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        XRichText(
          TextSpan(
            children: [
              if (type != null)
                WidgetSpan(
                  child: Padding(
                    padding: const Pad(right: 1),
                    child: MoneyIcon(type: type, size: 16),
                  ),
                  alignment: PlaceholderAlignment.middle,
                ),
              TextSpan(
                text: '${item['price']}',
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );

    return child;
  }
}

class _BlindBoxRankingListMainDataView extends StatefulWidget {
  final int giftId;
  const _BlindBoxRankingListMainDataView(this.giftId);

  @override
  State<_BlindBoxRankingListMainDataView> createState() => _BlindBoxRankingListMainDataViewState();
}

class _BlindBoxRankingListMainDataViewState extends State<_BlindBoxRankingListMainDataView> with TickerProviderStateMixin {
  late final ctrl = TabController(
    length: tabs.length,
    vsync: this,
  );

  late final tabs = {
    '今日榜': _SubListDataView(Api.Lottery.today2, widget.giftId),
    '昨日榜': _SubListDataView(Api.Lottery.yesterday2, widget.giftId),
  };

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: ctrl,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(width: 1.5, color: AppPalette.primary),
          ),
          indicatorPadding:  const Pad(bottom: 6),
          labelPadding: const Pad(horizontal: 45),
          labelStyle: const TextStyle(fontSize: 14, fontWeight: fw$SemiBold),
          unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: fw$Regular),
          tabs: tabs.keys.map((it) => Tab(height: 32, text: it)).toList(growable: false),
        ),
        Expanded(
          child: TabBarView(
            controller: ctrl,
            children: tabs.values.toList(growable: false),
          ),
        ),
      ],
    );
  }
}

class _SubListDataView extends SimpleDataView<Map> {
  int giftId;
  final Future Function(int giftId) api;

  _SubListDataView(this.api, this.giftId);

  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(top: 8, bottom: AppSize.safeBottom),
      divider: const Divider(indent: 10, endIndent: 10),
    );
  }

  @override
  Future fetch() => api(giftId);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final uid = item['uid'];

    return Box(
      padding: const Pad(horizontal: 10),
      height: 52,
      child: Row(
        children: [
          index < 3
            ? SvgView(SVG.$('top/$index'), width: 28, height: 28)
            : Box(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
            ),
          Spacing.w10,
          AsyncAvatar(uid: uid, size: 32),
          Spacing.w10,
          Expanded(
            child: UserInfoCtrl.use(
              uid,
              builder: (it) => XText(
                it?.showName() ?? '',
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ),
          Spacing.w10,
          $GiftView(item['items']),
        ],
      ),
    );
  }

  Widget $GiftView(Iterable items) {
    const size = 32.0;
    const space = 10.0;
    const count = 3;

    Widget itemBuilder(data) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(color: Color(0xFFF5F5F5), shape: BoxShape.circle),
            child: Padding(
              padding: const Pad(all: 6),
              child: NetImage(data['image'], fit: BoxFit.cover),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            height: 12,
            child: IntrinsicWidth(
              child: Container(
                constraints: const BoxConstraints(minWidth: 12, maxWidth: 30),
                decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0xFF2CDFB9)),
                alignment: Alignment.center,
                child: XText(
                  '${data['count']}',
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                  style: const TextStyle(fontSize: 8, color: Colors.white, fontWeight: fw$Medium, height: 1),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: size * count + space * (count - 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: items.take(count).map(itemBuilder).separator(Spacing.w10).toList(growable: false),
      ),
    );
  }
}