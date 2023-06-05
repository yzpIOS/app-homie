import 'package:app/common/theme.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

///type 类型：1.房间 2.用户 3.动态
class ReportPage extends StatefulWidget {
  final int type;
  final Object id;

  const ReportPage({super.key, required this.type, required this.id});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final typeRx = Rxn<Tuple2<int, String>>();
  final reasonRx = Rxn<Tuple2<int, String>>();
  final assetRx = RxList<AssetEntity>();

  final controller = TextEditingController();

  final types = const [
    Tuple2(1, '语音'),
    Tuple2(2, '个人信息'),
    Tuple2(3, '私信'),
    Tuple2(4, '公聊&留言板'),
  ];
  final reasons = const [
    Tuple2(1, '低俗色情'),
    Tuple2(2, '侮辱谩骂'),
    Tuple2(3, '谣言政治'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '举报'),
      resizeToAvoidBottomInset: false,
      body: $Body(),
    );
  }

  Widget $Body() {
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        $Title(title: '举报类型', tips: '（必填）'),
        $MenuView(items: types, valRx: typeRx),
        const Divider(),
        $Title(title: '举报原因', tips: '（必填）'),
        $MenuView(items: reasons, valRx: reasonRx),
        const Divider(),
        $Title(title: '详情描述', tips: '（选填）'),
        TextField(
          minLines: 2,
          maxLines: 10,
          controller: controller,
          decoration: const InputDecoration(
            hintText: '描述更多信息，如违规时间，TA做了什么~',
          ),
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        $Title(title: '图片/视频证据', tips: '（选填）'),
        ImageSelectView(assetRx, maxCount: 9, crossCount: 4, spacing: 10),
      ],
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
      child: child,
    );

    child = SingleChildScrollView(
      padding: const Pad(horizontal: 16, vertical: 20),
      child: child,
    );

    child = SizedBox(width: double.infinity, child: child);

    child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: child),
        Padding(
          padding: Pad(bottom: AppSize.safeBottom + 20),
          child: FractionallySizedBox(
            widthFactor: 0.618,
            child: XTextBtn(label: '提交', onTap: doSub),
          ),
        ),
      ],
    );

    return child;
  }

  Widget $MenuView({required List<Tuple2<int, String>> items, required Rxn<Tuple2<int, String>> valRx}) {
    Widget child = Obx(() {
      final data = valRx();

      return data == null
          ? const Text(
              '请选择',
              style: TextStyle(fontSize: 14, color: AppPalette.c9, fontWeight: fw$Regular),
            )
          : Text(
              data.value2,
              style: const TextStyle(fontSize: 14, color: AppPalette.c3, fontWeight: fw$Regular),
            );
    });

    child = Box(
      width: double.infinity,
      height: 48,
      alignment: Alignment.centerLeft,
      padding: const Pad(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          child,
          const RightArrowIcon(),
        ],
      ),
    );

    child = InkWell(
      child: child,
      onTap: () => Get.showSheet(items, toTitle: (it) => Tuple2(it.value2, null)).onNotNull(valRx),
    );

    return child;
  }

  Widget $Title({required String title, required String tips}) {
    return Box(
      padding: const Pad(top: 20, bottom: 5),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              text: title,
              children: [
                TextSpan(
                  text: tips,
                  style: const TextStyle(fontSize: 12, color: AppPalette.c9, fontWeight: fw$Regular),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void doSub() {
    final type = typeRx();
    final reason = reasonRx();

    if (type == null) {
      showToast('请选择举报类型');

      return;
    }

    if (reason == null) {
      showToast('请选择举报原因');

      return;
    }

    simpleSub(
      () async {
        final tasks = assetRx.map(
          (it) {
            switch (it.type) {
              case AssetType.image:
                return Api.Common.addMedia(attach: AssetImageAttach(asset: it), blurHash: false);
              case AssetType.video:
                return Api.Common.addMedia(attach: AssetVideoAttach(asset: it), blurHash: false);
              default:
                return null;
            }
          },
        );

        final medias = await Future.wait(tasks.whereNotNull());

        return Api.Common.report(
          type: widget.type,
          id: widget.id,
          reportType: type.value1,
          reason: reason.value1,
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
