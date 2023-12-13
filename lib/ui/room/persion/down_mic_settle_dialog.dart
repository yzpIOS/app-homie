
import 'package:app/common/theme.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

///
/// 个播：个播结算页面
///
class DownMicSettleDialog extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _DownMicSettleState();

  static void show() {
    showDialog(context: Get.context!, builder: (context) {
      return DownMicSettleDialog();
    });
  }
}

class _DownMicSettleState extends State<DownMicSettleDialog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 303,
          height: 304,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Color(0XFFFAFDFE),
                Color(0XFFECF5FD),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            children: [
              _createContentView(),

              _createClose(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createContentView() {
    return Column(
      children: [
        SizedBox(height: 30,),
        AsyncAvatar(uid: OAuthCtrl.uid, size: 70,),

        // 用户名
        SizedBox(height: 5,),
        Text(
          "哈哈哈哈哈哈",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        // 用户id
        SizedBox(height: 2,),
        Text(
          "ID:123468",
          style: TextStyle(
            fontSize: 12,
            color: Color(0XFF666666),
            fontWeight: FontWeight.w400,
          ),
        ),

        // 开播时长和收的礼物数量
        SizedBox(height: 14,),
        _createItem("01:15:29", "开播时长", "100000", "礼物收益"),

        // 直播间人数，打赏人数
        SizedBox(height: 28,),
        _createItem("150000", "直播间人数", "100000", "打赏人数"),

        SizedBox(height: 30,),
      ],
    );
  }

  Widget _createItem(String value, String title, String value2, String title2) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        // 开播时长
        Expanded(
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2,),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0XFF666666),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),

        Container(width: 1, height: 20, color: Color(0XFFCCCCCC).withAlpha(200)),

        Expanded(
          child: Column(
            children: [
              Text(
                value2,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2,),
              Text(
                title2,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0XFF666666),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
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

  Widget _createClose() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Image.asset(IMG.format("close"), width: 24, height: 24,),
      ),
    );
  }
}