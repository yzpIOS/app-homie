

import 'dart:math';

import 'package:app/event/event.dart';
import 'package:app/tools.dart';
import 'package:app/ui/task/task_main_page_controller.dart';
import 'package:app/widgets.dart';

import 'package:app/common/theme.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import 'package:app/common/widgetUtils.dart';

import 'package:app/ui/common/money_icon.dart';
import 'package:media_kit/ffi/ffi.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/common_model.dart';
import '../../shop/home_shop_page.dart';
import '../moment/moment_page.dart';
import '../my/wallet/recharge_page.dart';
import '../podcast/hot_podcast_page.dart';
import 'my_sign_view.dart';

class TaskMainPage extends StatelessWidget {
  // late final TaskCenterController taskCenterController;

  //  final int taskListType; //任务列表类型 1：每日任务，2：成长任务

  // //final TaskCenterController taskCenterController;
    TaskMainPage({super.key});
    final TaskMainPageController _taskMainPageController = Get.put(TaskMainPageController());

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<TaskMainPageController>(
      id:'taskMainPage',
      builder: (TaskMainPageController vc) => Column(
      children: [
          Box(
            color: AppPalette.transparent,
            height: 110,
            child: $HeaderView(vc: vc),
          ),

        Expanded(
          child: Material(
              borderRadius: AppBorderRadius.t16,
              color: Colors.white,
              child: refreshBox(
                       _taskMainPageController.onRefresh,
                       _taskMainPageController.onLoad,
                        _taskMainPageController.refController,
                               ListView.builder(
                         shrinkWrap: true,
                         controller: _taskMainPageController.scrollController,
                         itemCount: _taskMainPageController.dailyTaskAllItems?.data?.dailyTaskItems?.length,
                         itemBuilder:  (BuildContext context, int index) {
                           return _ItemView(data:_taskMainPageController.dailyTaskAllItems.data?.dailyTaskItems?[index],vc: _taskMainPageController,);
                         },)
                       )

                    )

          ),

        $BatchReceiveView(_taskMainPageController),
         ]
        ),
        // if (taskListType == 2)


    );
  }

  /// 头部活跃度视图
  Widget $HeaderView({required TaskMainPageController vc}) {
    String? value;
    double number = 0;
    int boxCount = 0;
    int? scheduleValue = 0;
    if(vc.dailyTaskAllItems?.data != null){
       value = vc.dailyTaskAllItems?.data?.dailyTaskItems?.first?.value?.toString();
         scheduleValue = vc.dailyTaskAllItems?.data?.dailyTaskLivenessItems?.first.scheduleValue;
        number = scheduleValue! * 0.01;

       boxCount = _taskMainPageController.dailyTaskAllItems.data!.dailyTaskLivenessItems!.length!;
      // vc.dailyTaskAllItems?.data?.dailyTaskAllItems.
    }

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

    Widget $TaskBoxView(String bottomNum, double left, double boxWidth) {

      return Positioned(
        left: left,
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
         Padding(
          padding: Pad(horizontal: 12),
          child: Row(
            children: [
              XText(value == null ?'今日活跃度：0':'今日活跃度：$scheduleValue',selectionColor: Colors.black,style: TextStyle(color: Colors.black),),
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
                // const boxWidth = 36.0;
                // final tenPercentWidth = (c.maxWidth - boxWidth * 3.0) / 10.0;
                // 箱子的固定宽度和高度
                 double boxSize = 36;
                // 从服务器获取的箱子数和活跃度
                // final List<int> boxCounts = [3];
                // final List<int> activityLevels = [10, 40, 70];
                // 计算每个箱子的间距
                double totalBoxWidth =  boxCount * boxSize;
                double totalSpacing = c.maxWidth - totalBoxWidth;
                double spacing = totalSpacing / (boxCount - 1);
                return Stack(
                  clipBehavior: Clip.none,
                  children: [  // 90
                    Positioned.fill(child: $Indicator(
                      max(0, min(1, number),),
                    ),),
                   Row(
                     children: List.generate(boxCount, (index) {
                       // return  $TaskBoxView('40', 4 * (tenPercentWidth) + boxWidth, boxWidth),
                       var receiveCover = _taskMainPageController.dailyTaskAllItems.data!.dailyTaskLivenessItems![index].receiveCover;

                       var notReceiveCover = _taskMainPageController.dailyTaskAllItems.data!.dailyTaskLivenessItems![index].notReceiveCover;

                       var receivedCover = _taskMainPageController.dailyTaskAllItems.data!.dailyTaskLivenessItems![index].receivedCover;
                       DailyTaskLivenessItems item = _taskMainPageController.dailyTaskAllItems.data!.dailyTaskLivenessItems![index];
                       String value = _taskMainPageController.dailyTaskAllItems.data!.dailyTaskLivenessItems![index].value.toString();
                       bool? isReceive = _taskMainPageController.dailyTaskAllItems.data!.dailyTaskLivenessItems![index].isReceive;
                       bool? isReceived = _taskMainPageController.dailyTaskAllItems.data!.dailyTaskLivenessItems![index].isReceived;

                       return Container(
                         width: boxSize,
                         height: 80,
                         margin: EdgeInsets.only(right: index == boxCount - 1 ? 0 : spacing,top: 10),
                         child:  Column(
                           children: [
                             GestureDetector(
                                 onTap: () async{
                                   if(isReceive == true && isReceived == false){
                                     await vc.taskReceive(id: item?.id, taskType: 3);
                                   }
                                 },
                               // child: Image.asset(IMG.format('task/task_box_${activityLevels[index]}'), scale: 3,),
                               child:isReceive == true ? (isReceived == true ?Image.network(receivedCover!,scale: 3,width: boxSize,height: boxSize,)
                                   :Image.network(receiveCover!,scale: 3,width: boxSize,height: boxSize,)) :
                               isReceived == true ?Image.network(receivedCover!,scale: 3,width: boxSize,height: boxSize,): // isReceived == true ?
                               Image.network(notReceiveCover!,scale: 3,width: boxSize,height: boxSize,),
                               //  :
                               // Image.asset(IMG.format('task/task_box_open_$bottomNum'), width: boxWidth, height: boxWidth, scale: 3,),
                             ),

                             XText(
                               value,
                               style: const TextStyle(fontSize: 10, color: AppPalette.primaryRed),
                             )
                           ],
                         ),

                         // Center(
                         //   child: Image.asset(IMG.format('task/task_box_${activityLevels[index]}'), scale: 3,),
                         // )
                       );
                     }),
                   )
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
  Widget $BatchReceiveView(TaskMainPageController vc) {
    // EventBus eventBus = EventBus();
    List dataList = [];
    vc.dailyTaskAllItems.data?.dailyTaskItems?.forEach((element) {
        if(element.isReceive == true){
          dataList.add(element);
        }
    });
    ShowRedDotListEvent(dataList);

    Widget child = Row(
      children: [
         XRichText(
          TextSpan(
            children: [
              TextSpan(text: '共'),
              TextSpan(
                text: '${dataList.length}',
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
          color: dataList.isEmpty ? AppPalette.colorA7 : AppPalette.primary,
          textStyle:  const TextStyle(fontSize: 15, color: AppPalette.txtWhite, fontWeight: fw$Regular),
          onTap: (){
           if(dataList.isEmpty)return;
           vc.oneKeyreceive();
          },
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


class _ItemView extends StatelessWidget {
  final DailyTaskItems? data;
  final TaskMainPageController vc;
  const _ItemView({required this.data, required this.vc});

  @override
  Widget build(BuildContext context) {
    return Box(
      height: 90,
      child: Row(
        children: [
          const Spacing(width: 8, flex: null,),
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(22),
            child: Image.network(
              data!.cover ?? '',
              width: 44,
              height: 44,
            ),
          ),
          const Spacing(width: 8, flex: null,),
           Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XText(
                   data?.title ?? '每日登录',
                //  '每日登录',
                  style: const TextStyle(fontSize: 14,
                      color: AppPalette.txtDark,
                      fontWeight: fw$Medium),
                ),
                const Spacing(height: 4, flex: null,),
                XText(
                   data?.desc ?? '每日登录游戏1次',
                //  '每日登录游戏1次',
                  style: const TextStyle(fontSize: 12,
                      color: AppPalette.colorA7,
                      fontWeight: fw$Regular),
                ),
                const Spacing(height: 4, flex: null,),

                 Row(
                  children: [
                    XRichText(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            // child: MoneyIcon(type: MoneyType.diamond, size: 21),
                            child: Image.network(
                              data!.prizeImage ?? '',
                              width: 21,
                              height: 21,
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          TextSpan(text: 'x${data?.count.toString()}',
                            style: TextStyle(fontSize: 12,
                                color: AppPalette.txtDark,
                                fontWeight: fw$Medium),),
                        ],
                      ),
                    ),
                    Spacing(width: 7, flex: null,),
                    XRichText(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: MoneyIcon(type: MoneyType.activity, size: 15),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          TextSpan(text: 'x${data?.addLiveness.toString()}',
                            style: TextStyle(fontSize: 12,
                                color: AppPalette.txtDark,
                                fontWeight: fw$Medium),),
                        ],
                      ),
                    ),
                  ],
                )


              ],
            ),
          ),

         data?.isReceive == true? (data?.isReceived == true? XTextBtn(
           label: '已领取',
           width: 55,
           height: 23,
           textStyle: const TextStyle(
               fontSize: 12, color: AppPalette.txtWhite),
           onTap: () {

           },
         ): XTextBtn(
           label: '领取',
           width: 55,
           height: 23,
           textStyle: const TextStyle(
               fontSize: 12, color: AppPalette.txtWhite),
           onTap: () async{
             await vc.taskReceive(id: data?.id, taskType: 1);
           },
         )
         ): XOutlinedBtn(
           label: '前往',
           width: 55,
           height: 23,
           textStyle: const TextStyle(fontSize: 12, color: AppPalette.primary),
           onTap: () async{
             /// 任务类型枚举值，1：登录次数，2：动态获得点赞数，3：动态获得评论数，4：点赞动态数，5：评论动态数，
             /// 6：新增好友数，7：新增关注数，8：新增粉丝数，9：收到礼物数，
             /// 10：赠送礼物数，11：购买商品数，12：赠送商品数，
             /// 13：充值次数，14：消费次数，15：充值金额，16：消费金额，17：分享次数
             switch(data?.type){
               case 1:
                 SignDialog.show(isManual: true);
                // Get.to(() => const MomentPage(),arguments: {'myTask':true});
                 break;
               case 2:
               //  await vc.taskReceive(id: data?.id, taskType: 2);
                 Get.to(() => const MomentPage(),arguments: {'myTask':true});
                 break;
               case 3:

                 Get.to(() => const MomentPage(),arguments: {'myTask':true});
               case 4:

                 Get.to(() => const MomentPage(),arguments: {'myTask':true});
                 break;
               case 5:

                 Get.to(() => const MomentPage(),arguments: {'myTask':true});
                 break;
               case 6:

                 Get.to(() => const MomentPage(),arguments: {'myTask':true});
               case 7:

                 Get.to(() => const MomentPage(),arguments: {'myTask':true});
                 break;
               case 8:

                 Get.to(() => const MomentPage(),arguments: {'myTask':true});
                 break;
               case 9:

                 Get.to(() => const HotPodcastPage());

               case 10:
                 Get.to(() => const HotPodcastPage());

                 break;
               case 11:

                 Get.to(() => const HomeShopPage());

                 break;
               case 12:
                 Get.to(() => const HomeShopPage());

               case 13:
                 Get.to(() => RechargePage(hasShowUnityView: true,));

                 break;
               case 14:
                 Get.to(() => const HotPodcastPage());

                 break;
               case 15:

                 Get.to(() => RechargePage(hasShowUnityView: true,));
               case 16:
                 Get.to(() => const HotPodcastPage());

                 break;
               case 17:

                 break;
             }
           },
         ),
          const Spacing(width: 8, flex: null,),
        ],


      ),
    );
  }
}