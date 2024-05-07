import 'package:app/ui/my/guild_center/guild_center_controller.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

/// 公会中心页面
class GuildCenterPage extends StatelessWidget {
  const GuildCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuildCenterController>(
      init: GuildCenterController(),
      builder: (GuildCenterController controller) {
        return DefaultTabController(
          initialIndex: 0,
          length: controller.tabs.length,
          child: Scaffold(
            appBar: xAppBar(title: xAppBar$TabBar(controller.tabs.keys)),
            body: TabBarView(
              children: controller.tabs.values.toList(growable: false),
            ),
          ),
        );
        }
    );
  }

}