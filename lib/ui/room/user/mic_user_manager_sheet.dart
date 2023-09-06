
import 'package:app/common/theme.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

///
/// 房间管理
///
class MicUserManagerSheet extends StatefulWidget {
  // 用户uid
  final UID uid;
  // 场景类
  SceneCtrl? sceneCtrl = null;

  MicUserManagerSheet._({required this.uid, this.sceneCtrl = null});

  static void show({required UID uid}) {
    // final sceneCtrl = Get.find<RoomManagerCtrl>().sceneCtrl;

    OrientationSheet.show(
      child: MicUserManagerSheet._(uid: uid, sceneCtrl: null),
      decoration: const ShapeDecoration(
        shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
        color: Color(0xCC333333),
      ),
      minHeight: 0,
    );
  }

  @override
  State<MicUserManagerSheet> createState() => _UserManagerSheetState();
}

class _UserManagerSheetState extends State<MicUserManagerSheet> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: Pad(bottom: AppSize.safeBottom, left: 10, right: 10),
        child: Column(
          children: [
            // 房间管理， 踢下麦
            SizedBox(
              height: 52,
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "房间管理",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  SizedBox(width: 60, height: 24, child: $Btn2('清零'),),
                ],
              ),
            ),

            // 划线
            Divider(height: 0.5, color: const Color(0xFFCCCCCC).withAlpha(125),),

            // 房主,管理员
            // 人物列表
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SizedBox(height: 16,).toSliver(),
                  createItem("11").toSliver(),
                  SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return createItem(index.toString());
                      }, childCount: 30),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.8
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createItem(String uid) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 头像
        SizedBox(
          width: 55,
          height: 55,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(color: Color(0xFFC567FF), width: 2)
                ),
                child: AsyncAvatar(uid: uid, size: 80),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(IMG.format("check"), width: 20, height: 20,),
              )
            ],
          ),
        ),

        // 名称
        const SizedBox(height: 5,),
        Text(
          "小星星",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14
          ),
        ),

        // 热度
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IMG.format("icon_hot"), width: 20, height: 20,),
            Text(
              "234",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
              ),
            ),
          ],
        )
      ],
    );
  }

  void onItemClick(String action) {

  }


  Widget $Btn2(String title) {
    return XTextBtn(
      label: title,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$Medium),
      onTap: () => onItemClick(title),
    );
  }
}