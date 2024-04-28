
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
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 250,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Image.asset(IMG.format("close"), width: 24, height: 24,),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "榜单更新规则",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 30,),
              Text(
                "日榜:每日0点更新",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),


              SizedBox(height: 15,),
              Text(
                "周榜:每周一0点更新",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 15,),
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
      ),
      
    );
  }

}