import 'dart:ui';
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/my/my_guild/flow_details_controller.dart';
import 'package:app/ui/my/my_guild/model/guild_room_flow_model.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 流水详情页面
class FlowDetailsPage extends StatelessWidget {
  /// 房间号
  final String roomNumber;

  const FlowDetailsPage({super.key, required this.roomNumber});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlowDetailsController>(
        init: FlowDetailsController(roomNumber: roomNumber),
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
                      child:
                      SmartRefresher(
                        enablePullDown: false,
                        enablePullUp: true,
                        header: null,
                        footer: CustomFooter(
                          builder: (BuildContext context,LoadStatus? mode){
                            if(mode == LoadStatus.noMore){
                              return const Box(
                                height: 32,
                                alignment: Alignment.center,
                                child: Text(
                                  '---- 没有更多了 ----',
                                  style: TextStyle(fontSize: 14, color: AppPalette.tips),
                                ),
                              );
                            }else{
                              return const SizedBox();
                            }
                          },
                        ),
                        controller: controller.refreshController,
                        onLoading: controller.loadMoreData,
                        child: Obx(() {
                          return ListView.builder(
                            shrinkWrap: true,
                            controller: controller.scrollController,
                            itemCount: controller.dataList.length,
                            itemExtent: 40,
                            itemBuilder: (BuildContext context, int index) {
                              return _itemWidget(controller, index);
                            },
                          );
                        }),
                      ),
                  ),
                  _bottomWidget(controller),
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
  Widget _headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Center(
                child: Text(
              '时间',
              style: const Color(0xFF000000).ptB(14),
            ))),
        Expanded(
            flex: 1,
            child: Center(
                child: Text(
              '流水',
              style: const Color(0xFF000000).ptB(14),
            ))),
      ],
    );
  }

  /// 列表项
  Widget _itemWidget(FlowDetailsController controller, int index) {
    final GuildRoomFlowModel guildRoomFlowModel = controller.dataList[index];
    return Container(
      height: 40,
      margin: const Pad(top: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFF5F5F5),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                guildRoomFlowModel.date ?? '',
                style: const Color(0xFF000000).pt(14),
              ))),
          Spacing.w10,
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                "${guildRoomFlowModel.amount ?? 0}",
                style: const Color(0xFF000000).pt(14),
              ))),
        ],
      ),
    );
  }

  /// 底部
  Widget _bottomWidget(FlowDetailsController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.1),
              offset: const Offset(0.0, -2.0), //阴影y轴偏移量
              blurRadius: 4, //阴影模糊程度
              spreadRadius: 1 //阴影扩散程度
              )
        ],
      ),
      child: Column(
        children: [
          Spacing.h16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacing.w20,
              Text("总流水：", style: const Color(0xFFC05EFB).ptB(16)),
              const Spacing(),
              Obx(() {
                return Text(controller.totalAmount.string,
                    style: const Color(0xFFC05EFB).ptB(16));
              }),
              Spacing.w20,
            ],
          ),
          Spacing.h16,
          SizedBox(
            height: MediaQueryData.fromView(window).padding.bottom,
          ),
        ],
      ),
    );
  }
}
