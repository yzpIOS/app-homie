import 'package:app/tools.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/message/conv_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ConvDialog extends StatelessWidget {
  const ConvDialog._();

  static void show() {
    OrientationSheet.show(
      child: const ConvDialog._(),
      direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationSheet.scaffold(
      title: '消息',
      body: const ConvView(),
    );
  }
}
