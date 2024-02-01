
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/ui/room/persion/down_mic_settle_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:path/path.dart';

///
/// 个播：通用弹窗
///
class CommonDialog extends StatefulWidget {
  // 主标题
  String title;
  RichText? richTextTitle;

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
    this.cancelLabel = "取消",

    this.richTextTitle,
  });

  @override
  State<StatefulWidget> createState() => _DownMicConfirmState();

  ///
  /// 个人房：申请上麦
  ///
  static void applyUpMic(Function confirm, bool reRequest) async {
    // 再次申请
    if(reRequest) {
      showDialog(context: Get.context!, builder: (context) {
        return CommonDialog(
          title: "房主拒绝了你的上麦申请",
          cancel: () {
            confirm.call();
          },
          cancelLabel: "再次申请",
          confirm: () {

          },
        );
      });
      return;
    }

    // 第一次申请
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(
        title: "向房主申请上麦聊天？",
        confirm:  () {
          confirm.call();
        }
      );
    });
  }

  ///
  /// 个人房：房主拒绝了你的上麦申请
  ///
  static void refuseApplyUpMic(Function applyAgain) async {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "房主拒绝了你的上麦申请", cancelLabel: "再次申请", confirm:  () {
        // 确认
      }, cancel: () {
        // todo 再次申请
        applyAgain.call();
      },);
    });
  }

  ///
  /// 个人房：房主邀请你上麦聊天
  ///
  static void inviteApplyUpMic(Function callBack) async {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "房主邀请你上麦聊天", cancelLabel: "拒绝", confirmLabel: "同意", confirm:  () {
        // todo 同意邀请
        callBack.call();
      });
    });
  }

  ///
  /// 个人房：确认下麦吗？
  ///
  static void userApplyDownMic(Function onMicDownCallBack) async {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "确认下麦吗？", confirmLabel: "我要下麦", confirm:  () {
        // todo 同意邀请
      });
    });
  }

  ///
  /// 申请上麦
  ///
  static void receiveApplyMicUp(String name, Function onMicDownCallBack, Function cancel) async {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "$name 向你申请上麦，是否同意？", cancelLabel: "拒绝", confirmLabel: "同意", confirm:  () {
        // todo 同意邀请
        onMicDownCallBack.call();
      }, cancel: () {
        cancel.call();
      },);
    });
  }

  ///
  /// 个人房：确认下麦吗？
  ///
  static void userConfirmDownMic(Function onMicDownCallBack) async {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "确认下麦吗？", confirm:  () {
        // todo 同意邀请
        onMicDownCallBack.call();
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
  static void confirmDownMic(Function callBack) {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "你当前正在直播中，是否下播？", confirm:  () {
        callBack.call();
      });
    });
  }

  ///
  /// 立即使用
  ///
  static void useImmediate(Function callBack) {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "是否立即使用？", confirm:  () {
        callBack.call();
      });
    });
  }

  ///
  /// 去充值
  ///
  static void toCharge(Function callBack) {
    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "你的钻石不够了,先买点钻石吧~ ", confirmLabel: "去充值", confirm:  () {
        callBack.call();
      });
    });
  }

  static void confirmBuy(int count, String name, Function callBack) {
    var span = RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "确定花费",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF000000),
            )
          ),
          TextSpan(
              text: "$count",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFFF8D30),
            )
          ),
          TextSpan(
              text: "钻石, 购买$name吗？",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF000000),
              )
          ),
        ],
      ),
    );

    showDialog(context: Get.context!, builder: (context) {
      return CommonDialog(title: "", richTextTitle: span, confirm:  () {
        callBack.call();
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 303,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 27,),
                  // 标题
                  if(widget.title.isNotEmpty)
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  if(widget.richTextTitle != null)
                    widget.richTextTitle!,

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
            )
          ],
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