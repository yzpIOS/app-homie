import 'dart:ui';
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/my/my_guild/anchor_list_controller.dart';
import 'package:app/ui/my/my_guild/model/anchor_model.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
