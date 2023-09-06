
import 'package:app/common/theme.dart';
import 'package:app/store/room/room_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

///
/// https://www.tapd.cn/68741847/prong/stories/view/1168741847001000563
/// 管理下麦：管理在工具栏内点击下麦按钮，弹出下麦管理弹窗，管理多选或单选需要下麦人员点击下麦按钮 ，选择人员下麦。
///
class MicUserOnlineManagerSheet extends StatefulWidget {
  // 用户uid
  final UID uid;
  // 场景类
  SceneCtrl? sceneCtrl = null;

  MicUserOnlineManagerSheet._({required this.uid, this.sceneCtrl = null});

  static void show({required UID uid}) {
    // final sceneCtrl = Get.find<RoomManagerCtrl>().sceneCtrl;

    OrientationSheet.show(
      child: MicUserOnlineManagerSheet._(uid: uid, sceneCtrl: null),
      decoration: const ShapeDecoration(
        shape: XRectangleBorder(borderRadius: AppBorderRadius.t12),
        color: Color(0xCC333333),
      ),
      minHeight: 0,
    );
  }

  @override
  State<MicUserOnlineManagerSheet> createState() => _UserManagerSheetState();
}

class _UserManagerSheetState extends State<MicUserOnlineManagerSheet> {

  List<String> selectedIds = <String>[];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: Pad(bottom: AppSize.safeBottom, left: 10, right: 10),
        child: Column(
          children: [
            // 房间管理， 踢下麦
            createTitle(),

            // 划线
            Divider(height: 0.5, color: const Color(0xFFCCCCCC).withAlpha(125),),

            // 房主,管理员
            // 人物列表
            createUserList(),
          ],
        ),
      ),
    );
  }

  ///
  /// 创建标题
  ///
  Widget createTitle() {
    return SizedBox(
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

          // 清零
          GestureDetector(
            onTap: () {

            },
            behavior: HitTestBehavior.opaque,
            child: SizedBox(width: 60, height: 24, child: $Btn2('下麦'),),
          ),
        ],
      ),
    );
  }

  ///
  /// 用户列表
  ///
  Widget createUserList() {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          const SizedBox(height: 16,).toSliver(),
          createItem("11").toSliver(),
          const SizedBox(height: 30,).toSliver(),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return createItem(index.toString());
              }, childCount: 30),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.0
              ))
        ],
      ),
    );
  }

  Widget createItem(String uid) {
    // 选中时的圆圈
    Decoration? decoration = null;
    if(selectedIds.contains(uid)) {
      decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(color: Color(0xFFC567FF), width: 2)
      );
    }

    return GestureDetector(
      onTap: () {
        if(selectedIds.contains(uid)) {
          selectedIds.remove(uid);
        } else {
          selectedIds.add(uid);
        }
        setState(() { });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
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
                  decoration: decoration,
                  child: AsyncAvatar(uid: uid, size: 80, onTap: Some(() {
                    if(selectedIds.contains(uid)) {
                      selectedIds.remove(uid);
                    } else {
                      selectedIds.add(uid);
                    }
                    setState(() { });
                  })),
                ),

                // 选中的状态
                if(selectedIds.contains(uid))
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(IMG.format("check"), width: 20, height: 20,),
                  )
              ],
            ),
          ),

          // 名称
          const SizedBox(height: 5,),
          const Text(
            "小星星",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          ),
        ],
      ),
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