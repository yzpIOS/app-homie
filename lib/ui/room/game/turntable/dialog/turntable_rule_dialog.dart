
import 'package:app/tools.dart';
import 'package:flutter/material.dart';

class TurntableRuleDialog extends StatefulWidget {

  String content;

  TurntableRuleDialog(this.content, {super.key});

  @override
  State<StatefulWidget> createState() => _TurntableRuleDialogState();
}

class _TurntableRuleDialogState extends State<TurntableRuleDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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

        SizedBox(height: 12,),
        cteateTextView(),
        SizedBox(height: 12,),
      ],
    );
  }

  Widget createTitle() {
    return Text(
      "活动规则",
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

  Widget createTitleEffect() {
    return Image.asset(IMG.format("room/game/turntable_pic_guang"));
  }

  Widget cteateTextView() {
    return Container(
      height: 332,
      padding: EdgeInsets.only(left: 30, right: 30),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          Text(
            widget.content,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.normal
            ),
          )
        ],
      ),
    );
  }
}