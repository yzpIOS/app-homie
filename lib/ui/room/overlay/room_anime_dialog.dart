import 'package:app/common/theme.dart';
import 'package:app/store/my_anime_ctrl.dart';
import 'package:app/store/unity_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoomAnimeDialog extends StatelessWidget {
  const RoomAnimeDialog._();

  static Future<String?> show() {
    const decor = ShapeDecoration(
      shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
      color: Color(0xCC333333),
    );

    return OrientationSheet.show<String>(
      child: const RoomAnimeDialog._(),
      minHeight: 0,
      decoration: decor,
      direction: Get.isLandscape ? SheetOrientation.right : SheetOrientation.bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationSheet.scaffold(
      title: '动作',
      textStyle: const TextStyle(color: Colors.white),
      body: $BodyView(),
    );
  }

  Widget $BodyView() {
    return SizedBox(
      height: 260,
      child: GetX<MyAnimeCtrl>(
        initState: (it) => it.controller!.doRefresh(),
        builder: (it) {
          return _DataView(data: it.autoGet(), doRefresh: it.doRefresh);
        },
      ),
    );
  }
}

class _DataView extends StatelessWidget {
  final List<Map> data;
  final Future Function() doRefresh;

  _DataView({required this.data, required this.doRefresh});

  final sendCmd2Unity = Get.find<UnityCtrl>().sendCmd;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return LayoutBuilder(
        builder: (_, c) {
          return SizedBox(
            width: c.maxWidth,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: context.state<DataEmpty>(doRefresh),
            ),
          );
        },
      );
    }

    const delegate = XGridDelegate(
      crossAxisCount: 4,
      fixedHeight: 5 + 23,
      mainAxisSpacing: 10,
      crossAxisSpacing: 26,
    );

    return GiftImgState(
      child: GridView.builder(
        padding: Pad(horizontal: 20, vertical: 10, bottom: AppSize.safeBottom),
        gridDelegate: delegate,
        itemCount: data.length,
        itemBuilder: (_, i) => itemBuilder(data[i]),
      ),
    );
  }

  Widget itemBuilder(Map data) {
    Widget child = Padding(
      padding: const Pad(top: 5),
      child: AspectRatio(
        aspectRatio: 1,
        child: NetImage(data['image']),
      ),
    );

    child = Column(
      children: [
        child,
        Expanded(
          child: Center(
            child: XText(
              data['name'] ?? '',
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ),
      ],
    );

    child = OpacityButton(
      child: child,
      onTap: () {
        sendCmd2Unity(App2UnityEnum.FTU_PLAY_MOTION, data: {'goodsId': data['product_id']});

        Get.back();
      },
    );

    return child;
  }
}
