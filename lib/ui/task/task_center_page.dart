import 'dart:ffi';
import 'dart:math';

import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/task/task_main_page.dart';
import 'package:app/ui/task/task_main_page_controller.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/common_model.dart';
import '../../common/widgetUtils.dart';
import '../../event/event.dart';
import 'growth_task_controller.dart';
import 'growth_task_page.dart';
import 'package:event_bus/event_bus.dart';
/// 任务中心
class TaskCenterPage extends StatefulWidget {
  final int initIndex;
  // final TaskCenterController taskCenterController;
  const TaskCenterPage({super.key, this.initIndex = 0});

  @override
  State<TaskCenterPage> createState() => _TaskCenterPageState();
}

class _TaskCenterPageState extends State<TaskCenterPage> with BusStateMixin {
  final TaskMainPageController taskCenterController = Get.put(TaskMainPageController());
  final GrowthTaskController growthTaskController = Get.put(GrowthTaskController());
  // var tabs;
   var tabs = <String, Widget>{
     // '每日任务': const TaskMainPage(taskListType:1),
     '每日任务': DelayView(
       fadeIn: false,
       keepAlive: true,
       builder: (_) {
       //  return   TaskMainPage();
         return Container();
       },
     ),
     '成长任务': DelayView(
       fadeIn: false,
       keepAlive: true,
       builder: (_) {
       //  return  GrowthTaskPage();
         return Container();
       },
     ),
   };
  // 控制红点显示的标志位列表
  final _showRedDotList = RxList([true, false]);

  static double bgHeight = AppSize.width / 375 * 221.5;

