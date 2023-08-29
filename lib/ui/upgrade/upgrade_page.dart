
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class UpGradePage extends StatelessWidget {

  static void showDialog() {
    UpGradePage().also((it) {
      Get.dialog(it, routeSettings: it.toRouteSettings());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Stack(
          children: [
            // 背景
            Image.asset(
              IMG.format('app_upgrade'),
              width: 300,
              height: 412,
            ),

            Container(
              width: 300,
              height: 412,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 185,),
                  // 标题
                  _createTitle(),
                  // 更新描述
                  SizedBox(height: 10,),
                  _createDesc(),
                  // 底部按钮
                  _createButton(),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createTitle() {
    return Row(
      children: [
        const Text(
          "更新说明",
          style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 16,
              fontWeight: FontWeight.normal
          ),
        ),
        const Expanded(child: SizedBox()),
        const Text(
          "版本：1.1.1",
          style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 14,
              fontWeight: FontWeight.normal
          ),
        ),
      ],
    );
  }

  Widget _createDesc() {
    return Expanded(
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "修复已知bug",
          style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 14,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    );
  }

  Widget _createButton() {
    return Row(
      children: [
        // 下次再说
        Expanded(
          child: GestureDetector(
            onTap: () {

            },
            child: Container(
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(1000),
              ),
              child: const Text(
                "下次再说",
                style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20,),
        // 立即升级
        Expanded(
          child: GestureDetector(
            onTap: () {

            },
            child: Container(
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFBD7CE5),
                borderRadius: BorderRadius.circular(1000),
              ),
              child: const Text(
                "立即升级",
                style: TextStyle(
                    color: Color(0xFFF5F5F5),
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}