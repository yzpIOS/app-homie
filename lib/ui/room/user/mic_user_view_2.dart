import 'package:app/3rd/tencent/rtc.dart';
import 'package:app/common/theme.dart';
import 'package:app/model/enum/room_role_type.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/room/room_mic_ctrl.dart';
import 'package:app/store/room/scene_mic_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/room/user/hot_info_dialog.dart';
import 'package:app/ui/room/user/mic_user_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class _MicUserView extends StatelessWidget {
  final RoomRoleType? myRole;

  _MicUserView({super.key, this.myRole});

  late final controller = sceneMicCtrl<RoomMicCtrl>();
}

class MicUser$Header extends _MicUserView {
  MicUser$Header({super.key, super.myRole});

  static double itemH = _MicView.itemH;

  @override
  Widget build(BuildContext context) {
    var maxMic = controller.maxMic;

    Widget child = SizedBox(
      height: _MicView.itemH,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (maxMic > 0)
            Positioned(
              width: _MicView.itemW,
              height: _MicView.itemH,
              child: _ItemView(no: '1', controller: controller, myRole: myRole),
            ),
        ],
      ),
    );

    // 计算有多少列
    var numOfColumn = 4;
    var column = 0;
    if(maxMic > 1) {
      if((maxMic - 1) % numOfColumn == 0) {
        column = (maxMic - 1) ~/ numOfColumn;
      } else {
        column = (maxMic - 1) ~/ numOfColumn + 1;
      }
    }

    // 麦位间的间距
    double gap = (Get.width - _MicView.itemW * 4 - 33 * 2) / 3;
    const pad = _MicView.padding;
    var children = <Widget>[];

    for(int index = 0; index < column; index ++) {
      var count = numOfColumn;
      if(column - 1 == index) {
        count = maxMic - index * numOfColumn - 1;
      }
      children.add(Container(
        height: _MicView.itemH,
        margin: EdgeInsets.only(top: index > 0 ? 10 : 0),
        child: ListView.separated(
          padding: pad.copyWith(top: 0, bottom: 0, left: 33),
          scrollDirection: Axis.horizontal,
          itemCount: count,
          addRepaintBoundaries: false,
          addAutomaticKeepAlives: false,
          itemBuilder: (_, i) {
            final no = '${i + (1 + 1) + index * numOfColumn}';

            // 主持位
            var micMo = i + index * numOfColumn + (1 + 1);
            if(micMo == maxMic) {
              return SizedBox(
                width: _MicView.itemW,
                height: _MicView.itemH,
                child: Transform.translate(
                  offset: const Offset(0, 0),
                  child: _ItemView(no: '$maxMic', controller: controller, myRole: myRole, type: 1),
                ),
              );
            }

            return _ItemView(no: no, controller: controller, myRole: myRole);
          },
          separatorBuilder: (_, i) {
            return SizedBox(width: gap,);
          },
        ),
      ));
    }

    if (maxMic > 1) {

      child = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 第一行
          child,

          // 第二行
          ...children
        ],
      );
    }

    return child;
  }
}

class MicUser$Right extends _MicUserView {
  MicUser$Right({super.key, super.myRole});

  static double itemH = _MicView.itemH;
  static const spacing = 4.0;
  static const padding = Pad(vertical: 6);

  @override
  Widget build(BuildContext context) {
    final isLandscape = context.watch<Orientation>() == Orientation.landscape;

    late final delegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: isLandscape ? 2 : 1,
      mainAxisSpacing: spacing,
      mainAxisExtent: _MicView.itemH,
    );

    return GridView.builder(
      padding: padding,
      gridDelegate: delegate,
      addRepaintBoundaries: false,
      addAutomaticKeepAlives: false,
      itemCount: controller.maxMic,
      itemBuilder: (_, i) {
        return _ItemView(no: '${i + 1}', controller: controller, myRole: myRole);
      },
    );
  }
}

class _ItemView extends StatelessWidget {
  final int type;
  final String no;
  final RoomRoleType? myRole;
  final RoomMicCtrl controller;

  _ItemView({required this.no, required this.controller, required this.myRole, this.type = 0})
      : super(key: ValueKey(no));

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final info = controller.simpleUserList.firstWhereOrNull((element) => element.no == no);

