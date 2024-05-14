
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

///
/// 个播：个播结算页面
///
class DownMicSettleDialog extends StatefulWidget {

  S_LiveStopSettlementBroadcast settle;

  DownMicSettleDialog({super.key, required this.settle});

  @override
  State<StatefulWidget> createState() => _DownMicSettleState();

  static void show(S_LiveStopSettlementBroadcast settle) {
    showDialog(context: Get.context!, builder: (context) {
      return DownMicSettleDialog(settle: settle,);
    });
  }
}

class _DownMicSettleState extends State<DownMicSettleDialog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 303,
          height: 304,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [
                Color(0XFFFAFDFE),
                Color(0XFFECF5FD),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            children: [
              _createContentView(),

              _createClose(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createContentView() {
    return Column(
      children: [
        const SizedBox(height: 30,),
        AsyncAvatar(uid: OAuthCtrl.uid, size: 70,),

        // 用户名
        const SizedBox(height: 5,),
        UserInfoCtrl.use(OAuthCtrl.uid, builder: (userInfo) {
          return Text(
            userInfo?.showName ?? "",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          );
        }),

        // 用户id
        const SizedBox(height: 2,),
        Text(
          "ID:${OAuthCtrl.uid}",
          style: const TextStyle(
            fontSize: 12,
            color: Color(0XFF666666),
            fontWeight: FontWeight.w400,
          ),
        ),

        // 开播时长和收的礼物数量
        const SizedBox(height: 14,),
        _createItem(
          TimeUtils.formate(widget.settle.liveTimes),
          "开播时长",
          widget.settle.giftIncome.toString(),
          "礼物收益"
        ),

        // 直播间人数，打赏人数
        const SizedBox(height: 28,),
        _createItem(
            widget.settle.onlineTotalNum.toString(),
          "直播间人数",
            widget.settle.dsNum.toString(),
          "打赏人数"
        ),

        const SizedBox(height: 30,),
      ],
    );
  }

  Widget _createItem(String value, String title, String value2, String title2) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        // 开播时长
        Expanded(
          child: Column(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2,),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0XFF666666),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),

        Container(width: 1, height: 20, color: const Color(0XFFCCCCCC).withAlpha(200)),

        Expanded(
          child: Column(
            children: [
              Text(
                value2,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2,),
              Text(
                title2,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0XFF666666),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _createClose() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(IMG.format("close"), width: 24, height: 24,),
        ),
      ),
    );
  }
}