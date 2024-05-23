import 'dart:ffi';
import 'dart:math';

import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/common/common.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

/// 任务中心
class TaskCenterPage extends StatefulWidget {
  final int initIndex;

  const TaskCenterPage({super.key, this.initIndex = 0});

  @override
  State<TaskCenterPage> createState() => _TaskCenterPageState();
}

class _TaskCenterPageState extends State<TaskCenterPage> {


  final tabs = <String, Widget>{
    '每日任务': DelayView(
      fadeIn: false,
      keepAlive: true,
      builder: (_) {
        return const TaskMainView(taskListType: 1);
      },
    ),
    '成长任务': DelayView(
      fadeIn: false,
      keepAlive: true,
      builder: (_) {
        return const TaskMainView(taskListType: 2);
      },
    ),
  };

  // 控制红点显示的标志位列表
  final _showRedDotList = RxList([true, false]);

  static double bgHeight = AppSize.width / 375 * 221.5;

  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 2)).whenComplete(() {
    //   _showRedDotList[0] = false;
    // });
  }

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
        borderSide: BorderSide(width: 2.5, color: AppPalette.primary),
      ),
      indicatorPadding: const Pad(horizontal: 15),
      labelStyle: const TextStyle(fontSize: 18, fontWeight: fw$Medium),
      unselectedLabelStyle: const TextStyle(fontSize: 18, fontWeight: fw$Medium),
      labelColor: AppPalette.primary,
      unselectedLabelColor: AppPalette.hint,
      padding: const Pad(vertical: (AppSize.appBar - 30) / 2),
      tabs: [
        _buildTab(0, tabs.keys.toList(growable: false).first),
        _buildTab(1, tabs.keys.toList(growable: false).last),
      ],
    );

    return Align(
        alignment: Alignment.bottomCenter,
        child: child
    );
  }

  // 带红点的tab
  Widget _buildTab(int index, String title) {
    return Obx(() {
      bool showRedDot = _showRedDotList[index];
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Tab(text: title, height: 30,),
          if (showRedDot)
            Positioned(
              top: 2,
              right: -4,
              child: Image.asset(IMG.format('task/task_tips_red_dot'), width: 10, height: 10, scale: 3,),
            ),
        ],
      );
    });
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

  final int taskListType; //任务列表类型 1：每日任务，2：成长任务
  const TaskMainView({super.key, required this.taskListType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (taskListType == 1)
          Box(
            color: AppPalette.transparent,
            height: 110,
            child: $HeaderView(),
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
        if (taskListType == 2)
          $BatchReceiveView(),
      ],
    );
  }

  /// 头部活跃度视图
  Widget $HeaderView() {
    // RxBool isOpen10 = false.obs;
    // RxBool isOpen40 = false.obs;
    // RxBool isOpen70 = false.obs;
    // RxBool isOpen100 = false.obs;
    Widget $Indicator(double percent) {
      return LinearPercentIndicator(
        animation: false,
        animationDuration: 618,
        curve: Curves.easeOutCubic,
        lineHeight: 4.5,
        padding: Pad.zero,
        barRadius: AppRadius.max,
        percent: percent,
        linearGradient: const LinearGradient(colors: [Color(0xFF18FF00), Color(0xFF9AFF9A)]),
        backgroundColor: const Color(0xFF868686).withAlpha(80),
      );
    }

    Widget $TaskBoxView(String bottomNum, double right, double boxWidth) {

      return Positioned(
        right: right,
        top: 12,
        child: Column(
          children: [
           GestureDetector(
             onTap: (){
               // isOpen = !isOpen;
             },
             child:  Image.asset(IMG.format('task/task_box_$bottomNum'), width: boxWidth, height: boxWidth, scale: 3,)
             //  :
             // Image.asset(IMG.format('task/task_box_open_$bottomNum'), width: boxWidth, height: boxWidth, scale: 3,),
           ),

            XText(
              bottomNum,
              style: const TextStyle(fontSize: 10, color: AppPalette.colorA7),
            )
          ],
        ),
      );
    }
    
    Widget child = Column(
      children: [
        const Padding(
          padding: Pad(horizontal: 12),
          child: Row(
            children: [
              XText('今日活跃度：0',selectionColor: Colors.black,style: TextStyle(color: Colors.black),),
              Expanded(child: Spacing.blank),
              XText('每日0点刷新',style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const Pad(horizontal: 19),
            child: LayoutBuilder(
              builder: (_ , c) {
                const boxWidth = 36.0;
                final tenPercentWidth = (c.maxWidth - boxWidth * 4.0) / 10.0;

                return Stack(
                  clipBehavior: Clip.none,
                  children: [  // 90
                    Positioned.fill(child: $Indicator(
                      max(0, min(1, 0.9,),),
                    ),),
                    $TaskBoxView('100', -3, boxWidth),
                    $TaskBoxView('70', 3 * tenPercentWidth + boxWidth - 3, boxWidth),
                    $TaskBoxView('40', 6 * tenPercentWidth + 2 * boxWidth - 3, boxWidth),
                    $TaskBoxView('10', 9 * tenPercentWidth + 3 * boxWidth - 3, boxWidth),
                  ],
                );
              },
            ),
          ),
        ),
        Container(
          width: 195,
          height: 31.6,
          margin: const Pad(bottom: 4),
          child: Stack(
            children: [
              Positioned.fill(child: Image.asset(IMG.format('task/task_box_desc_bg'), scale: 3, fit: BoxFit.cover,),),
              Positioned(
                bottom: 3.5,
                left: 0,
                right: 0,
                child: XRichText(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                       // child: SvgView(SVG.$('cz/黄钻'), width: 21, height: 21),
                        child: Image.asset(IMG.format('money_gold'), width: 21, height: 21)
                      ),
                      const TextSpan(text: '  打开宝箱可获得'),
                      const TextSpan(
                        // text: '金币或体力点',
                        text: '黄钻',
                        style: TextStyle(fontSize: 11, color: AppPalette.colorYZ, fontWeight: fw$Regular),
                      ),
                    ],
                  ),
                  style: const TextStyle(fontSize: 11, color: AppPalette.txtDark, fontWeight: fw$Regular),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: Colors.white),
      child: child,
    );

    return child;
  }

  /// 批量领取视图
  Widget $BatchReceiveView() {
    Widget child = Row(
      children: [
        const XRichText(
          TextSpan(
            children: [
              TextSpan(text: '共'),
              TextSpan(
                text: '3',
                style: TextStyle(fontSize: 13, color: Color(0xFFBD7BE5), fontWeight: fw$Regular),
              ),
              TextSpan(text: '个任务奖励未领取'),
            ],
            style: TextStyle(fontSize: 13, color: AppPalette.colorA7, fontWeight: fw$Regular),
          ),
        ),
        Spacing.exp,
        XTextBtn(
          width: 116,
          height: 30,
          label: '一键领取',
          textStyle: const TextStyle(fontSize: 15, color: AppPalette.txtWhite, fontWeight: fw$Regular),
        ),
      ],
    );

    child = Container(
      padding: Pad(bottom: AppSize.safeBottom, horizontal: 18),
      height: 53,
      child: child,
    );

    return child;
  }
}


class _DetailsListView extends SimpleDataView<Map> {
  final int taskListType; //任务列表类型 1：每日任务，2：成长任务
  _DetailsListView(this.taskListType);

  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(horizontal: 18, bottom: AppSize.safeBottom),
      divider: const Divider(color: AppPalette.colorEB,),
    );
  }

  @override
  Future fetch() =>
      Api.Finance.diamondDetail(
        type: taskListType, page: const PageNum(index: 0, size: 999),);

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
                  style: const TextStyle(fontSize: 14,
                      color: AppPalette.txtDark,
                      fontWeight: fw$Medium),
                ),
                const Spacing(height: 4, flex: null,),
                XText(
                  data['subName'] ?? '每日登录游戏1次',
                  style: const TextStyle(fontSize: 12,
                      color: AppPalette.colorA7,
                      fontWeight: fw$Regular),
                ),
                const Spacing(height: 4, flex: null,),
                const XRichText(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: MoneyIcon(type: MoneyType.diamond, size: 21),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      TextSpan(text: 'x5',
                        style: TextStyle(fontSize: 12,
                            color: AppPalette.txtDark,
                            fontWeight: fw$Medium),),
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
            textStyle: const TextStyle(
                fontSize: 12, color: AppPalette.txtWhite),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}
