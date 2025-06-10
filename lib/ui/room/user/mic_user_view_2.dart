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

/// 麦位用户视图的抽象基类
/// 用于管理麦位相关的通用功能
abstract class _MicUserView extends StatelessWidget {
  /// 当前用户的角色类型
  final RoomRoleType? myRole;

  _MicUserView({super.key, this.myRole});

  /// 获取场景麦位控制器
  late final controller = sceneMicCtrl<RoomMicCtrl>();
}

/// 麦位头部视图组件
/// 用于显示房间顶部的麦位布局
class MicUser$Header extends _MicUserView {
  MicUser$Header({super.key, super.myRole});

  /// 麦位项的高度
  static double itemH = _MicView.itemH;

  @override
  Widget build(BuildContext context) {
    var maxMic = controller.maxMic;

    // 构建单个麦位视图
    Widget child = SizedBox(
      height: _MicView.itemH,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (maxMic > 0)
            Positioned(
              width: _MicView.itemW,
              height: _MicView.itemH,
              child: Obx(() {
                MicInfo ?info =controller.micUserInfo(micNumber: '1');
                double? dynamicPresentation = controller.getMicHeight(info: info);
                return _ItemView(no: '1',
                    micUserInfo: info,
                  myRole: myRole,
                  dynamicPresentation: dynamicPresentation,
                );
              }),
            ),
        ],
      ),
    );

    // 如果有多个麦位，构建网格布局
    if (maxMic > 1) {
      // 计算麦位之间的间距
      double gap = (Get.width - _MicView.itemW * 4 - 33 * 2) / 3;
      // 设置列数
      var numOfColumn = 4;
      var column = 0;
      if (maxMic > 1) {
        if ((maxMic - 1) % numOfColumn == 0) {
          column = (maxMic - 1) ~/ numOfColumn;
        } else {
          column = (maxMic - 1) ~/ numOfColumn + 1;
        }
      }
      double spacing = 10;
      child = SizedBox(
        height: (1 + column) * _MicView.itemH + (column - 1) * spacing,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 第一行显示主持麦位
            child,
            // 第二行显示其他麦位
            GridView.builder(
              shrinkWrap: true,
              padding: Pad(horizontal: gap),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: numOfColumn,
                mainAxisExtent: _MicView.itemH,
                mainAxisSpacing: spacing,
                crossAxisSpacing: gap,
              ),
              itemCount: controller.maxMic - 1,
              itemBuilder: (BuildContext context, int i) {
                return Obx(() {
                  final no = '${i + 2}';
                  // 主持位
                  var micMo = i + 2;
                  if (micMo == maxMic) {
                    final String micNumberString = '$maxMic';
                    MicInfo? info = controller.micUserInfo(
                        micNumber: micNumberString);
                   double? dynamicPresentation = controller.getMicHeight(info: info);
                    return Container(
                      margin: const Pad(top: 0),
                      width: _MicView.itemW,
                      height: _MicView.itemH,
                      child: Transform.translate(
                        offset: const Offset(0, 0),
                        child: _ItemView(no: micNumberString,
                            micUserInfo: info,
                            myRole: myRole,
                            type: 1,
                          dynamicPresentation: dynamicPresentation
                        ),
                      ),
                    );
                  } else {
                    MicInfo? info = controller.micUserInfo(
                        micNumber: no);
                    double? dynamicPresentation = controller.getMicHeight(info: info);
                    return Container(
                      margin: Pad(top: micMo > 5 ? 0 : 0),
                      width: _MicView.itemW,
                      height: _MicView.itemH,
                      child: _ItemView(
                          no: no,
                          micUserInfo: info,
                          myRole: myRole,
                         dynamicPresentation: dynamicPresentation,
                      )
                    );
                  }
                });
              },
            )
          ],
        ),
      );
    }

    return child;
  }
}

/// 右侧麦位列表视图组件
/// 用于显示房间右侧的麦位列表
class MicUser$Right extends _MicUserView {
  MicUser$Right({super.key, super.myRole});

  /// 麦位项的高度
  static double itemH = _MicView.itemH;
  /// 麦位之间的间距
  static const spacing = 4.0;
  /// 整体内边距
  static const padding = Pad(vertical: 6);

  @override
  Widget build(BuildContext context) {
    final isLandscape = context.watch<Orientation>() == Orientation.landscape;

    // 根据屏幕方向设置网格布局
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
        final String no = '${i + 1}';
        MicInfo? info = controller.micUserInfo(micNumber: no);
        double? dynamicPresentation = controller.getMicHeight(info: info);
        return _ItemView(
            no: no,
            micUserInfo: info,
            myRole: myRole,
          dynamicPresentation: dynamicPresentation,
        );
      },
    );
  }
}

/// 单个麦位项视图组件
/// 用于显示单个麦位的详细信息
class _ItemView extends StatelessWidget {
  /// 麦位类型（0: 普通麦位, 1: 特殊麦位）
  final int type;
  /// 麦位编号
  final String no;
  /// 当前用户角色
  final RoomRoleType? myRole;
  /// 麦位用户信息
  final MicInfo? micUserInfo;
  /// 动态展示效果值
  final double? dynamicPresentation;

  _ItemView(
      {required this.no, required this.micUserInfo, required this.myRole, this.type = 0,required this.dynamicPresentation})
      : super(key: ValueKey(no));

