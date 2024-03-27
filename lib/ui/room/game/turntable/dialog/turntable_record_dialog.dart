
import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
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
          child: _SimpleRecord(widget.id),
        ),

        // TurntableItemView({}),
        SizedBox(height: 12,),
      ],
    );
  }

  Widget createTitle() {
    return Text(
      "中奖记录",
      style: TextStyle(
          shadows: [
            Shadow(
              color: Color(0xff4e0092),
              offset: Offset(1, 0),
              blurRadius: 2,
            )
          ],
          color: Colors.white
      ),
    );
  }

  Widget createTitleEffect() {
    return Image.asset(IMG.format("room/game/turntable_pic_guang"));
  }

}

class _SimpleRecord extends SimplePageView<Map> {

  dynamic id;

  _SimpleRecord(this.id);

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
  Future fetchPage(PageNum page) {
    return Api.Activity.getLotteryRecord(id);
  }

  @override
  Widget itemBuilder(BuildContext context, Map<dynamic, dynamic> item, int index) {
    // TODO: implement itemBuilder
    return TurntableItemView(item, showNumber: true,);
  }

}