  @override
  void initState() {
    super.initState();

    // on<ShowRedDotListEvent>.listen((event)){
    //
    // }
  //  EventBus eventBus = EventBus();
    // 请求数据刷新界面
    // on<ShowRedDotListEvent>(
    //       (_) => updateUserInfo(),
    // );
    // on<ShowRedDotListEvent>(
    //       (event) =>  print('Received EventOne: ${event.dataList}')
    // );
    //
    // on<ShowRedDotListGrowpEvent>(
    //         (event) =>  print('Received EventOne111: ${event.dataList}')
    // );

    on<ShowRedDotListEvent>((event) {
      print('Received EventOne: ${event.dataList}');
      event.dataList!.isEmpty ? _showRedDotList[0] = false : _showRedDotList[0] = true;
     // _showRedDotList[0] = false;
    });

    on<ShowRedDotListGrowpEvent>((event) {
      print('Received EventOne: ${event.dataList}');
      event.dataList!.isEmpty ? _showRedDotList[1] = false : _showRedDotList[1] = true;
    });

    // Future.delayed(const Duration(seconds: 2)).whenComplete(() {
    //   _showRedDotList[0] = false;
    // });

      simpleTry(() => Api.Activity.growUpTaskQuery(offset: 0, limit: 20),callback: (data){
        DailyTaskAllItems dailyTaskAllItems = DailyTaskAllItems.fromJson(data);
        growthTaskController.itemList = dailyTaskAllItems!.data!.items!.isEmpty ? [] : dailyTaskAllItems.data!.items!;

        List dataList = [];
        growthTaskController.itemList.forEach((element) {
          if(element.isReceive == true){
            dataList.add(element);
          }
        });
        if(dataList.isEmpty){
          _showRedDotList[1] = false;
        }else{
          _showRedDotList[1] = true;
        }

        simpleTry(() => Api.Activity.dailyTaskQuery(),callback: (data2){
          DailyTaskAllItems items2 = DailyTaskAllItems.fromJson(data2);
          taskCenterController.dailyTaskAllItems = items2;
          List dataList = [];
          taskCenterController.dailyTaskAllItems.data?.dailyTaskItems?.forEach((element) {
            if(element.isReceive == true){
              dataList.add(element);
            }
          });
          if(dataList.isEmpty){
            _showRedDotList[0] = false;
          }else{
            _showRedDotList[0] = true;
          }


          tabs = <String, Widget>{
            // '每日任务': const TaskMainPage(taskListType:1),
            '每日任务': DelayView(
              fadeIn: false,
              keepAlive: true,
              builder: (_) {
                return   TaskMainPage();
              },
            ),
            '成长任务': DelayView(
              fadeIn: false,
              keepAlive: true,
              builder: (_) {
                return  GrowthTaskPage();
              },
            ),
          };

          setState(() {

          });

        });
      });



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

// class TaskMainView extends StatelessWidget {
//   // late final TaskCenterController taskCenterController;
//
//   final int taskListType; //任务列表类型 1：每日任务，2：成长任务
//   final TaskCenterController taskCenterController;
//   const TaskMainView({super.key, required this.taskListType, required this.taskCenterController});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (taskListType == 1)
//           Box(
//             color: AppPalette.transparent,
//             height: 110,
//             child: $HeaderView(),
//           ),
//         Expanded(
//           child: Material(
//             borderRadius: AppBorderRadius.t16,
//             color: Colors.white,
//             child: refreshBox(
//               taskCenterController.onRefresh,
//               taskCenterController.onLoad,
//               taskCenterController.refController,
//                 ListView.builder(
//                   shrinkWrap: true,
//                   controller: taskCenterController.scrollController,
//                   itemCount: 8,
//                   itemBuilder:  (BuildContext context, int index) {
//                   return _ItemView();
//                 },),
//                 isShowUp: false,
//                 isMain: false
//             )
//
//             // ConfigListState(
//             //   buildNoMoreView: ([_]) => const SizedBox(),
//             //   child: _DetailsListView(taskListType),
//             // ),
//
//
//             // child: XFutureBuilder<dynamic>(
//             //   api,
//             //   onData: (data) => $BodyView(data['items'], data['pay_type_items']),
//             // ),
//           ),
//         ),
//         if (taskListType == 2)
//           $BatchReceiveView(),
//       ],
//     );
//   }
//
//
//
//   /// 批量领取视图
//   Widget $BatchReceiveView() {
//     Widget child = Row(
//       children: [
//         const XRichText(
//           TextSpan(
//             children: [
//               TextSpan(text: '共'),
//               TextSpan(
//                 text: '3',
//                 style: TextStyle(fontSize: 13, color: Color(0xFFBD7BE5), fontWeight: fw$Regular),
//               ),
//               TextSpan(text: '个任务奖励未领取'),
//             ],
//             style: TextStyle(fontSize: 13, color: AppPalette.colorA7, fontWeight: fw$Regular),
//           ),
//         ),
//         Spacing.exp,
//         XTextBtn(
//           width: 116,
//           height: 30,
//           label: '一键领取',
//           textStyle: const TextStyle(fontSize: 15, color: AppPalette.txtWhite, fontWeight: fw$Regular),
//         ),
//       ],
//     );
//
//     child = Container(
//       padding: Pad(bottom: AppSize.safeBottom, horizontal: 18),
//       height: 53,
//       child: child,
//     );
//
//     return child;
//   }
// }


// class _DetailsListView extends SimpleDataView<Map> {
//   final int taskListType; //任务列表类型 1：每日任务，2：成长任务
//   _DetailsListView(this.taskListType);
//
//   @override
//   BaseConfig get config {
//     return ListConfig(
//       padding: Pad(horizontal: 18, bottom: AppSize.safeBottom),
//       divider: const Divider(color: AppPalette.colorEB,),
//     );
//   }
//
//   @override
//   Future fetch() =>
//       // Api.Finance.diamondDetail(
//       //   type: taskListType, page: const PageNum(index: 0, size: 999),);
//    Api.Activity.dailyTaskQuery();
//
//   @override
//   Widget itemBuilder(BuildContext context, Map item, int index) {
//     return _ItemView(data: item);
//   }
// }

class _ItemView extends StatelessWidget {
  // final Map data;
  //
  // const _ItemView({required this.data});

  @override
  Widget build(BuildContext context) {
    return Box(
      height: 90,
      child: Row(
        children: [
        //  NetImage(data['image'] ?? '-', width: 44, height: 44,),
          const Spacing(width: 8, flex: null,),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XText(
                  // data['mainName'] ?? '每日登录',
               '每日登录',
                  style: TextStyle(fontSize: 14,
                      color: AppPalette.txtDark,
                      fontWeight: fw$Medium),
                ),
                Spacing(height: 4, flex: null,),
                XText(
                 // data['subName'] ?? '每日登录游戏1次',
                 '每日登录游戏1次',
                  style: TextStyle(fontSize: 12,
                      color: AppPalette.colorA7,
                      fontWeight: fw$Regular),
                ),
                Spacing(height: 4, flex: null,),
                XRichText(
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
