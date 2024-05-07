import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/my/guild_center/guild_center_list_controller.dart';
import 'package:app/widgets/editable_text.dart';
import 'package:app/widgets/icon_text_button.dart';
import 'package:app/widgets/spacing.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

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
                  height: 32,
                  autofocus: false,
                  hintText: '搜索公会名称/ID',
                  textInputAction: TextInputAction.search,
                  prefixIcon: Container(
                    width: 24,
                    height: 24,
                    margin: const Pad(left: 10, right: 5, top: 2),
                    child: const Icon(Icons.search_rounded,
                        size: 18, color: AppPalette.c9),
                  ),
                  onSubmitted: controller.keywordRx,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap:true,
                  controller: controller.scrollController,
                  itemCount: controller.dataList.length,
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _itemWidget(index);
                  },
                ),
              ),
            ],
          );
        });
  }

  Widget _itemWidget(int index) {
    return SizedBox(
      height: 80,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacing.w20,
          Container(
            alignment: Alignment.center,
              height: 30,
              width: 30,
              child: index + 1 < 4
                  ? Image.asset(IMG.format('my/guild_center_index_${index + 1}'),
                      width: 24, height: 24, scale: 3)
                  : Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )),
          Spacing.w4,
          CachedNetworkImage(
            imageUrl: 'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF',
            width: 60,
            height: 60,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Spacing.w10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "公会名称",
                      style: const TextStyle(fontSize: 16, color: Colors.black,height: 1.5),
                    ),
                    Spacing.w4,
                    index + 1 < 6
                        ? Image.asset(
                        IMG.format('my/guild_center_level_${index + 1}'),
                        width: 53,
                        height: 17,
                        scale: 3)
                        : const SizedBox(),
                  ],
                ),
                Row(
                  children: [
                    Text("ID:1234567",
                        style: const TextStyle(fontSize: 12, color: Colors.grey,height: 1.5)),
                    Spacing(),
                    Text(
                      "贡献值：10.3W",
                      style: const TextStyle(fontSize: 14, color: Colors.black,height: 1.5),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(IMG.format('my/guild_center_user_count'),
                        width: 14, height: 14, scale: 3),
                    Spacing.w4,
                    Text("1111",
                        style: const TextStyle(fontSize: 12, color: Colors.black,height: 1.5)),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                )
              ],
            ),
          ),
          Spacing.w20,
        ],
      ),
    );
  }
}
