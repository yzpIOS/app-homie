
import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/room/game/turntable/views/turntable_item_view.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/list/list_config.dart';
import 'package:app/widgets/list/list_ctrl.dart';
import 'package:app/widgets/list/simple_list.dart';
import 'package:flutter/material.dart';

class TurntableRecordialog extends StatefulWidget {

  dynamic id;

  TurntableRecordialog(this.id, {super.key});

  @override
  State<StatefulWidget> createState() => _TurntableRecordDialogState();
}

class _TurntableRecordDialogState extends State<TurntableRecordialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 312,
              height: 449,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(IMG.format("room/game/turntable_pic_dialog"))
                  )
              ),
              child: bodyView(),
            ),

            SizedBox(height: 12,),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              behavior: HitTestBehavior.translucent,
              child: Image.asset(IMG.format("room/game/turntable_rule_close"), width: 33, height: 33,),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyView() {
    return Column(
      children: [
        SizedBox(height: 27,),
        createTitle(),
        createTitleEffect(),

        Expanded(
          child: _SimpleRecord(widget.id, dataList),
        ),

        // 奖品
        SizedBox(height: 8,),
        createPrizeInfo(),

        // TurntableItemView({}),
        SizedBox(height: 24,),
      ],
    );
  }

  Widget createTitle() {
    return Text(
      "中奖记录",
      style: TextStyle(
          letterSpacing: 2,
          shadows: [
            Shadow(
              color: Color(0xff4e0092),
              offset: Offset(0, 1),
              blurRadius: 2,
            )
          ],
          color: Colors.white
      ),
    );
  }

  ValueNotifier<List> dataList = ValueNotifier([]);
  
  Widget createPrizeInfo() {
    return ValueListenableBuilder<List>(
      valueListenable: dataList,
      builder: (BuildContext context, List value, Widget? child) {
        int totalAmount = 0;
        int totalMoney = 0;
        value.forEach((element) {
          totalAmount += element["count"] as int;
          totalMoney += (element["price"] as int) * (element["count"] as int);
        });
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(width: double.infinity, height: 1,),
              Text(
                "共$totalAmount礼物",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),

              XRichText(
                  TextSpan(
                      children: [
                        TextSpan(
                          text: '总价值$totalMoney',
                          style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$SemiBold),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: MoneyIcon(type: MoneyType.diamond, size: 16),
                        )
                      ]
                  )
              ),

            ],
          ),
        );
      },
    );

  }

  Widget createTitleEffect() {
    return Image.asset(IMG.format("room/game/turntable_pic_guang"));
  }

}

class _SimpleRecord extends SimplePageView<Map> {

  dynamic id;

  ValueNotifier<List> dataList;

  _SimpleRecord(this.id, this.dataList);

  @override
  BaseConfig get config {
    return GridConfig(
      padding: Pad(horizontal: 20, top: 0, bottom: AppSize.safeBottom),
      gridDelegate: const XGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        fixedHeight: 0,
      ),
    );
  }

  @override
  Future fetchPage(PageNum page) async {
    var list = await Api.Activity.getLotteryRecord(id);
    dataList.value = list["items"];
    return list;
  }

  @override
  Widget itemBuilder(BuildContext context, Map<dynamic, dynamic> item, int index) {
    // TODO: implement itemBuilder
    return TurntableItemView(item, showNumber: true,);
  }

}