  @override
  Widget build(BuildContext context) {
    return micUserInfo == null ? $EmptyView(no) : $UserView(no, micUserInfo!);
  }

  /// 构建空麦位视图
  Widget $EmptyView(String no) {
    TextStyle style;
    String text = '$no号麦';
    if (no == "1") {
      text = '主持';
    } else {
      text = '${(int.tryParse(no) ?? 1) - 1}号麦';
    }
    if (type == 0) {
      style = const TextStyle(
          fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white);
    } else {
      text = "BOSS";
      style = const TextStyle(
          fontWeight: FontWeight.w900, color: Color(0xFFFBAF49), fontSize: 14);
    }
    return _MicView(
      avatar: InkResponse(
        onTap: () => MicUserSheet.show(no),
        child: Image.asset(
            IMG.format('room/mic/麦位_$type'), scale: 3, fit: BoxFit.contain),
      ),
      title: XText(text, style: style),
    );
  }

  /// 构建用户麦位视图
  Widget $UserView(String no, MicInfo item) {
    final uid = item.uid;
    final isSelf = OAuthCtrl.isSelf(uid);

    /// 构建头像组件
    Widget $Avatar() {
      final child = AsyncAvatar(
        uid: uid,
        size: _MicView.itemW,
        onTap: Some(() => MicUserSheet.show(no, info: item)),
      );

      final val = Rtc.speakRx[uid];
      return dynamicPresentation == null
          ? child
          : MicAnimeBuilder(
        value: dynamicPresentation!,
        child: child,
        builder: (context, value, child) =>
            DecoratedBox(decoration: value, child: child),
      );
    }

    /// 构建麦克风状态组件
    Widget $Mic() {
      if(item.status == 3){
        return Spacing.blank;
      }else if(item.status == 4 || item.status == 1){
        return $MicStateView('闭麦');
      }else if(item.status == 5 || item.status == 6){
        return $MicStateView('禁麦');
      }else{
        return Spacing.blank;
      }
    }

    /// 构建热度视图组件
    Widget $HotView() {
      GlobalKey globalKey = GlobalKey();
      return GestureDetector(
        onTap: () {
          int? roomId = RoomManagerCtrl.ins.sceneCtrl2?.roomId;
          if (item.hotCount <= 0 || roomId == null) {
            return;
          }
          var size = globalKey.currentContext
              ?.findRenderObject()
              ?.paintBounds
              .size;
          RenderBox? renderBox = globalKey.currentContext
              ?.findRenderObject() as RenderBox?;
          var offset = renderBox?.localToGlobal(Offset.zero);
          
          var centerBottom = Offset((offset?.dx ?? 0),
              (offset?.dy ?? 0) + (size?.height ?? 0.0));

          HotInfoDialog.userApplyDownMic(
              roomId, item.nUid.toInt(), anchorPoint: centerBottom);
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
              style: TextStyle(fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.white),);
          },
          ),
        ));
  }

  /// 构建麦克风状态视图
  Widget $MicStateView(String state) {
    return Image.asset(
      IMG.format('room/mic/麦位_$state'),
      scale: 3,
      errorBuilder: (_, __, ___) => Spacing.blank,
    );
  }
}

/// 麦位基础视图组件
/// 用于构建麦位的基本布局结构
class _MicView extends StatelessWidget {
  /// 头像组件
  final Widget avatar;
  /// 标题组件
  final Widget title;
  /// 麦克风状态组件
  final Widget? mic;
  /// 提示信息组件
  final Widget? tips;
  /// 标签
  final String? tag;

  const _MicView(
      {required this.avatar, required this.title, this.tips, this.mic, this.tag});

  /// 每行显示的麦位数量
  static const double _count = 6;
  /// 麦位实际大小
  static final double _size = itemW - padding.horizontal;

  /// 内边距
  static const padding = Pad(top: 6, horizontal: 8);

  /// 麦位宽度
  static double itemW = (AppSize.width - padding.horizontal) / _count;
  /// 麦位高度
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
                child: Image.asset(
                  IMG.format("room/presided"), width: 40, height: 14,)
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

/// 麦克风动画构建器组件
/// 用于处理麦位动画效果
class MicAnimeBuilder extends StatefulWidget {
  /// 动画值
  final double value;
  /// 子组件
  final Widget? child;
  /// 构建器函数  typedef ValueWidgetBuilder<T> = Widget Function(BuildContext context, T value, Widget? child);
   final ValueWidgetBuilder<Decoration> builder;
  const MicAnimeBuilder(
      {required this.value, required this.builder, this.child});

  @override
  State<MicAnimeBuilder> createState() => _MicAnimeBuilderState();
}

/// 麦克风动画构建器状态类
class _MicAnimeBuilderState extends State<MicAnimeBuilder>
    with SingleTickerProviderStateMixin {
  /// 动画控制器
  late final animation = AnimationController(vsync: this);

  /// 装饰动画补间
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

  /// 当父组件更新导致widget属性变化时调用
  /// 用于响应value值的变化，重新执行动画
  @override
  void didUpdateWidget(MicAnimeBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 如果value值发生变化，重新执行动画
    if (oldWidget.value != widget.value) {
      _doPlay();
    }
  }

  /// 执行动画播放
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
      builder: (context, child) =>
          widget.builder(context, tween.evaluate(animation), child),
    );
  }
}
