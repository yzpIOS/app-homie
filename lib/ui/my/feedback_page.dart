import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

///type 类型：1.房间 2.用户 3.动态
class FeedbackPage extends StatefulWidget {
  final int type;
  final Object id;

  const FeedbackPage({super.key, required this.type, required this.id});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '意见反馈'),
      resizeToAvoidBottomInset: false,
      body: $Body(),
    );
  }

  Widget $Body() {
    Widget child = TextField(
      minLines: 1,
      maxLines: 10,
      controller: controller,
      decoration: const InputDecoration(
        hintText: '请描述您所遇到的问题，我们会竭诚为您改善。',
      ),
      style: const TextStyle(fontSize: 14, color: Colors.black),
    );

    child = SingleChildScrollView(
      padding: const Pad(horizontal: 16, vertical: 10),
      child: child,
    );

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

  void doSub() {
    final txt = controller.text;

    if (txt.isEmpty) {
      showToast('请描述您所遇到的问题');

      return;
    }

    simpleSub(
      Api.Common.report(type: widget.type, id: widget.id, context: txt),
      callback: () {
        Get.alertDialog('提交已收到，感谢您的反馈').whenComplete(Get.back);
      },
    );
  }
}
