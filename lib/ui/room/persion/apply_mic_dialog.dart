
import 'package:app/tools.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

///
/// 个播：申请上麦
///
class ApplyMicDialog extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ApplyMicState();

  static void show() {
    showDialog(context: Get.context!, builder: (context) {
      return ApplyMicDialog();
    });
  }
}

class _ApplyMicState extends State<ApplyMicDialog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 303,
          height: 161,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 27,),
              Text(
                "房主已开启上麦申请",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 14,),
              Text(
                "是否申请上麦",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  _createCancelButton(),
                  const Expanded(child: SizedBox()),
                  _createAgreeButton(),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createCancelButton() {
    return Container(
      width: 117,
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF7F95F7),
            Color(0xFF9ABCFF),
          ]
        ),
        borderRadius: BorderRadius.circular(1000),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF7F95F7).withAlpha(20),
            offset: Offset(4.0, 0.0),
            spreadRadius: 8.0,
            blurRadius: 3,
          )
        ]
      ),
      child: Text(
        "取消",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }


  Widget _createAgreeButton() {
    return Container(
      width: 117,
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFFF7A665),
                Color(0xFFFFC893),
              ]
          ),
          borderRadius: BorderRadius.circular(1000),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFFFC394).withAlpha(20),
              offset: Offset(4.0, 0.0),
              spreadRadius: 8.0,
              blurRadius: 5,
            )
          ]
      ),
      child: Text(
        "申请",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }


}