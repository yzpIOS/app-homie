
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
        cteateTextView(),
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