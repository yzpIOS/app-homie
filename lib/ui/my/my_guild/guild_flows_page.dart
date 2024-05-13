import 'dart:ui';
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/my/my_guild/guild_flows_controller.dart';
import 'package:app/ui/my/my_guild/model/guild_flow_model.dart';
import 'package:app/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 公会流水页面
class GuildFlowsPage extends StatelessWidget {
  const GuildFlowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuildFlowsController>(
        init: GuildFlowsController(),
        builder: (GuildFlowsController controller) {
          return Scaffold(
            appBar: xAppBar(title: '公会流水'),
            body: Column(
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
                          itemBuilder: (BuildContext context, int index) {
                            return _itemWidget(controller, index);
                          },
                        );
                      }),
                    ),
                ),
                Spacing.h2,
                _bottomWidget(controller),
              ],
            ),
          );
        });
  }

  /// 搜索
  Widget _searchWidget(GuildFlowsController controller) {
    return Container(
      height: 32,
      padding: const Pad(horizontal: 10),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                controller: controller.searchRoomIdController,
                keyboardType: TextInputType.number,
                focusNode: controller.searchRoomIdFocus,
                decoration: const InputDecoration(
                  hintText: '请输入房间ID',
                  border: InputBorder.none,
                  //去掉输入框的下滑线
                  contentPadding: EdgeInsets.all(0),
                  //解决文字无法居中
                  fillColor: Color(0xFFFBF5FF),
                  filled: true,
                  hintStyle: TextStyle(fontSize: 12, color: Color(0xFF999999)),
                  labelStyle: TextStyle(fontSize: 12, color: Color(0xFF000000)),
                  enabledBorder: OutlineInputBorder(
                    /*边角*/
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    gapPadding: 0,
                    borderSide: BorderSide(
                      color: Color(0xFFFBF5FF),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    gapPadding: 0,
                    borderSide: BorderSide(
                      color: Color(0xFFFBF5FF),
                    ),
                  ),
                ),
                textAlign: TextAlign.center,
              )),
          Spacing.w10,
          Obx(() =>
              Text(
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
          Obx(() =>
              Text(
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
          Spacing.w10,
          Text("搜索", style: Colors.white.pt(14)).toBtn(
              width: 54,
              height: 28,
              radius: 16,
              bg: const Color(0xFFC05EFB),
              onTap: () {
                controller.clickSearch();
              }),
        ],
      ),
    );
  }

  /// 列表头
  Widget _headerWidget() {
    return Container(
      height: 20,
      padding: const Pad(horizontal: 10),
      child: Row(
        children: [
          Expanded(
              child: Center(
                  child: Text(
                      "房间名称", style: const Color(0xFF000000).ptB(14)))),
          Spacing.w10,
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text("房间ID", style: const Color(0xFF000000).ptB(14)),
          ),
          Spacing.w2,
          Container(
            width: 10,
            height: 1,
            color: Colors.transparent,
          ),
          Spacing.w2,
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text("流水", style: const Color(0xFF000000).ptB(14)),
          ),
          Spacing.w10,
          Container(
            width: 54,
            alignment: Alignment.center,
            child: Text("详情", style: const Color(0xFF000000).ptB(14)),
          ),
        ],
      ),
    );
  }

  /// 列表项
  Widget _itemWidget(GuildFlowsController controller, int index) {
    final GuildFlowModel guildFlowModel = controller.dataList[index];
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
              child: Center(
                  child: Text(guildFlowModel.roomName ?? '',
                      style: const Color(0xFF000000).pt(14)))),
          Spacing.w10,
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text('${guildFlowModel.roomId ?? ''}',
                style: const Color(0xFF000000).pt(14)),
          ),
          Spacing.w2,
          Container(
            width: 10,
            height: 1,
            color: Colors.transparent,
          ),
          Spacing.w2,
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text("${guildFlowModel.amount ?? '0'}",
                style: const Color(0xFF000000).pt(14)),
          ),
          Spacing.w10,
          Text("详情", style: const Color(0xFFC05EFB).pt(14)).toBtn(
              width: 54,
              height: 30,
              onTap: () {
                controller.clickFlowDetail(index);
              }),
        ],
      ),
    );
  }

  /// 底部
  Widget _bottomWidget(GuildFlowsController controller) {
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
                return Text(
                    controller.totalAmount.string, style: const Color(0xFFC05EFB).ptB(16));
              }),
              Spacing.w20,
            ],
          ),
          Spacing.h16,
          SizedBox(
            height: MediaQueryData
                .fromView(window)
                .padding
                .bottom,
          ),
        ],
      ),
    );
  }
}
