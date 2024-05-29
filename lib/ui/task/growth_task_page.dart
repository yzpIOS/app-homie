

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
import '../../shop/home_shop_page.dart';
import '../moment/moment_page.dart';
import '../my/wallet/recharge_page.dart';
import '../podcast/hot_podcast_page.dart';
import 'growth_task_controller.dart';

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
                            itemCount: _growthTaskController.dailyTaskAllItems.data?.items?.length,
                            itemBuilder:  (BuildContext context, int index) {
                              return _ItemView(data:_growthTaskController.dailyTaskAllItems.data?.items![index],vc: _growthTaskController,);
                            },)
                    //  )

              )

          ),
        ),
        // if (taskListType == 2)
           $BatchReceiveView(_growthTaskController),
      ],
        )
    );
  }

  /// 批量领取视图
  Widget $BatchReceiveView(GrowthTaskController vc) {
    // final GrowthTaskController vc;
   // vc.dailyTaskAllItems.data?.items?.length;
  //  EventBus eventBus = EventBus();
    List dataList = [];
    vc.dailyTaskAllItems.data?.items?.forEach((element) {
      if(element.isReceive == true){
        dataList.add(element);
      }
    });
    ShowRedDotListGrowpEvent(dataList);
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
      padding: Pad(bottom: AppSize.safeBottom, horizontal: 18),
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
                // const XRichText(
                //   TextSpan(
                //     children: [
                //       WidgetSpan(
                //         child: MoneyIcon(type: MoneyType.diamond, size: 21),
                //         alignment: PlaceholderAlignment.middle,
                //       ),
                //       TextSpan(text: 'x5',
                //         style: TextStyle(fontSize: 12,
                //             color: AppPalette.txtDark,
                //             fontWeight: fw$Medium),),
                //     ],
                //   ),
                // ),
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
              await vc.taskReceive(id: data?.id, taskType: 2);
            },
          )
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
                //  SignDialog.show(isManual: true);
                  Get.to(() => const MomentPage(),arguments: {'myTask':true});
                  break;
                case 2:
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
                //  await vc.taskReceive(id: data?.id, taskType: 3);
                  Get.to(() => const HotPodcastPage());

                case 10:
                  Get.to(() => const HotPodcastPage());
                  // await vc.taskReceive(id: data?.id, taskType: 1);
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
                  Get.to(() => RechargePage());
                case 16:
                  Get.to(() => const HotPodcastPage());
                  break;
                case 17:
                  break;
                case 18:
                  Get.to(() => const HotPodcastPage());
                  break;
                case 19:
                  Get.to(() => const HotPodcastPage());
                  break;
                case 20:
                  Get.to(() => const HotPodcastPage());
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