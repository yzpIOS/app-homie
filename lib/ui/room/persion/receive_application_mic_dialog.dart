
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

///
/// 房主或者是管理员收到上麦申请
///
class ReceiveApplicationMicDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReceiveApplicationMicDialogState();

  static void show() {
    showDialog(context: Get.context!, builder: (context) {
      return ReceiveApplicationMicDialog();
    });
  }
}

class _ReceiveApplicationMicDialogState extends State<ReceiveApplicationMicDialog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 303,
          height: 171,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 27,),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AsyncAvatar(uid: "aa", size: 46.5,),
                  SizedBox(width: 4.5,),
                  Text(
                    "申请人名字",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                "申请上麦",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 15,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _createCancelButton(),
                  Expanded(child: SizedBox()),
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
        "拒绝",
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
        "同意",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }


}