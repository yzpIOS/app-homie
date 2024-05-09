import 'dart:ui';
import 'package:app/tools.dart';
import 'package:app/tools/text_extension.dart';
import 'package:app/ui/my/my_guild/anchor_apply_list_controller.dart';
import 'package:app/widgets/app_bar.dart';
import 'package:app/widgets/image/network_cache_image.dart';
import 'package:app/widgets/spacing.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

/// 主播申请列表页面
class AnchorApplyListPage extends StatelessWidget {
  const AnchorApplyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnchorApplyListController>(
        init: AnchorApplyListController(),
        builder: (AnchorApplyListController controller) {
          return Scaffold(
            appBar: xAppBar(title: '申请列表'),
            body: Column(
              children: [
                Spacing.h4,
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return _itemWidget(controller, index);
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        color: const Color(0xFFF5F5F5),
                        margin: const Pad(horizontal: 20),
                      );
                    },
                    itemCount: 16,
                  ),
                ),
                SizedBox(
                  height: MediaQueryData.fromView(window).padding.bottom,
                ),
              ],
            ),
          );
        });
  }

  /// 列表项
  Widget _itemWidget(AnchorApplyListController controller, int index) {
    return Container(
      height: 70,
      padding: const Pad(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const NetImage(
                'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF',
                width: 40,
                height: 40,
                fit: BoxFit.contain),
          ),
          Spacing.w10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("叮叮猫${index + 1}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0000000),
                    )),
                Spacing.h2,
                Text(
                  "ID:1234567${index + 1}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
          ),
          Spacing.w10,
          Text("拒绝", style: Colors.white.pt(14)).toBtn(
            width: 50,
            height: 26,
            radius: 21,
            linearGradient: const LinearGradient(
              colors: [Color(0xFFB1C9FF), Color(0xFF6C8AF6)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            onTap: (){}
          ),
          Spacing.w10,
          Text("同意", style: Colors.white.pt(14)).toBtn(
            width: 50,
            height: 26,
            radius: 21,
            linearGradient: const LinearGradient(
              colors: [Color(0xFFFFCD9F), Color(0xFFFF9640)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
              onTap: (){}
          ),
        ],
      ),
    );
  }
}
