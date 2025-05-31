import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoomUpMicApplyOrDisposeDialog extends StatelessWidget {
  final int showType;//1发起上麦申请  2处理上麦申请
  const RoomUpMicApplyOrDisposeDialog({super.key, required this.showType});

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (showType == 1) {//1发起上麦申请
      child = $ApplyTypeView();
    } else {//2处理上麦申请
      child = $DisposeTypeView();
    }

    child = Material(
      borderRadius: AppBorderRadius.a14,
      color: Colors.white,
      child: child,
    );

    child = Container(
      width: 303,
      height: 154,
      margin: const Pad(horizontal: 35),
      child: child,
    );

    child = FittedBox(fit: BoxFit.contain, child: child);

    return child;
  }

  Widget $ApplyTypeView() {
    return Column(
      children: [
        const Spacing(height: 24, flex: null,),
        const XText(
          '房主已开启上麦申请',
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
        ),
        const Spacing(height: 8, flex: null,),
        const XText(
          '是否申请上麦',
          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: fw$Medium),
        ),
        const Spacing(height: 18, flex: null,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            $ActionBtn(
              '取消',
              [const Color(0xFF7F95F7), const Color(0xFF9ABCFF)],
              [const BoxShadow(
                color: Color(0xFF9499FF),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),],
            ),
            $ActionBtn(
              '申请',
              [const Color(0xFFF7A665), const Color(0xFFFFC893)],
              [const BoxShadow(
                color: Color(0xFFFFC394),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),],
            ),
          ],
        ),
      ],
    );
  }

  Widget $DisposeTypeView() {
    return Column(
      children: [
        const Padding(
          padding: Pad(top: 18, left: 28),
          child: Row(
            children: [
              AvatarView('', size: 42),
              Spacing(width: 8, flex: null,),
              XText(
                '牛牛大花花',
                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Medium),
              ),
            ],
          ),
        ),
        const Spacing(height: 3, flex: null,),
        const XText(
          '申请上麦',
          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: fw$Medium),
        ),
        const Spacing(height: 15, flex: null,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            $ActionBtn(
              '拒绝',
              [const Color(0xFF7F95F7), const Color(0xFF9ABCFF)],
              [const BoxShadow(
                color: Color(0xFF9499FF),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),],
            ),
            $ActionBtn(
              '同意',
              [const Color(0xFFF7A665), const Color(0xFFFFC893)],
              [const BoxShadow(
                color: Color(0xFFFFC394),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),],
            ),
          ],
        ),
      ],
    );
  }

  Widget $ActionBtn(String text, List<Color> colors, List<BoxShadow> shadows) {
    Widget child = Text(
      text,
      style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
    );

    child = Container(
      width: 110,
      height: 30,
      decoration: ShapeDecoration(
        shape: const XStadiumBorder(),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: colors,
        ),
        shadows: shadows,
      ),
      alignment: Alignment.center,
      padding: const Pad(bottom: 3),
      child: child,
    );

    child = OpacityButton(
      child: child,
      onTap: () => onItemClick(text),
    );

    return child;
  }

  void onItemClick(String action) {
    switch (action) {
      case '取消':
      case '拒绝':
        Get.back();
        break;
      case '申请':

        break;
      case '同意':

        break;
      default:
        break;
    }
  }
}
