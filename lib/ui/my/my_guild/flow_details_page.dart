import 'dart:ui';
import 'package:app/tools.dart';
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/my/my_guild/flow_details_controller.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

/// 流水详情页面
class FlowDetailsPage extends StatelessWidget {
  const FlowDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlowDetailsController>(
        init: FlowDetailsController(),
        builder: (FlowDetailsController controller) {
          return Scaffold(
            appBar: xAppBar(title: '流水详情'),
            body: ColoredBox(
              color: Colors.white,
              child: Column(
                children: [
                  Spacing.h10,
                  _searchWidget(controller),
                  Spacing.h16,
                  _headerWidget(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return _itemWidget(controller, index);
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQueryData.fromView(window).padding.bottom,
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// 搜索
  Widget _searchWidget(FlowDetailsController controller) {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          Spacing.w30,
          Obx(() => Text(
              controller.searchStartTime.isNotEmpty
                  ? controller.searchStartTime.value
                  : "起始时间",
              style: controller.searchStartTime.isNotEmpty
                  ? const Color(0xFF000000).pt(12)
                  : const Color(0xFF999999).pt(12))
              .toBtn(
              height: 32,
              width: 80,
              radius: 4,
              bg: const Color(0xFFFBF5FF),
              onTap: () {
                controller.clickSearchStartTime();
              })),
          Spacing.w2,
          Container(
            width: 10,
            height: 1,
            color: const Color(0xFFCCCCCC),
          ),
          Spacing.w2,
          Obx(() => Text(
              controller.searchEndTime.isNotEmpty
                  ? controller.searchEndTime.value
                  : "终止时间",
              style: controller.searchEndTime.isNotEmpty
                  ? const Color(0xFF000000).pt(12)
                  : const Color(0xFF999999).pt(12))
              .toBtn(
              height: 32,
              width: 80,
              radius: 4,
              bg: const Color(0xFFFBF5FF),
              onTap: () {
                controller.clickSearchEndTime();
              })),
          const Spacing(),
          Text("搜索", style: Colors.white.pt(14)).toBtn(
              width: 54,
              height: 28,
              radius: 16,
              bg: const Color(0xFFC05EFB),
              onTap: () {
                controller.clickSearch();
              }),
          Spacing.w30,
        ],
      ),
    );
  }

  /// 列表头
  Widget _headerWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Center(child: Text('时间',style:const Color(0xFF000000).ptB(14),))
        ),
        Expanded(
            flex: 1,
            child: Center(child: Text('流水',style:const Color(0xFF000000).ptB(14),))
        ),
      ],
    );
  }

  /// 列表项
  Widget _itemWidget(FlowDetailsController controller, int index) {
    return Container(
      height: 40,
      margin: const Pad(top: 10, horizontal: 10),
      // padding: const Pad(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFF5F5F5),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Center(child: Text('2024-4-18',style:const Color(0xFF000000).pt(14),))
          ),
          Spacing.w10,
          Expanded(
              flex: 1,
              child: Center(child: Text("1234567${index + 1}",style:const Color(0xFF000000).pt(14),))
          ),
        ],
      ),
    );
  }
}