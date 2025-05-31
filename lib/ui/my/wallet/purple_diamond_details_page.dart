import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/wallet/mine_wallet_item_view.dart';
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
  
  ValueNotifier<dynamic> totalAmount = ValueNotifier("");

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
  Future fetchPage(PageNum page) async {
    var result = await Api.Finance.diamondDetail(type: type, page: page);
    
    if(result is Map && result.containsKey("total_amount")) {
      totalAmount.value = result["total_amount"];
    } else {
      totalAmount.value = "0";
    }

    return result;
  }

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
                  setState(() { });
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
    if(curFilter == "全部") {
      return const SizedBox();
    }
    return ValueListenableBuilder(
        valueListenable: totalAmount,
        builder: (a, b, c) {
          return Container(
            height: 80,
            padding: EdgeInsets.only(bottom: 20),
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
                  b.toString(),
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
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return MineWalletItemView(data: item);
  }
}
