import 'package:app/ui/room/game/fruitMachine/roll_slot.dart';
import 'package:app/ui/room/game/fruitMachine/roll_slot_controller.dart';
import 'package:app/widgets/image/network_cache_image.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class RollSlotWidget extends StatelessWidget {
  final List<String> prizesList;

  final RollSlotController rollSlotController;

  const RollSlotWidget(
      {super.key, required this.prizesList, required this.rollSlotController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 268,
      width: 90,
      child: RollSlot(
          itemExtend: 57.3,
          rollSlotController: rollSlotController,
          children: prizesList.map(
            (e) {
              return Container(
                color: Colors.transparent,
                padding: const Pad(vertical: 10),
                alignment: Alignment.center,
                child: NetImage(
                  e,
                  width: 37.5,
                  height: 37.5,
                  fit: BoxFit.contain,
                ),
              );
            },
          ).toList()),
    );
  }
}
