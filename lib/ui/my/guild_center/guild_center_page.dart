import 'package:app/ui/my/guild_center/guild_center_page_controller.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

/// 公会中心页面
class GuildCenterPage extends StatelessWidget {
  const GuildCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuildCenterPageController>(
        init: GuildCenterPageController(),
        builder: (GuildCenterPageController controller) {
          return Obx(() {
            return controller.checkExistGuild.value == true
                ? DefaultTabController(
                    initialIndex: 0,
                    length: controller.tabs.length,
                    child: Scaffold(
                      appBar: xAppBar(
                          title: controller.tabs.keys.length > 1
                              ? xAppBar$TabBar(controller.tabs.keys)
                              : '公会中心'),
                      body: TabBarView(
                        children:
                            controller.tabs.values.toList(growable: false),
                      ),
                    ),
                  )
                : Scaffold(
                    appBar: xAppBar(title: '公会中心'),
                    body: const SizedBox(),
                  );
          });
        });
  }
}
