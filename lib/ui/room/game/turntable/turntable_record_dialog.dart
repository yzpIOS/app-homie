
import 'package:app/tools.dart';
import 'package:flutter/material.dart';

class TurntablePrizeDialog extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TurntablePrizeDialogState();
}

class _TurntablePrizeDialogState extends State<TurntablePrizeDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: 312,
        height: 449,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(IMG.format("room/game/turntable_pic_dialog"))
            )
        ),
        child: bodyView(),
      ),
    );
  }

  Widget bodyView() {
    return Column(
      children: [
        createTitle(),
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
          ]
      ),
    );
  }
}