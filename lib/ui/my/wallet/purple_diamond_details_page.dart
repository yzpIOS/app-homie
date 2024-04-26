import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/wallet/diamond_detail_filter_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class PurpleDiamondDetailsPage extends StatefulWidget {
  const PurpleDiamondDetailsPage({super.key});

  @override
  State<PurpleDiamondDetailsPage> createState() => _DetailsListViewState();
}

class _DetailsListViewState extends SimplePageState<Map, PurpleDiamondDetailsPage> {

  String curFilter = "全部";

  final tabs = {
    '全部': null,
    '赠送': 1,
    '充值': 2,
    '支出': 3,
  };

  int? type;//1：收入，2：支出(不传，默认是全部)

  _DetailsListViewState({this.type});

  @override
  void didUpdateWidget(covariant PurpleDiamondDetailsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.doRefresh();
  }

  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(horizontal: 15, bottom: 10 + AppSize.safeBottom),
      divider: const Divider(color: Color(0xFFE3E7ED),),
    );
  }

  @override
  Future fetchPage(PageNum page) => Api.Finance.diamondDetail(type: type, page: page);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(
          title: '紫钻明细',
          actions: [
            GestureDetector(
              onTap: () async {
                String? newFilter = await DiamondDetailFilterSheet.show(tabs.keys.toList(), defValue: curFilter);
                if(newFilter != null) {
                  curFilter = newFilter;
                  type = tabs[curFilter];
                  controller.doRefresh();
                }
              },
              behavior: HitTestBehavior.opaque,
              child: Text(
                "筛选",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                ),
              ),
            )
          ]
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              curFilter,
              style: TextStyle(
                  color: Color(0xFFBD7CE5),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          ),
          Expanded(
            child: super.build(context),
          ),
        ],
      ),
      bottomNavigationBar: createTotalAmount(),
    );
  }

  Widget createTotalAmount() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withAlpha(25),
            offset: Offset(0.0, -2),
            blurRadius: 4,
            spreadRadius: 1,
          )
        ]
      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Expanded(
            child: Text(
              "总额：",
              style: TextStyle(
                color: Color(0xFFC05EFB),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "20000",
            style: TextStyle(
              color: Color(0xFFC05EFB),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10,),
        ],
      ),
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return MyItemView2(data: item);
  }
}

class MyItemView2 extends StatelessWidget {
  final Map data;

  const MyItemView2({required this.data});

  @override
  Widget build(BuildContext context) {
    return Box(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    XText(
                      data['name'] ?? '-',
                      style: const TextStyle(fontSize: 14, color: AppPalette.txtDark, fontWeight: fw$Medium),
                    ),
                    SizedBox(width: 3,),
                    Image.asset(IMG.format(data['type'] == 1 ? "my/ic_income" :"my/ic_cost"), width: 32, height: 18,)
                  ],
                ),
                Spacing.h4,
                XText(
                  TimeFormat.yyyyMMddHms.formatEpoch(data['created_at']),
                  style: const TextStyle(fontSize: 12, color: AppPalette.colorA9, fontWeight: fw$Regular),
                ),
              ],
            ),
          ),
          // const Expanded(child: Spacing.blank),
          XText(
            data['amount'] != null ? '${data['type'] == 1 ? '+' : '-'}${data['amount'].toString()}' : '-',
            style: const TextStyle(fontSize: 15, color: AppPalette.txtDark, fontWeight: fw$SemiBold),
          ),
        ],
      ),
    );
  }
}
