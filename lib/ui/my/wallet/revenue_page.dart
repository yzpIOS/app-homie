import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/my/wallet/diamond_detail_filter_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({super.key});

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  final selectRx = Rxn<Map>();
  final refresh = RxBool(false);

  final type = MoneyType.diamond;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: AspectRatio(
              aspectRatio: 375.0 / 210.0,
              child: Image.asset(IMG.format("my/pic_sy"), width: Get.width, height: 210),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            child: xAppBar(

              title: Text(
                '我的收益',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              bgColor: AppPalette.appBarForegroundColorDark.withAlpha(0),
              iconTheme: IconThemeData(
                color: Colors.black, //修改颜色
              ),
            ),
          ),


          const Positioned.fill(
            top: 210,
            child: Box(color: Colors.white),
          ),
          Positioned(
            top: 108,
            left: 20,
            right: 20,
            height: 159,
            child: Obx(() {
              refresh.value;
              return $TotalView();
            }),
          ),
          const Positioned(
            top: 280,
            left: 10,
            child: XText(
              '收益明细',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFC188E7)),
            ),
          ),

          Positioned(
            top: 280,
            right: 10,
            child: GestureDetector(
              onTap: () {
                DiamondDetailFilterSheet.show(defValue: "全部");
              },
              behavior: HitTestBehavior.opaque,
              child: XText(
                '筛选',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
              ),
            ),
          ),
          Positioned.fill(
            top: 308,
            child: _DataView(
              callBack: () async {
                await WalletCtrl.ins.doRefresh();
                refresh.value = !refresh.value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget $TotalView() {
    Widget child = Column(
      children: [
        const Spacer(flex: 30),
        const XText(
          '礼物收益',
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
        ),
        const Spacer(flex: 20),
        WalletCtrl.use(
          refresh: true,
          builder: (it) {
            final data = it[MoneyType.homie];

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                XText(
                  '${data ?? '--'}',
                  style: const TextStyle(fontSize: 30, color: AppPalette.primary, fontWeight: fw$Medium),
                ),
                const MoneyIcon(type: MoneyType.homie, size: 34, variant: 1),
              ],
            );
          },
        ),
        const Spacer(flex: 20),
        const XText(
          '获得礼物的收益额',
          style: TextStyle(fontSize: 12, color: AppPalette.c9),
        ),
        const Spacer(flex: 30),
      ],
    );

    child = Material(
      elevation: 6,
      color: Colors.white,
      borderRadius: AppBorderRadius.a10,
      shadowColor: const Color(0x7F000000),
      child: child,
    );

    return child;
  }
}

class _DataView extends SimplePageView<Map> {

  Function? callBack;

  @override
  BaseConfig get config {
    return ListConfig(
      padding: EdgeInsets.zero,
      divider: Divider(indent: 10, endIndent: 10),
    );
  }

  _DataView({this.callBack});

  @override
  Future fetchPage(PageNum page) {
    if(page.firstPage()) {
      callBack?.call();
    }
    return Api.Finance.record(page: page);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    Widget child = Row(
      children: [
        Spacing.w20,
        UserHomeWrap(
          uid: item['send_uid'],
          child: AvatarView(item['send_avatar_url'], size: 40),
        ),
        Spacing.w10,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XText(
                '${item['send_user_name']}赠送了您${item['product_name']}',
                style: const TextStyle(fontSize: 12, color: AppPalette.c9),
              ),
              Spacing.h10,
              XText(
                TimeFormat.yMMMMdHms.formatEpoch(item['created_at']),
                style: const TextStyle(fontSize: 10, color: AppPalette.cc),
              ),
            ],
          ),
        ),
        Container(
          width: 42,
          height: 42,
          clipBehavior: Clip.hardEdge,
          decoration: const ShapeDecoration(shape: AppShape.a4, color: Color(0xFFF5F5F5)),
          child: Stack(
            children: [
              Positioned(
                top: 1,
                left: 1,
                right: 1,
                bottom: 1,
                child: GiftImgState(
                  child: NetImage(item['product_url'], width: 40, height: 40),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 2,
                child: IntrinsicWidth(
                  child: Container(
                    constraints: BoxConstraints.tight(const Size.square(10)).copyWith(maxWidth: 20),
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0xFFFE4848)),
                    child: XText(
                      '${item['count']}',
                      style: const TextStyle(fontSize: 7, color: Colors.white, fontWeight: fw$Medium),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Box(
          width: 77,
          padding: const Pad(horizontal: 8),
          alignment: Alignment.center,
          child: XText(
            '+${item['amount']}',
            style: const TextStyle(fontSize: 12, color: Color(0xFFFE4848)),
          ),
        ),
      ],
    );

    child = Box(height: 82, child: child);

    return child;
  }
}
