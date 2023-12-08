import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import '../common/money_icon.dart';

/// 任务中心
class TaskCenterPage extends StatefulWidget {
  final int initIndex;

  const TaskCenterPage({super.key, this.initIndex = 0});

  @override
  State<TaskCenterPage> createState() => _TaskCenterPageState();
}

class _TaskCenterPageState extends State<TaskCenterPage> {
  final tabs = {
    '每日任务': const TaskMainView(taskListType: 1),
    '成长任务': const TaskMainView(taskListType: 2),
  };
  static double bgHeight = AppSize.width / 375 * 221.5;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initIndex,
      length: tabs.length,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: xAppBar(
          bgColor: AppPalette.transparent,
          title: $TabBar(),
        ),
        body: $Body(),
      ),
    );
  }

  Widget $TabBar() {
    Widget child = TabBar(
      tabAlignment: TabAlignment.center,
      labelPadding: const Pad(horizontal: 19),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const UnderlineTabIndicator(
        borderRadius: AppBorderRadius.max,
        borderSide: BorderSide(width: 2.5, color: Colors.white),
      ),
      indicatorPadding: const Pad(horizontal: 15),
      labelStyle: const TextStyle(fontSize: 18, fontWeight: fw$Medium),
      unselectedLabelStyle: const TextStyle(fontSize: 18, fontWeight: fw$Medium),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      padding: const Pad(vertical: (AppSize.appBar - 30) / 2),
      tabs: tabs.keys.map((it) => Tab(text: it, height: 30,)).toList(growable: false),
    );

    return Align(
      alignment: Alignment.bottomCenter,
      child:child
    );
  }

  Widget $Body() {
    return Stack(
      children: [
        Positioned.fill(
          child: $BgView(),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: AppSize.appBar + AppSize.safeTop,
          bottom: 0,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: tabs.values.toList(growable: false),
          ),
        ),
      ],
    );
  }

  Widget $BgView() {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IMG.format('task/task_center_bg')),
          scale: 3,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TaskMainView extends StatelessWidget {
  final int taskListType;//任务列表类型 1：每日任务，2：成长任务
  const TaskMainView({super.key, required this.taskListType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (taskListType == 1)
          const Box(
            color: AppPalette.transparent,
            height: 100,
          ),
        Expanded(
          child: Material(
            borderRadius: AppBorderRadius.t16,
            color: Colors.white,
            child: ConfigListState(
              buildNoMoreView: ([_]) => const SizedBox(),
              child: _DetailsListView(taskListType),
            ),
            // child: XFutureBuilder<dynamic>(
            //   api,
            //   onData: (data) => $BodyView(data['items'], data['pay_type_items']),
            // ),
          ),
        ),
      ],
    );
  }
}


class _DetailsListView extends SimplePageView<Map> {
  final int taskListType;//任务列表类型 1：每日任务，2：成长任务
  _DetailsListView(this.taskListType);

  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(horizontal: 18, bottom: 10 + AppSize.safeBottom),
      divider: const Divider(color: AppPalette.colorEB,),
    );
  }

  @override
  Future fetchPage(PageNum page) => Api.Finance.diamondDetail(type: taskListType, page: page);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return _ItemView(data: item);
  }
}

class _ItemView extends StatelessWidget {
  final Map data;

  const _ItemView({required this.data});

  @override
  Widget build(BuildContext context) {
    return Box(
      height: 90,
      child: Row(
        children: [
          NetImage(data['image'] ?? '-', width: 44, height: 44,),
          const Spacing(width: 8, flex: null,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XText(
                  data['mainName'] ?? '每日登录',
                  style: const TextStyle(fontSize: 14, color: AppPalette.txtDark, fontWeight: fw$Medium),
                ),
                const Spacing(height: 4, flex: null,),
                XText(
                  data['subName'] ?? '每日登录游戏1次',
                  style: const TextStyle(fontSize: 12, color: AppPalette.colorA7, fontWeight: fw$Regular),
                ),
                const Spacing(height: 4, flex: null,),
                const XRichText(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: MoneyIcon(type: MoneyType.diamond, size: 21),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      TextSpan(text: 'x5', style: TextStyle(fontSize: 12, color: AppPalette.txtDark, fontWeight: fw$Medium),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          XOutlinedBtn(
            label: '前往',
            width: 55,
            height: 23,
            textStyle: const TextStyle(fontSize: 12, color: AppPalette.txtDark),
            onTap: () {

            },
          ),
          XTextBtn(
            label: '领取',
            width: 55,
            height: 23,
            textStyle: const TextStyle(fontSize: 12, color: AppPalette.txtWhite),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}
