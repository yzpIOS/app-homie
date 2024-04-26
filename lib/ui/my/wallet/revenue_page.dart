import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/my/wallet/MyHomietemView2.dart';
import 'package:app/ui/my/wallet/MyWalletItemView2.dart';
import 'package:app/ui/my/wallet/diamond_detail_filter_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({super.key});

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

class _RevenuePageState extends SimplePageState<Map, RevenuePage> {
  final selectRx = Rxn<Map>();
  final refresh = RxBool(false);

  final type = MoneyType.diamond;

  String curFilter = "全部";
  int? curType = null;
  final tabs = {
    '全部': null,
    '收入': 1,
    '兑换': 2,
    '提现': 3,
    '用户退款': 4,
  };

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
          Positioned(
            top: 280,
            left: 10,
            child: XText(
              curFilter,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFC188E7)),
            ),
          ),

          Positioned(
            top: 280,
            right: 10,
            child: GestureDetector(
              onTap: () async {
                String? newFilter = await DiamondDetailFilterSheet.show(tabs.keys.toList(), defValue: curFilter);
                if(newFilter != null) {
                  curFilter = newFilter;
                  curType = tabs[curFilter];
                  controller.doRefresh();
                  setState(() { });
                }
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
            child: super.build(context),
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

  @override
  BaseConfig get config {
    return ListConfig(
      padding: EdgeInsets.zero,
      divider: Divider(indent: 10, endIndent: 10),
    );
  }

  @override
  Future fetchPage(PageNum page) async {
    if(page.firstPage()) {
      await WalletCtrl.ins.doRefresh();
      refresh.value = !refresh.value;
    }
    return Api.Finance.record(type: curType, page: page);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    if(item["send_avatar_url"] == null && item["product_url"] == null) {
      return MyWalletItemView2(data: {
        "type": item["type"],
        "name": item["product_name"],
        "created_at": item["created_at"],
        "amount": item["amount"],
      });
    } else {
      return MyHomietemView2(item: item);
    }
  }
}