        return info == null ? $EmptyView(no) : $UserView(no, info);
      },
    );
  }

  Widget $EmptyView(String no) {
    TextStyle style;
    String text = '$no号麦';
    if(no == "1") {
      text = '主持';
    } else {
      text = '${(int.tryParse(no) ?? 1) - 1}号麦';
    }
    if(type == 0) {
      style = const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white);
    } else {
      text = "BOSS";
      style = const TextStyle(fontWeight: FontWeight.w900, color: Color(0xFFFBAF49), fontSize: 14);
    }
    return _MicView(
      avatar: InkResponse(
        onTap: () => MicUserSheet.show(no),
        child: Image.asset(IMG.format('room/mic/麦位_$type'), scale: 3, fit: BoxFit.contain),
      ),
      title: XText( text, style: style),
    );
  }

  Widget $UserView(String no, MicInfo item) {
    final uid = item.uid;
    final isSelf = OAuthCtrl.isSelf(uid);

    Widget $Avatar() {
      final child = AsyncAvatar(
        uid: uid,
        size: _MicView.itemW,
        onTap: Some(() => MicUserSheet.show(no, info: item)),
      );

      return Obx(
        () {
          final val = Rtc.speakRx[uid];

          return val == null
              ? child
              : MicAnimeBuilder(
                  value: val,
                  child: child,
                  builder: (context, value, child) => DecoratedBox(decoration: value, child: child),
                );
        },
      );
    }

    Widget $Mic() {
      return item.isMute
          ? $MicStateView('禁麦')
          : Obx(
              () {
                final bool isOpen;

                if (isSelf) {
                  isOpen = Rtc.micRx();
                } else {
                  isOpen = Rtc.openMicRx.contains(uid);
                }
                print('isOpen=&$isOpen');
                return isOpen ? Spacing.blank : $MicStateView('闭麦');
              },
            );
    }

    Widget $HotView() {
      GlobalKey globalKey = GlobalKey();
      return GestureDetector(
        onTap: () {
          int? roomId = RoomManagerCtrl.ins.sceneCtrl2?.roomId;
          if(item.hotCount <= 0 || roomId == null) {
            return;
          }
          var size = globalKey.currentContext?.findRenderObject()?.paintBounds.size;
          RenderBox? renderBox = globalKey.currentContext?.findRenderObject() as RenderBox?;
          // offset.dx , offset.dy 就是控件的左上角坐标
          var offset = renderBox?.localToGlobal(Offset.zero);
          var centerBottom = Offset((offset?.dx ?? 0),
              (offset?.dy ?? 0) + (size?.height ?? 0.0));

          HotInfoDialog.userApplyDownMic(roomId, item.nUid.toInt(), anchorPoint: centerBottom);
        },
        behavior: HitTestBehavior.opaque,
        child: XRichText(
          key: globalKey,
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.bottom,
                child: SvgView(SVG.$('room/热度'), width: 12, height: 12),
              ),
              TextSpan(text: '${item.hotCount}'),
            ],
          ),
        ),
      );
    }

    return RepaintBoundary(
      child: _MicView(
        tag: no == '1' ? 'presided' : null,
        mic: $Mic(),
        tips: $HotView(),
        avatar: $Avatar(),
        title: UserInfoCtrl.use(uid, builder: (it) {
          return XText(
            it?.showName ?? '',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white),);
        },
      ),
    ));
  }

  Widget $MicStateView(String state) {
    return Image.asset(
      IMG.format('room/mic/麦位_$state'),
      scale: 3,
      errorBuilder: (_, __, ___) => Spacing.blank,
    );
  }
}

class _MicView extends StatelessWidget {
  final Widget avatar;
  final Widget title;
  final Widget? mic;
  final Widget? tips;
  final String? tag;

  const _MicView({required this.avatar, required this.title, this.tips, this.mic, this.tag});

  static const double _count = 6;
  static final double _size = itemW - padding.horizontal;

  static const padding = Pad(top: 6, horizontal: 8);

  static double itemW = (AppSize.width - padding.horizontal) / _count;
  static double itemH = padding.vertical + _size + 24 + 12;

  @override
  Widget build(BuildContext context) {
    Widget child = Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned(width: _size, height: _size, child: avatar),
        if (tag != null) //
          Positioned(
            top: _size - 14,
            child: IgnorePointer(
                child: Image.asset(IMG.format("room/presided"), width: 40, height: 14,)
            ),
          ),
        if (mic != null) //
          Positioned(
            width: _size,
            height: _size,
            child: IgnorePointer(
              child: Align(
                alignment: Alignment.bottomRight,
                child: DefaultTextStyle.merge(
                  style: const TextStyle(fontWeight: fw$Medium),
                  child: mic!,
                ),
              ),
            ),
          ),
        Positioned(top: _size + 4, width: itemW, child: Center(child: title)),
        if (tips != null) //
          Positioned(
            left: 2,
            right: 2,
            bottom: 0,
            child: DefaultTextStyle.merge(
              style: const TextStyle(fontSize: 10),
              child: tips!,
            ),
          ),
      ],
    );

    child = SizedBox(
      width: itemW,
      height: itemH,
      child: Padding(padding: Pad(top: padding.top), child: child),
    );

    child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: Colors.white),
      child: child,
    );

    return child;
  }
}

class MicAnimeBuilder extends StatefulWidget {
  final double value;
  final Widget? child;

  final ValueWidgetBuilder<Decoration> builder;

  const MicAnimeBuilder({required this.value, required this.builder, this.child});

  @override
  State<MicAnimeBuilder> createState() => _MicAnimeBuilderState();
}

class _MicAnimeBuilderState extends State<MicAnimeBuilder> with SingleTickerProviderStateMixin {
  late final animation = AnimationController(vsync: this);

  final tween = DecorationTween(
    begin: const BoxDecoration(shape: BoxShape.circle),
    end: const BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: AppPalette.primary, blurRadius: 8, spreadRadius: 10),
      ],
    ),
  );

  @override
  void initState() {
    super.initState();

    _doPlay();
  }

  @override
  void didUpdateWidget(MicAnimeBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);

    _doPlay();
  }

  void _doPlay() {
    animation.animateTo(
      widget.value,
      curve: Curves.easeOutQuint,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    animation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (context, child) => widget.builder(context, tween.evaluate(animation), child),
    );
  }
}
