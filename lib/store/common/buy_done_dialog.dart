import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class BuyDoneDialog extends StatelessWidget {
  final List data;

  BuyDoneDialog({super.key, required this.data}) : assert(data.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    Widget child = Stack(
      alignment: Alignment.center,
      children: [
        const Positioned(
          top: 20,
          child: XText(
            '恭喜您购买成功！',
            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: fw$SemiBold),
          ),
        ),
        Positioned(
          top: 60,
          left: 10,
          right: 10,
          bottom: 80,
          child: $DataView(),
        ),
        Positioned(
          width: 200,
          height: 40,
          bottom: 20,
          child: $Btn(),
        ),
      ],
    );

    child = Material(
      color: Colors.white,
      borderRadius: AppBorderRadius.a12,
      //TODO
      textStyle: const TextStyle(fontSize: 22, fontWeight: fw$SemiBold),
      child: child,
    );

    child = Container(
      width: 335,
      height: 318,
      margin: const Pad(horizontal: 20),
      child: child,
    );

    child = FittedBox(fit: BoxFit.contain, child: child);

    return child;
  }

  Widget $DataView() {
    Widget itemBuilder(Map item) {
      const _decor = BoxDecoration(
        borderRadius: AppBorderRadius.a12,
        border: Border.fromBorderSide(BorderSide(width: 2, color: AppPalette.primary)),
      );

      Widget child = DecoratedBox(
        decoration: _decor,
        child: Padding(
          padding: const Pad(all: 6),
          child: BlankImgState(
            child: NetImage(item['image']),
          ),
        ),
      );

      return child;
    }

    const delegate = SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1,
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
    );

    return GridView.builder(
      gridDelegate: delegate,
      itemCount: data.length,
      itemBuilder: (_, i) => itemBuilder(data[i]),
    );
  }

  Widget $Btn() {
    return XTextBtn(
      label: '去使用',
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
      onTap: () {
        Get.back();

        const GoWardrobeEvent().fire();
      },
    );
  }
}
