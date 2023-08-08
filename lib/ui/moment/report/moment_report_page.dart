import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/topic/topic_select_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_manager/photo_manager.dart';

class MomentReportPage extends StatefulWidget {
  final Object id;

  const MomentReportPage({super.key, required this.id});

  @override
  State<MomentReportPage> createState() => _MomentReportPageState();
}

class _MomentReportPageState extends State<MomentReportPage> {
  final controller = TextEditingController();

  final reportReasonRx = RxInt(0); //举报原因
  final contentCountRx = RxInt(0); //详情描述数字
  final assetRx = RxList<AssetEntity>(); //图片/视频证据数组

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      contentCountRx.value = controller.text.length;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: xAppBar(title: '举报'),
      body: $BodyView(),
    );
  }

  Widget $BodyView() {
    Widget child = SingleChildScrollView(
        padding: const Pad(horizontal: 10, top: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              $SectionHeaderView(title: '举报原因', tips: '（必填）'),
              $ReasonsView(),
              Obx(() => $SectionHeaderView(title: '详情描述',
                  tips: '（选填）',
                  rightTips: '${contentCountRx.value}/150')),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 5, bottom: 20),
                padding: const Pad(left: 10),
                height: 98,
                decoration: const BoxDecoration(
                  borderRadius: AppBorderRadius.a4,
                  color: AppPalette.background2,
                ),
                child: TextField(
                  inputFormatters: [LengthLimitingTextInputFormatter(150)],
                  //限制长度
                  maxLines: 30,
                  controller: controller,
                  decoration: const InputDecoration(
                    counterText: "",
                    hintText: '描述更多信息，如违规时间，TA做了什么~',
                    hintStyle: TextStyle(fontSize: 12,
                        color: AppPalette.c9,
                        fontWeight: fw$Regular),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 12,
                      color: Colors.black,
                      fontWeight: fw$Regular),
                ),
              ),
              Obx(() => $SectionHeaderView(title: '图片/视频证据',
                  tips: '（选填）',
                  rightTips: '${assetRx.value.length}张/9')),
              const Spacing(height: 10, flex: null),
              ImageSelectView(assetRx, maxCount: 9, crossCount: 5, spacing: 10),
            ]
        )
    );

    child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: child),
        Padding(
          padding: Pad(top: 20, bottom: AppSize.safeBottom + 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              XOutlinedBtn(
                  width: 100,
                  label: '取消',
                  textStyle: const TextStyle(fontSize: 14,
                      color: AppPalette.txtDark,
                      fontWeight: fw$SemiBold),
                  side: const BorderSide(color: Color(0xFF707070)),
                  onTap: () => Get.back()
              ),
              const SizedBox(width: 55,),
              XTextBtn(
                  color: AppPalette.primary,
                  width: 100,
                  label: '提交',
                  textStyle: const TextStyle(fontSize: 14,
                      color: AppPalette.txtWhite,
                      fontWeight: fw$SemiBold),
                  onTap: doSub
              ),
            ],
          ),
        ),
      ],
    );

    return child;
  }

  Widget $ReasonsView() {
    final data = [
      '低俗色情',
      '暴恐血腥',
      '政治敏感',
      '谩骂攻击',
      '虚假消息',
      '推销广告',
      '抄袭内容',
      '危害未成年人',
      '侵犯权益',
      '其他',
    ];

    Widget reasonItemView(text, index) {
      return Obx(() {
        return OpacityButton(
          onTap: () {
            reportReasonRx.value = index + 1;
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(child: Text(text, style: const TextStyle(fontSize: 14,
                    color: AppPalette.txtDark,
                    fontWeight: fw$Regular),)),
                XRadio(
                  value: index + 1 == reportReasonRx.value,
                  onChanged: (_) {
                    reportReasonRx.value = index + 1;
                  },
                ),
              ],
            ),
          ),
        );
      });
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return reasonItemView(data[index], index);
      },
      separatorBuilder: (BuildContext context, int index) =>
      const Divider(color: AppPalette.cc,),
    );
  }

  Widget $SectionHeaderView(
      {required String title, required String tips, String? rightTips}) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
                text: title,
                style: const TextStyle(fontSize: 16,
                    color: AppPalette.txtDark,
                    fontWeight: fw$SemiBold),
                children: [
                  TextSpan(text: tips,
                    style: const TextStyle(fontSize: 12,
                        color: AppPalette.c9,
                        fontWeight: fw$Regular),),
                ]
            ),
          ),
        ),
        if (rightTips != null) Text(rightTips, style: const TextStyle(
            fontSize: 12, color: AppPalette.c9, fontWeight: fw$Regular),)
      ],
    );
  }

  void doSub() {
    if (reportReasonRx.value <= 0) {
      showToast('请选择举报原因');
      return;
    }

    simpleSub(
          () async {
        final tasks = assetRx.map(
              (it) {
            switch (it.type) {
              case AssetType.image:
                return Api.Common.addMedia(
                    attach: AssetImageAttach(asset: it), blurHash: false);
              case AssetType.video:
                return Api.Common.addMedia(
                    attach: AssetVideoAttach(asset: it), blurHash: false);
              default:
                return null;
            }
          },
        );

        final medias = await Future.wait(tasks.whereNotNull());

        return Api.Common.report(
          type: 3,
          id: widget.id,
          reason: reportReasonRx.value,
          context: controller.text,
          medias: medias.map((it) => it.value2).toList(growable: false),
        );
      },
      callback: () {
        Get.alertDialog('提交已收到，感谢您的反馈').whenComplete(Get.back);
      },
    );
  }

}
