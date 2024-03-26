
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/game/turntable/turntable_item_view.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/list/list_config.dart';
import 'package:app/widgets/list/list_ctrl.dart';
import 'package:app/widgets/list/simple_list.dart';
import 'package:flutter/material.dart';

class TurntableRecordialog extends StatefulWidget {

  TurntableRecordialog({super.key});

  @override
  State<StatefulWidget> createState() => _TurntableRecordDialogState();
}

class _TurntableRecordDialogState extends State<TurntableRecordialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
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

        ],
      ),
    );
  }

  Widget bodyView() {
    return Column(
      children: [
        SizedBox(height: 27,),
        createTitle(),
        createTitleEffect(),

        SizedBox(height: 12,),
        // _SimpleRecord(),

        TurntableItemView({}),
        SizedBox(height: 12,),
      ],
    );
  }

  Widget createTitle() {
    return Text(
      "活动规则",
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
  Future fetchPage(PageNum page) {
    return Future.value([{}, {}]);
  }

  @override
  Widget itemBuilder(BuildContext context, Map<dynamic, dynamic> item, int index) {
    // TODO: implement itemBuilder
    return TurntableItemView({});
  }

}