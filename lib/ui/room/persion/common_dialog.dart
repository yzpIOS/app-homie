
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/room/persion/down_mic_settle_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

///
/// 个播：通用弹窗
///
class CommonDialog extends StatefulWidget {
  // 主标题
  String title;

  // 副标题
  String? subTitle;

  // 确认回调
  Function confirm;
  String confirmLabel;

  // 取消回调
  Function? cancel;
  String cancelLabel;

  CommonDialog({
    required this.title,
    required this.confirm,
    this.confirmLabel = "确认",
    this.subTitle,
    this.cancel,
    this.cancelLabel = "取消"
  });

  @override
  State<StatefulWidget> createState() => _DownMicConfirmState();

  ///
  /// 个人房：申请上麦
  ///
  static void applyUpMic() async {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "向群主申请上麦聊天？", confirm:  () {

      });
    });
  }

  ///
  /// 个人房：群主拒绝了你的上麦申请
  ///
  static void refuseApplyUpMic() async {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "群主拒绝了你的上麦申请", cancelLabel: "再次申请", confirm:  () {
        // 确认
        Get.back();
      }, cancel: () {
        // todo 再次申请
      },);
    });
  }

  ///
  /// 个人房：群主邀请你上麦聊天
  ///
  static void inviteApplyUpMic() async {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "群主邀请你上麦聊天", cancelLabel: "拒绝", confirmLabel: "同意", confirm:  () {
        // todo 同意邀请
      });
    });
  }

  ///
  /// 个人房：确认下麦吗？
  ///
  static void userApplyDownMic() async {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "确认下麦吗？", subTitle: "再次上麦需要向群主发出申请", cancelLabel: "我再想想", confirmLabel: "我要下麦", confirm:  () {
        // todo 同意邀请
      });
    });
  }

  ///
  /// 个人房：是否降低画质平衡模式？
  ///
  static void changeLowMode() {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "是否降低画质平衡模式？", confirm:  () {

      });
    });
  }

  ///
  /// 个人房：是否进入2d模式？
  ///
  static void change2DMode() {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "是否进入2d模式？", confirm:  () {

      });
    });
  }

  ///
  /// 个人房：你当前正在直播中，是否下播？
  ///
  static void confirmDownMic() {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "你当前正在直播中，是否下播？", confirm:  () {

      });
    });
  }
}

class _DownMicConfirmState extends State<CommonDialog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 303,
          height: (widget.subTitle?.isNotEmpty == true && widget.title?.isNotEmpty == true) ? 167 : 161,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 27,),
              // 标题
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if(widget.subTitle == null || widget.subTitle?.isEmpty == true)
                SizedBox(height: 55,),

              // 富标题
              if(widget.subTitle?.isNotEmpty == true)
                SizedBox(height: 12,),
              if(widget.subTitle?.isNotEmpty == true)
                Text(
                  widget.subTitle ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0XFF999999),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if(widget.subTitle?.isNotEmpty == true)
                SizedBox(height: 28,),

              Row(
                children: [
                  _createCancelButton(),
                  const Expanded(child: SizedBox()),
                  _createAgreeButton(),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createCancelButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
        // 显示结算
        delay(500, () {
          widget.cancel?.call();
        });
      },
      child: Container(
        width: 117,
        height: 30,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF7F95F7),
                  Color(0xFF9ABCFF),
                ]
            ),
            borderRadius: AppBorderRadius.max,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF7F95F7),
                offset: Offset(0.0, 3.0),
                spreadRadius: 0,
                blurRadius: 5,
              )
            ]
        ),
        child: Text(
          widget.cancelLabel,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }


  Widget _createAgreeButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
        // 显示结算
        delay(500, () {
          widget.confirm.call();
        });
      },
      child: Container(
        width: 117,
        height: 30,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFF7A665),
                  Color(0xFFFFC893),
                ]
            ),
            borderRadius: AppBorderRadius.max,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFFFC394),
                offset: Offset(0.0, 3.0),
                spreadRadius: 0,
                blurRadius: 5,
              )
            ]
        ),
        child: Text(
          widget.confirmLabel,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }


}