import 'package:app/common/theme.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/my_dressup_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ModelOverlay$Cloth extends StatelessWidget {
  late final dressUpCtrl = Get.find<MyDressUpCtrl>();
  late final selectorCtrl = Get.find<ClothSelectorCtrl>();
  late final selector = selectorCtrl.selectorCloth;

  ModelOverlay$Cloth({super.key});

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$SemiBold);

    return Stack(
      children: [
        // Positioned(
        //   top: 5,
        //   left: 5,
        //   child: Column(
        //     children: [
        //       // $IconBtn(icon: '头部', color: AppPalette.c9, onTap: onItemClick),
        //       // $IconBtn(icon: '全身', color: AppPalette.c9, onTap: onItemClick),
        //       // $IconBtn(icon: '小屋', color: AppPalette.c9, onTap: onItemClick),
        //     ],
        //   ),
        // ),
        Positioned(
          right: 27,
          bottom: 120,
          child: Column(
            children: [
              // $IconBtn(icon: '返回', color: AppPalette.c9, onTap: onItemClick),
              // $IconBtn(icon: '前进', color: AppPalette.c9, onTap: onItemClick),
              $IconBtn(icon: '重置', color: AppPalette.primary, onTap: onItemClick),
            ],
          ),
        ),
        Positioned(
          right: 13,
          bottom: 20,
          width: 60,
          height: 30,
          child: Obx(() {
            final isEqual = listEquals(selector.ids, dressUpCtrl.ids.toList(growable: false));
            
            return XTextBtn(
              label: '保存',
              textStyle: ts,
              color: isEqual ? AppPalette.hint : AppPalette.primary,
              onTap: () {
                if (isEqual) {
                  return;
                }
                onItemClick('保存');
              },
            );
          }),
        ),
      ],
    );
  }

  Widget $IconBtn({required String icon, Color? color, ValueChanged<String>? onTap}) {
    return OpacityButton(
      onTap: onTap == null ? null : () => onTap(icon),
      child: Box(
        padding: const Pad(all: 5),
        child: SvgView(
          SVG.$('dressup/$icon'),
          color: color,
          fit: BoxFit.none,
        ),
      ),
    );
  }

  void onItemClick(String action) {
    switch (action) {
      case '保存':
        dressUpCtrl.doSave(ids: selector.ids);
        break;
      case '重置':
        final selector = Get.find<ClothSelectorCtrl>().selectorCloth;

        Get.showActionSheet(const ['恢复上一次的搭配', '清除所有单品']).onNotNull((val) {
          switch (val) {
            case '恢复上一次的搭配':
              selector.doReset();
              break;
            case '清除所有单品':
              selector.doClear();
              break;
          }
        });
        break;
    }
  }
}
