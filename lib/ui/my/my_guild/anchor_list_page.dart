import 'dart:ui';
import 'package:app/tools.dart';
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/my/my_guild/anchor_list_controller.dart';
import 'package:app/ui/my/my_guild/model/anchor_model.dart';
import 'package:app/widgets.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

/// 主播列表页面
class AnchorListPage extends StatelessWidget {
  const AnchorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnchorListController>(
        init: AnchorListController(),
        builder: (AnchorListController controller) {
          return Scaffold(
            appBar: xAppBar(title: '主播列表', actions: [
              Obx(() {
                return Text(controller.anchorApplyCount.value > 0 ? "申请(${controller.anchorApplyCount.value > 99 ? '99+' : controller.anchorApplyCount.value})" : "申请", style: const Color(0xFF000000).pt(14));
              }).toBtn(
                  onTap: () {
                    controller.clickAnchorApplyList();
                  }),
            ]),
            body: Column(
              children: [
                Spacing.h6,
                _headerWidget(),
                Expanded(
                    child:

                    EasyRefresh(
                      controller: controller.easyRefreshController,
                      onLoad: controller.loadMoreData,
                      //自定义样式
                      footer: ClassicFooter(
                          noMoreText: '没有更多数据了',
                          textStyle: const Color(0xFF999999).pt(14),
                          dragText: "",
                          armedText: "",
                          readyText: "",
                          processingText: "",
                          processedText: "",
                          noMoreIcon: const SizedBox.shrink(),
                          failedIcon: null,
                          failedText: "",
                          messageText: "",
                          messageStyle: const Color(0xFF999999).pt(14),
                          succeededIcon: null,
                          showMessage: false,
                          pullIconBuilder: null,
                          iconDimension: 0,
                          spacing: 0,
                          iconTheme: null
                      ),
                      child: Obx(() {
                        return ListView.builder(
                          // shrinkWrap: true,
                          controller: controller.scrollController,
                          itemCount: controller.dataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _itemWidget(controller, index);
                          },
                        );
                      }),
                    )
                ),
                _bottomWidget(),
              ],
            ),
          );
        });
  }

  /// 头部
  Widget _headerWidget() {
    return Container(
      height: 32,
      margin: const Pad(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Spacing.w20,
          Container(
            width: 30,
            alignment: Alignment.center,
            child: Text("头像", style: const Color(0xFF000000).ptB(14)),
          ),
          Spacing.w2,
          Expanded(
              child: Center(
                  child: Text("昵称", style: const Color(0xFF000000).ptB(14)))),
          Spacing.w2,
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text("ID", style: const Color(0xFF000000).ptB(14)),
          ),
          Spacing.w2,
          Container(
            width: 90,
            alignment: Alignment.center,
            child: Text("加入时间", style: const Color(0xFF000000).ptB(14)),
          ),
          Spacing.w10,
        ],
      ),
    );
  }

  /// 列表项
  Widget _itemWidget(AnchorListController controller, int index) {
    final AnchorModel anchorModel = controller.dataList[index];
    return Column(
      children: [
        Container(
          height: 50,
          padding: const Pad(horizontal: 10),
          child: Row(
            children: [
              Spacing.w20,
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: NetImage(
                    anchorModel.avatarUrl ?? '',
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain),
              ),
              Spacing.w2,
              Expanded(
                  child: Center(
                      child: Text(anchorModel.username ?? '',
                          style: const Color(0xFF000000).pt(14)))),
              Spacing.w2,
              Container(
                width: 80,
                alignment: Alignment.center,
                child: Text('${anchorModel.roleId ?? ''}',
                    style: const Color(0xFF000000).pt(14)),
              ),
              Spacing.w2,
              Container(
                width: 90,
                alignment: Alignment.center,
                child:
                Text(anchorModel.intoTimeString,
                    style: const Color(0xFF000000).pt(14)),
              ),
              Spacing.w10,
            ],
          ),
        ),
        const Padding(
          padding: Pad(horizontal: 20),
          child: Divider(
            color: Color(0xFFE5E5E5),
          ),
        )
      ],
    );
  }

  /// 底部
  Widget _bottomWidget() {
    return SizedBox(
      height: MediaQueryData
          .fromView(window)
          .padding
          .bottom,
    );
  }
}
