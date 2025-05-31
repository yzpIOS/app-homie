import 'dart:ui';

import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/create/moment_create_page.dart';
import 'package:app/ui/moment/index/moment_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TopicMomentPage extends StatelessWidget {
  final Map topic;

  const TopicMomentPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background2,
      appBar: xAppBar(bgColor: Colors.transparent, actions: _actions()),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          _Header(topic: topic),
          Expanded(
            child: ConfigList(
              config: ListConfig(
                padding: Pad(top: 0, bottom: AppSize.safeBottom),
                divider: Spacing.h10,
              ),
              child: MomentView(api: (page) => Api.Moment.list(page: page, topicId: topic['id'])),
            ),
          ),
        ],
      ),
    );
  }

  _actions() {
    return 'moment/ic_moment'.toSvgAction(
      color: Colors.white,
      onPressed: () async {
        if(!(await OAuthCtrl.checkValid())) {
          return;
        }
        Get.to(() => MomentCreatePage(topic: topic));
      },
    );
  }
}

class _Header extends StatefulWidget {
  final Map topic;

  const _Header({required this.topic});

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  final dataRx = RxMap();

  late final topic = widget.topic;

  @override
  void initState() {
    super.initState();

    Api.Moment.topicDetail(id: topic['id']).onType<Map>(dataRx);
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      children: [
        ClipRRect(
          borderRadius: AppBorderRadius.a4,
          child: Obx(
            () => NetImage(dataRx['image'], width: 70, height: 70, fit: BoxFit.cover),
          ),
        ),
        Spacing.w10,
        Expanded(
          child: DefaultTextStyle.merge(
            style: const TextStyle(fontSize: 12, color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing.h4,
                XText(
                  '#${topic['name']}#',
                  style: const TextStyle(fontSize: 18, fontWeight: fw$SemiBold),
                ),
                Spacing.h2,
                Obx(() {
                  final count = dataRx['dynamic_count'];

                  return count is int ? XText('$count条动态') : Spacing.blank;
                }),
                Spacing.h2,
                Obx(() {
                  final tips = dataRx['description'];

                  return tips is String ? XText(tips) : Spacing.blank;
                }),
              ],
            ),
          ),
        ),
        Spacing.w10,
      ],
    );

    child = Stack(
      children: [
        Positioned.fill(child: $BgView()),
        Container(
          height: 70,
          margin: Pad(all: 10, top: AppSize.safeTop + AppSize.appBar),
          child: child,
        ),
      ],
    );

    return child;
  }

  Widget $BgView() {
    Widget child = Obx(() {
      return NetImage(
        dataRx['background_image'] ?? dataRx['image'],
        fit: BoxFit.cover,
      );
    });

    child = ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.20)),
        position: DecorationPosition.foreground,
        child: child,
      ),
    );

    child = ClipRect(child: child);

    return child;
  }
}
