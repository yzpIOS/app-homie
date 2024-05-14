import 'dart:ui';
import 'package:app/common/theme.dart';
import 'package:app/store/user/user_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/num_utils.dart';
import 'package:app/ui/my/guild_center/guild_center_list_controller.dart';
import 'package:app/ui/my/guild_center/model/guild_model.dart';
import 'package:app/ui/my/guild_center/widget/guild_name_and_level_widget.dart';
import 'package:app/widgets/editable_text.dart';
import 'package:app/widgets/image/network_cache_image.dart';
import 'package:app/widgets/spacing.dart';
import 'package:app/widgets/text.dart';
import 'package:app/widgets/tips_view.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 公会榜单页面
class GuildCenterListPage extends StatelessWidget {
  const GuildCenterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuildCenterListController>(
        init: GuildCenterListController(),
        builder: (GuildCenterListController controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: Pad(left: 20, top: 10),
                child: Text('公会榜单'),
              ),
              Box(
                height: AppSize.appBar,
                padding: const Pad(horizontal: 20, vertical: 10),
                alignment: Alignment.centerLeft,
                child: XInputView(
                  controller: controller.textController,
                  focusNode: controller.keywordFocus,
                  height: 32,
                  autofocus: false,
                  hintText: '搜索公会名称/ID',
                  textInputAction: TextInputAction.search,
                  prefixIcon: Container(
                    width: 24,
                    height: 24,
                    margin: const Pad(left: 10, right: 5, top: 2),
                    child: Image.asset(IMG.format('my/icon_search_grey'),
                        width: 24, height: 24),
                  ),
                  onSubmitted: (value) {
                    controller.clickSearch();
                  },
                ),
              ),
              Obx(() {
                return controller.loadedData.value == true
                    ? Expanded(
                        child: controller.dataList.isNotEmpty
                            ? SmartRefresher(
                                enablePullDown: false,
                                enablePullUp: true,
                                header: null,
                                footer: CustomFooter(
                                  builder:
                                      (BuildContext context, LoadStatus? mode) {
                                    if (mode == LoadStatus.noMore) {
                                      return const Box(
                                        height: 32,
                                        alignment: Alignment.center,
                                        child: Text(
                                          '---- 没有更多了 ----',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppPalette.tips),
                                        ),
                                      );
                                    } else {
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
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return _itemWidget(controller, index);
                                    },
                                  );
                                }),
                              )
                            : const TipsView(),
                      )
                    : const SizedBox();
              }),
              SizedBox(
                height: MediaQueryData.fromView(window).padding.bottom,
              ),
            ],
          );
        });
  }

  /// 列表项
  Widget _itemWidget(GuildCenterListController controller, int index) {
    final GuildModel guildModel = controller.dataList[index];
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => controller.clickItem(index),
      child: Container(
        height: 80,
        margin: const Pad(horizontal: 10, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF6F9FF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacing.w10,
            Container(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                child: index + 1 < 4
                    ? Image.asset(
                        IMG.format('my/guild_center_index_${index + 1}'),
                        width: 30,
                        height: 30)
                    : Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF000000),
                        ),
                      )),
            Spacing.w4,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: NetImage(guildModel.icon,
                  placeholderImage: Image.asset(
                      IMG.format('my/guild_center_normal_icon'),
                      width: 60,
                      height: 60),
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain),
            ),
            Spacing.w10,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GuildNameAndLevelWidget(guildModel: guildModel),
                  Spacing.h1,
                  Row(
                    children: [
                      Text("ID:${guildModel.guildNo}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999),
                          )),
                      const Spacing(),
                      Text(
                        "贡献值：${NumberUtils.instance.formatNumber(guildModel.value ?? 0)}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  Spacing.h1,
                  XRichText(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: const Pad(right: 4),
                            child: Image.asset(
                              IMG.format('my/guild_center_user_count'),
                              width: 14,
                              height: 14,
                              scale: 3,
                              color: const Color(0xFF999999),
                            ),
                          ),
                          alignment: PlaceholderAlignment.middle,
                        ),
                        TextSpan(
                          text: '${guildModel.anchorNum}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacing.w10,
          ],
        ),
      ),
    );
  }
}
