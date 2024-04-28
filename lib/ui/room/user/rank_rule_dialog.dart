
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RankRuleDialog extends StatelessWidget {

  static void showDialog2() async {
    showDialog(context: Get.context!, builder: (context) {
      return RankRuleDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 57, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFAFDFE),
              Color(0xFFECF5FD),
            ]
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(IMG.format("close"), width: 24, height: 24,),
            ),
            Text(
              "榜单更新规则",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              "日榜:每日0点更新",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Text(
              "周榜:每周一0点更新",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Text(
              "月榜:每月1日起重新累计",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      
    );
  }

}