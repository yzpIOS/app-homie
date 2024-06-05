

import 'dart:math';

import 'package:app/tools.dart';
import 'package:app/ui/task/task_main_page_controller.dart';
import 'package:app/widgets.dart';

import 'package:app/common/theme.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import 'package:app/common/widgetUtils.dart';

import 'package:app/ui/common/money_icon.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/common_model.dart';
import '../../event/event.dart';
import '../../model/enum/room_state.dart';
import '../../shop/home_shop_page.dart';
import '../../store/room/room_manager_ctrl.dart';
import '../moment/moment_page.dart';
import '../my/real_identity_page.dart';
import '../my/wallet/recharge_page.dart';
import '../podcast/hot_podcast_page.dart';
import '../room/room_page.dart';
import 'growth_task_controller.dart';
import 'my_sign_view.dart';

class GrowthTaskPage extends StatelessWidget {
  // late final TaskCenterController taskCenterController;

  //  final int taskListType; //任务列表类型 1：每日任务，2：成长任务

  // //final TaskCenterController taskCenterController;
  GrowthTaskPage({super.key});
  final GrowthTaskController _growthTaskController = Get.put(GrowthTaskController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GrowthTaskController>(
        id:'growthTaskPage',
        builder: (_) =>
            Column(
      children: [
        Expanded(
          child: Material(
              borderRadius: AppBorderRadius.t16,
              color: Colors.white,
              child: refreshBox(
                          _growthTaskController.onRefresh,
                          _growthTaskController.onLoad,
                          _growthTaskController.refController,
                          ListView.builder(
                            shrinkWrap: true,
                            controller: _growthTaskController.scrollController,
                            itemCount: _growthTaskController.itemList.length,
                            itemBuilder:  (BuildContext context, int index) {
                              return Column(
                                children: [
                                  _ItemView(data:_growthTaskController.itemList[index],vc: _growthTaskController,),
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
                    //  )

              )

          ),
        ),
        // if (taskListType == 2)
           $BatchReceiveView(_growthTaskController,context),
      ],
        )
    );
  }

  /// 批量领取视图
  Widget $BatchReceiveView(GrowthTaskController vc,BuildContext context) {
    // final GrowthTaskController vc;
   // vc.dailyTaskAllItems.data?.items?.length;
  //  EventBus eventBus = EventBus();
    List dataList = [];
    vc.itemList.forEach((element) {
      if(element.isReceive == true){
        dataList.add(element);
      }
    });
    ShowRedDotListGrowpEvent(dataList).fire();
   // eventBus.fire(ShowRedDotListGrowpEvent(dataList));

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
  final Items? data;
  final GrowthTaskController vc;
  const _ItemView({required this.data,required this.vc});

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
                        fit: BoxFit.contain,
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

                    ],
                  ),
                )
              ],
            ),
          ),

          data?.isReceive == true?  XTextBtn(
            label: '领取',
            width: 55,
            height: 23,
            textStyle: const TextStyle(
                fontSize: 12, color: AppPalette.txtWhite),
            onTap: () async{
              await vc.taskReceive(id: data?.id, taskType: 2);
            },

          ): data?.isReceived == true ? XTextBtn(
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
              /// 任务类型枚举值，1：登录次数,2：动态获得点赞数,3：动态获得评论数,4：点赞动态数,
              /// 5：评论动态数,6：
              /// 好友数,7：关注数,8：粉丝数,9：收到礼物数,10：赠送礼物数,
              /// 11：购买商品数,12：赠送商品数,13：充值次数,14：消费次数,
              /// 15：充值金额,16：消费金额,17：分享次数,
              /// 18：魅力值,19：财富值,20：发表动态数
              switch(data?.type){
                case 1:
                  SignDialog.show(isManual: true);
                 // Get.to(() => const MomentPage(),arguments: {'myTask':true});
                  break;
                case 2:
               //   Get.to(() => const MomentPage(),arguments: {'myTask':true});
                  Get.back();
                  const MomentPageEvent().fire();
                  break;
                case 3:
               //   Get.to(() => const MomentPage(),arguments: {'myTask':true});
                  Get.back();
                  const MomentPageEvent().fire();
                case 4:
                //  Get.to(() => const MomentPage(),arguments: {'myTask':true});
                  Get.back();
                  const MomentPageEvent().fire();
                  break;
                case 5:

               //   Get.to(() => const MomentPage(),arguments: {'myTask':true});
                  Get.back();
                  const MomentPageEvent().fire();
                  break;
                case 6:
               //   Get.to(() => const MomentPage(),arguments: {'myTask':true});
                  Get.back();
                  const MomentPageEvent().fire();
                case 7:
                //  Get.to(() => const MomentPage(),arguments: {'myTask':true});
                  Get.back();
                  const MomentPageEvent().fire();
                  break;
                case 8:
                //  Get.to(() => const MomentPage(),arguments: {'myTask':true});
                  Get.back();
                  const MomentPageEvent().fire();
                  break;
                case 9:
                //  await vc.taskReceive(id: data?.id, taskType: 3);
                 // Get.to(() => const HotPodcastPage());
                  if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                    RoomPage.show();
                  }else{
                    Get.back();
                    const HotBroadcastEvent().fire();
                  }
                case 10:
                //  Get.to(() => const HotPodcastPage());
                  // await vc.taskReceive(id: data?.id, taskType: 1);
                  if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                    RoomPage.show();
                  }else{
                    Get.back();
                    const HotBroadcastEvent().fire();
                  }
                  break;
                case 11:

               //   Get.to(() => const HomeShopPage());
                  Get.back();
                  const MomentPageEvent().fire();
                  break;
                case 12:
                //  Get.to(() => const HomeShopPage());
                  Get.back();
                  const HomeShopPageEvent().fire();
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
                  Get.to(() => RechargePage());
                case 16:
              //    Get.to(() => const HotPodcastPage());
                  if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                    RoomPage.show();
                  }else{
                    Get.back();
                    const HotBroadcastEvent().fire();
                  }
                  break;
                case 17:
                  if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                    RoomPage.show();
                  }else{
                    Get.back();
                    const HotBroadcastEvent().fire();
                  }
                  break;
                case 18:
                //  Get.to(() => const HotPodcastPage());
                  if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                    RoomPage.show();
                  }else{
                    Get.back();
                    const HotBroadcastEvent().fire();
                  }
                  break;
                case 19:
                //  Get.to(() => const HotPodcastPage());
                  if(RoomManagerCtrl.ins.stateRx() == RoomState.Mini){
                    RoomPage.show();
                  }else{
                    Get.back();
                    const HotBroadcastEvent().fire();
                  }
                  break;
                case 20:
                 // Get.to(() => const HotPodcastPage());
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