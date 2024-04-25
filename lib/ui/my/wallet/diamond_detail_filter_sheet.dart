
import 'package:app/common/theme.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import '../../../tools.dart';

class DiamondDetailFilterSheet extends StatelessWidget {

  ValueNotifier<String> valueNotifier;

  DiamondDetailFilterSheet(this.valueNotifier);

  static Future<String?> show({String defValue = "全部"}) {
    const decor = ShapeDecoration(
        shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
        color: Colors.white
    );

    return OrientationSheet.show<String>(
      barrierColor: Colors.black.withAlpha(150),
      child: DiamondDetailFilterSheet(ValueNotifier(defValue)),
      bgColor: Colors.transparent,
      minHeight: 0,
      decoration: decor,
      constraints: BoxConstraints(
        minHeight: 240,
        maxHeight: 241,
      ),
      direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          createTitle(),

          Expanded(child: createGridView()),
        ],
      ),
    );
  }

  Widget createTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20, height: 65,),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          behavior: HitTestBehavior.opaque,
          child: Text(
            "取消",
            style: TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),


        Expanded(
          child: Text(
            "筛选",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Get.back(result: valueNotifier.value);
          },
          behavior: HitTestBehavior.opaque,
          child: Text(
            "确定",
            style: TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),

        SizedBox(width: 20, height: 65,),
      ],
    );
  }

  Widget createGridView() {
    var items = ["全部", "赠送", "充值", "支出"];
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (BuildContext context, String value, Widget? child) {
        return GridView.builder(
          padding: EdgeInsets.only(left: 10, right: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.8667,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                valueNotifier.value = items[index];
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: value == items[index] ? Color(0xFFF5F2FF) : Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(4),
                  border: value == items[index] ? Border.all(color: Color(0xFFD085FF), width: 1) : null,
                ),
                child: Text(
                  items[index],
                  style: TextStyle(
                    color: value == items[index] ? Color(0xFFBC7CE5) : Color(0xFF030303),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            );
          },
          itemCount: items.length,
        );
      }
    );
  }
}