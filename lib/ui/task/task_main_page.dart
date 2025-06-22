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
import '../../model/enum/room_state.dart';
import '../../shop/home_shop_page.dart';
import '../../store/room/room_manager_ctrl.dart';
import '../moment/moment_page.dart';
import '../my/real_identity_page.dart';
import '../my/wallet/recharge_page.dart';
import '../podcast/hot_podcast_page.dart';
import '../room/room_page.dart';
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
            height: 115,
            child: $HeaderView(vc: vc,context: context),
          ),

        Expanded(
          child: Material(
              borderRadius: AppBorderRadius.t16,
              color: Colors.white,
              child: refreshBox(
                       _taskMainPageController.onRefresh,
                       _taskMainPageController.onLoad,
                        _taskMainPageController.refController,
                        isShowUp:false,
                               ListView.builder(
                         shrinkWrap: true,
                         controller: _taskMainPageController.scrollController,
                         itemCount: _taskMainPageController.dailyTaskAllItems?.data?.dailyTaskItems?.length,
                         itemBuilder:  (BuildContext context, int index) {
                           return Column(
                             children: [
                             _ItemView(data:_taskMainPageController.dailyTaskAllItems.data?.dailyTaskItems?[index],
                             vc: _taskMainPageController,),
                               const Padding(
                                 padding: EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Divider(
                                   thickness: 1,
                                   height: 0.5,  // Height of the divider
                                   color: AppPalette.colorEB,  // Color of the divider
                                 ),
                               ),
                             ],
                           );
                         },)
                       )

                    )

          ),

        $BatchReceiveView(_taskMainPageController,context),
         ]
        ),
        // if (taskListType == 2)


    );
  }

  /// 头部活跃度视图
  Widget $HeaderView({required TaskMainPageController vc,required BuildContext context}) {
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
                child:  Image.asset(IMG.format('task/task_box_$bottomNum'),
                 width: boxWidth, height: boxWidth, scale: 3,)
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
              XText(value == null ?'今日活跃度：0':'今日活跃度：$scheduleValue',
              selectionColor: Colors.black,style: TextStyle(color: Colors.black),),
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
                 double boxSize = 38;
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
                       DailyTaskLivenessItems? dailyTaskLivenessItems = 
                        _taskMainPageController.dailyTaskAllItems.data!.dailyTaskLivenessItems![index];
                       return Container(
                         width: boxSize,
                         height: 80,
                         margin: EdgeInsets.only(right: index == boxCount - 1 ? 0 : spacing,top: 10),
                         child:  Column(
                           children: [
                             GestureDetector(
                                 onTap: () async{
                                   if(isReceive == true && isReceived == false){
                                   //  await vc.taskReceive(id: item?.id, taskType: 3);
                                     SunDiamondDialog.showDialog(dailyTaskLivenessItems,vc);
                                   }

                                 },
                               // child: Image.asset(IMG.format('task/task_box_${activityLevels[index]}'), scale: 3,),
                               child:isReceive == true ? (isReceived == true ?Image.network(receivedCover!,scale: 1,width: boxSize,height: boxSize, fit: BoxFit.cover)
                                   :Image.network(receiveCover!,scale: 1,width: boxSize,height: boxSize, fit: BoxFit.cover)) :
                               isReceived == true ?Image.network(receivedCover!,scale: 1,width: boxSize,height: boxSize, fit: BoxFit.cover): // isReceived == true ?
                               Image.network(notReceiveCover!,scale: 1,width: boxSize,height: boxSize, fit: BoxFit.cover),
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
  Widget $BatchReceiveView(TaskMainPageController vc,BuildContext context) {
    // EventBus eventBus = EventBus();
    List dataList = [];
    vc.dailyTaskAllItems.data?.dailyTaskItems?.forEach((element) {
        if(element.isReceive == true){
          dataList.add(element);
        }
    });
    ShowRedDotListEvent(dataList).fire();

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
      margin: Pad(bottom: MediaQuery.of(context).padding.bottom, horizontal: 18),
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

                Center(
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // XRichText(

                        // TextSpan(
                        //   children: [
                        //     WidgetSpan(
                        //       child:
                              Image.network(
                                data!.prizeImage ?? '',
                                // width: 23,
                                // height: 23,
                                width: 22,
                                height: 22,
                                scale: 2,
                                fit: BoxFit.fill,
                              ),
                              // alignment: PlaceholderAlignment.middle,
                          //  ),
                      Align(
                          alignment: Alignment.center,
                          child: Text('x${data?.count.toString()}',
                            style: const TextStyle(fontSize: 12,
                              color: AppPalette.txtDark,
                              fontWeight: fw$Medium,
                            ),)
                      ),

                        //  ],
                        // ),
                      //   textAlign: TextAlign.center,
                      // ),
                      Spacing(width: 7, flex: null,),
                   //   XRichText(
                       // TextSpan(
                      //    children: [
                      //       WidgetSpan(
                      //         child: MoneyIcon(type: MoneyType.activity, size: 15),
                      //         alignment: PlaceholderAlignment.middle,
                      //       ),
                      Center(
                        child: Image.asset(
                          IMG.format('money_activity'),
                          width: 16,
                          height: 16,
                          scale: 3,
                          fit: BoxFit.contain,
                        )
                      ),
                  Align(
                    child:  Text(' x${data?.addLiveness.toString()}',
                      style: TextStyle(fontSize: 12,
                          color: AppPalette.txtDark,
                          fontWeight: fw$Medium),),
                  )

                        //  ],
                     //   ),
                     //    textAlign: TextAlign.center,
                   //   ),


                    ],
                  ),
                )


              ],
            ),
          ),

         data?.isReceive == true? XTextBtn(
           label: '领取',
           width: 55,
           height: 23,
           textStyle: const TextStyle(
               fontSize: 12, color: AppPalette.txtWhite),
           onTap: () async{
             await vc.taskReceive(id: data?.id, taskType: 1);
           },
         )
         : data?.isReceived == true ? XTextBtn(
           label: '已领取',
           width: 55,
           height: 23,
           color: AppPalette.colorA7,
           textStyle: const TextStyle(
               fontSize: 12, color: AppPalette.txtWhite),
           onTap: () async{
           },
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

                 break;

               case 2:
                 Get.back();
                 const MomentPageEvent().fire();
                 break;
               case 3:

                 Get.back();
                 const MomentPageEvent().fire();
               case 4:

                 Get.back();
                 const MomentPageEvent().fire();
                 break;
               case 5:

                 Get.back();
                 const MomentPageEvent().fire();
                 break;
               case 6:

                 Get.back();
                 const MomentPageEvent().fire();
               case 7:

                 Get.back();
                 const MomentPageEvent().fire();
                 break;
               case 8:

                 Get.back();
                 const MomentPageEvent().fire();
                 break;
               case 9:

                 if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                   RoomPage.show();
                 }else{
                   Get.back();
                   const HotBroadcastEvent().fire();
                 }
               //  Get.to(() => const HotPodcastPage());

               case 10:
                 if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                   RoomPage.show();
                 }else{
                   Get.back();
                   const HotBroadcastEvent().fire();
                 }

                 break;
               case 11:
                 Get.back();
                 const HomeShopPageEvent().fire();
              //   Get.to(() => const HomeShopPage());

                 break;
               case 12:
                 Get.back();
                 const HomeShopPageEvent().fire();
               //  Get.to(() => const HomeShopPage());

               case 13:
                 Get.to(() => RechargePage(hasShowUnityView: true,));

                 break;
               case 14:
               //  Get.to(() => const HotPodcastPage());
                 if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                   RoomPage.show();
                 }else{
                   Get.back();
                   const HotBroadcastEvent().fire();
                 }
                 break;
               case 15:

                 Get.to(() => RechargePage(hasShowUnityView: true,));
               case 16:
               //  Get.to(() => const HotPodcastPage());
                 Get.back();
                 const HotBroadcastEvent().fire();
                 break;
               case 17:
                 if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                   RoomPage.show();
                 }else{
                   Get.back();
                   const HotBroadcastEvent().fire();
                 }

                 break;
               case 21:
                 Get.to(() => const RealIdentityPage());
                 break;
               case 22:
                 if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                   RoomPage.show();
                 }else{
                   Get.back();
                   const HotBroadcastEvent().fire();
                 }
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


