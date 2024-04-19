import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/create/moment_create_page.dart';
import 'package:app/ui/moment/index/moment_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class MomentPage extends StatefulWidget {
  const MomentPage({super.key});

  @override
  State<MomentPage> createState() => _MomentPageState();
}

class _MomentPageState extends State<MomentPage> with SingleTickerProviderStateMixin, BusStateMixin {
  final data = {
    '推荐': MomentView(api: (page) => Api.Moment.recommendList(page: page), autoRefresh: true),
    '朋友': MomentView(api: (page) => Api.Moment.followList(page: page)),
    '附近': MomentView(api: (page) => Api.Moment.nearbyList(page: page)),
  };

  late final controller = TabController(vsync: this, length: data.length);

  @override
  void initState() {
    super.initState();

    on<MomentRefreshEvent>(
      (_) => controller.index = 0,
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background2,
      appBar: xAppBar(
        title: xAppBar$TabBar(
          data.keys,
          controller: controller,
          alignment: Alignment.bottomLeft,
        ),
        actions: _actions(),
      ),
      body: ConfigList(
        config: ListConfig(
          divider: Spacing.h10,
          padding: Pad(bottom: 64),
        ),
        child: TabBarView(
          controller: controller,
          children: data.values
              .map((it) => (_) => it)
              .map((it) => DelayView(keepAlive: true, builder: it))
              .toList(growable: false),
        ),
      ),
    );
  }

  _actions() {
    return 'moment/ic_moment'.toSvgAction(
      onPressed: () async  {
        if(!(await OAuthCtrl.checkValid())) {
          return;
        }
        Get.to(() => const MomentCreatePage());
      },
    );
  }
}
