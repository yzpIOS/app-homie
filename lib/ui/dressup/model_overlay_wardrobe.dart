import 'package:app/common/theme.dart';
import 'package:app/store/cloth_selector_ctrl.dart';
import 'package:app/store/my_dressup_ctrl.dart';
import 'package:app/store/my_wardrobe_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ModelOverlay$Wardrobe extends StatelessWidget {
  late final wardrobeCtrl = Get.find<MyWardrobeCtrl>();
  late final selectorCtrl = Get.find<ClothSelectorCtrl>();
  late final selector = selectorCtrl.selectorWardrobe;

  ModelOverlay$Wardrobe({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 5,
          bottom: 120,
          child: Column(
            children: [
              $IconBtn(icon: '重置', color: AppPalette.c9, onTap: _doReset),
            ],
          ),
        ),
        Positioned(
          right: 10,
          bottom: 60,
          width: 60,
          height: 30,
          child: Obx(() {
            final ids = selector.ids;

            return ids.isEmpty
                ? $TextBtn(label: '赠送')
                : $TextBtn(
                    label: '赠送${ids.length}',
                    onTap: () => _doGive(ids),
                  );
          }),
        ),
        Positioned(
          right: 10,
          bottom: 20,
          width: 60,
          height: 30,
          child: Obx(() {
            final ids = selector.ids;

            return ids.isEmpty
                ? $TextBtn(label: '使用')
                : $TextBtn(
                    label: '使用${ids.length}',
                    onTap: () => _doUseAndSave(ids),
                  );
          }),
        ),
      ],
    );
  }

  Widget $IconBtn({required String icon, Color? color, VoidCallback? onTap}) {
    return OpacityButton(
      onTap: onTap,
      child: Box(
        padding: const Pad(all: 5),
        child: SvgView(SVG.$('dressup/$icon'), color: color, fit: BoxFit.none),
      ),
    );
  }

  Widget $TextBtn({required String label, VoidCallback? onTap}) {
    return XTextBtn(
      label: label,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$SemiBold),
      color: onTap == null ? AppPalette.hint : AppPalette.primary,
      onTap: onTap,
    );
  }

  void _doReset() {
    final selector = Get.find<ClothSelectorCtrl>().selectorWardrobe;

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
  }

  void _doUseAndSave(List<int> ids) async {
    final saveIds = await selector.dressUpIds();

    wardrobeCtrl.doUseAndSave(
      useIds: ids,
      saveIds: saveIds,
      callback: (resp) {
        Get.find<MyDressUpCtrl>().updateDressUp(resp);

        selector.doReset();
      },
    );
  }

  void _doGive(List<int> ids) {
    wardrobeCtrl.doGive(
      ids: ids,
      callback: selector.doReset,
    );
  }
}