class SunDiamondDialog extends StatefulWidget {
  
  SunDiamondDialog({Key? key, required this.dailyTaskLivenessItems, required this.vc}) : super(key: key);
  DailyTaskLivenessItems dailyTaskLivenessItems;
  TaskMainPageController vc;
  @override
  _SunDiamondDialogState createState() => _SunDiamondDialogState();

  static Future<void> showDialog(DailyTaskLivenessItems dailyTaskLivenessItems,TaskMainPageController vc) async {


    var dialog = SunDiamondDialog(dailyTaskLivenessItems: dailyTaskLivenessItems,vc: vc,);
    await Get.dialog(
      dialog,
      useSafeArea: false,
      routeSettings: dialog.toRouteSettings(),
    );
  }
}

class _SunDiamondDialogState extends State<SunDiamondDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽度的一半
    double halfScreenHeight = MediaQuery.of(context).size.height / 2;
    return
      FadeTransition(
      opacity: _animation,
      child:
        Stack(
        alignment: Alignment.center,
        children: [

          Positioned(
            top: halfScreenHeight - 200,
            child: ElevatedButton(
              onPressed: () {
              //  Navigator.of(context).pop(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF000000).withAlpha(100), // Background color
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 20, // Adjust font size here
                ),// Text
               // fontSize: 20,// Text color
              ),
              child: Text('${widget.dailyTaskLivenessItems.count}${widget.dailyTaskLivenessItems.prizeName}'),
            ),
          ),
          // Sun Image
          Image.asset(
            IMG.format("sun"), scale: 3,
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),
          // Diamond Image in the center of the Sun
          // Image.asset(
          //   IMG.format("money_gold"), scale: 3,
          //   width: 300,
          //   height: 300,
          // ),
          Image.network(widget.dailyTaskLivenessItems.prizeImage!,width: 100,height: 100,scale: 3,fit: BoxFit.fitWidth,),
          
          // "立即领取" button below the Sun
          Positioned(
           bottom: halfScreenHeight - 200,
            child: ElevatedButton(
              onPressed: () async{
                await widget.vc.taskReceive(id: widget.dailyTaskLivenessItems?.id, taskType: 3);
                Navigator.of(context).pop(); // Close the dialog
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero, // Remove default padding
              ),
              child: Image.asset(IMG.format('button_ljlq'), scale: 4,fit: BoxFit.none),

            ),
          ),
        ],
      )
    );
  }
}