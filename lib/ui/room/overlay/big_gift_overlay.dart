import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/api/user_info_model.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:app/ui/room/user/room_user_info_dialog.dart';

class BigGiftOverlay extends StatefulWidget {
  final double padding;

  const BigGiftOverlay({super.key, required this.padding});

  @override
  State<BigGiftOverlay> createState() => _BigGiftOverlayState();
}

class _BigGiftOverlayState extends State<BigGiftOverlay> with BusStateMixin {
  late final padding = widget.padding;

  // 创建一个广播流控制器，用于管理礼物动画组件的流
  // broadcast() 表示这个流可以被多个监听者订阅
  late final _ctrl = StreamController<Widget>.broadcast();
  
  // 创建一个流队列，用于按顺序处理礼物动画
  // StreamQueue 会按照先进先出(FIFO)的顺序处理流中的元素
  late final _queue = StreamQueue(_ctrl.stream);

  @override
  void initState() {
    super.initState();

    // 获取用户信息控制器
    final findByUidX = Get.find<UserInfoCtrl>().findByUidX;

    // 监听礼物事件
    on<GiftEvent>((data) async {
      final giftModel = data.data;
      if(giftModel == null) return;
      
      final sendUid = data.uid;
      final sendNUid = data.nuid;
      if(sendUid == null || sendNUid == null) return;
      
      // 获取收礼人ID列表
      final ids = data.data?.acceptUidList ?? [];
      
      // 获取所有相关用户信息
      final users = await findByUidX({sendUid, ...ids}, useNet: true);

      // 为每个收礼人创建一个礼物动画
      for(int index = 0; index < ids.length; index ++) {
        _ctrl.add(
          _BigGiftView(
            uid: sendUid, 
            nuid: sendNUid, 
            acceptUid: ids[index], 
            users: users, 
            data: giftModel
          ),
        );
      }
    });

    // 监听更多礼物事件（比如盲盒）
    on<MoreGiftPlayEvent>((data) async {
      S_MoreGiftPlay? moreGift = data.data;
      if(moreGift == null) return;
      
      final List<S_GiftPlay>? items = data.items;
      if(items == null) return;
      
      // 处理每个礼物
      for(S_GiftPlay gift in items) {
        final sendUid = gift.sendId;
        final sendNUid = gift.roleId;
        final ids = gift.acceptUidList ?? [];
        final users = await findByUidX({sendUid, ...ids}, useNet: true);
        
        _ctrl.add(
          _BigGiftView(
            uid: sendUid, 
            nuid: sendNUid, 
            acceptUid: '', 
            users: users, 
            data: gift, 
            blindBoxName: moreGift.blindBoxName,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    // 清理资源
    [_queue.cancel, _ctrl.close].tryRun();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const lines = 2;

    return SizedBox(
      height: 36 * lines + ((lines - 1) * 3),
      child: LayoutBuilder(
        builder: (_, c) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _X(size: c.biggest, padding: padding, queue: _queue),
              _X(size: c.biggest, padding: padding, queue: _queue),
            ],
          );
        },
      ),
    );
  }
}

class _X extends StatefulWidget {
  final Size size;
  final double padding;
  final StreamQueue<Widget> queue;

  const _X({required this.queue, required this.size, required this.padding});

  @override
  State<_X> createState() => _XState();
}

class _XState extends State<_X> {
  Widget? view;

  @override
  void initState() {
    super.initState();

    _doLoop().ignore();
  }

  @override
  void dispose() {
    view = null;

    super.dispose();
  }

  Future<void> _doLoop() async {
    if (view != null && mounted) setState(() => view = null);

    final _view = await widget.queue.next;

    if (mounted) {
      setState(() => view = _view);
    }

    xlog('Loop Done $view');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: view?.let(
        (child) => _AnimateView(
          onComplete: _doLoop,
         size: widget.size, 
         padding: widget.padding, 
         child: child),
      ),
    );
  }
}

class _AnimateView extends StatelessWidget {
  final Widget child;
  final Size size;
  final double padding;
  final VoidCallback onComplete;

  _AnimateView({required this.child, required this.size, required this.padding, required this.onComplete})
      : super(key: ValueKey(child));

  @override
  Widget build(BuildContext context) {
    final effects = <Effect>[
      //
      const Effect(duration: Duration(milliseconds: 618), curve: Curves.easeOutQuart),
      MoveEffect(begin: Offset.zero, end: Offset(padding, 0)),
      const SlideEffect(begin: Offset(-1, 0), end: Offset.zero),
      //
      const ThenEffect(duration: Duration(milliseconds: 618), delay: Duration(seconds: 3)),
      const ShimmerEffect(),
      const FadeEffect(end: 0),
    ];

    return Align(
      alignment: Alignment.centerLeft,
      child: Animate(
        effects: effects,
        onComplete: (_) => onComplete(),
        child: child,
      ),
    );
  }
}

/// 大礼物动画显示组件
/// 用于在直播间显示礼物赠送的动画效果
class _BigGiftView extends StatelessWidget {
  /// 送礼人ID
  final UID uid;
  /// 送礼人NUID
  final NUID nuid;
  /// 收礼人ID
  final UID acceptUid;
  /// 用户信息映射表
  final Map<UID, UserInfoModel> users;
  /// 礼物数据
  final S_GiftPlay data;
  /// 盲盒名称（可选）
  final String? blindBoxName;

  _BigGiftView({
    required this.uid, 
    required this.nuid, 
    required this.acceptUid, 
    required this.users, 
    required this.data, 
    this.blindBoxName
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    // 获取送礼人信息
    final user = users[uid];

    // 构建左侧用户信息区域
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // 显示送礼人昵称
        XText(
          user?.showName ?? '--',
          overflow: TextOverflow.fade,
          style: const TextStyle(fontSize: 12),
        ),
        // 显示送礼信息
        XRichText(
          TextSpan(
            text: '送',
            children: [
              // 显示收礼人昵称或盲盒名称
              TextSpan(
                text: blindBoxName ?? users[acceptUid]?.showName ?? '--',
                style: const TextStyle(color: AppPalette.colorY),
              ),
              // 如果是盲盒，显示"开出"文字
              if (blindBoxName != null) const TextSpan(text: '开出'),
            ],
          ),
          overflow: TextOverflow.fade,
          style: const TextStyle(fontSize: 8),
        ),
      ],
    );

    // 构建整体布局
    child = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 左侧头像区域（可点击查看用户信息）
        OpacityButton(
          onTap: () => RoomUserInfoDialog.show(uid: uid, nuid: nuid),
          child: AvatarView(user?.avatarUrl, blur: user?.avatarExtra, size: 30),
        ),
        // 中间用户信息区域
        Expanded(
          child: Padding(
            padding: const Pad(horizontal: 5),
            child: child,
          ),
        ),
        // 右侧礼物图片
        GiftImgState(
          child: NetImage(data.cover, width: 36, height: 36),
        ),
        // 礼物数量显示（带动画效果）
        Row(
          textBaseline: TextBaseline.ideographic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            const Text('x', style: TextStyle(fontSize: 8, fontWeight: fw$Medium)),
            Text('${data.count}', style: const TextStyle(fontWeight: fw$Medium))
                .animate()
                .scaleXY(
                  // 延迟显示动画
                  delay: const Duration(milliseconds: 1000 - 618),
                  // 动画持续时间
                  duration: const Duration(milliseconds: 618),
                  // 动画起始缩放比例
                  begin: 0,
                  // 使用弹性曲线让动画更生动
                  curve: Curves.easeOutBack,
                ),
          ],
        ),
      ],
    );

    // 设置默认文字样式
    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 14, color: Colors.white, height: 1),
      child: child,
    );

    // 添加内边距
    child = Padding(
      padding: const Pad(left: 4, right: 8),
      child: child,
    );

    // 添加背景装饰
    child = DecoratedBox(
      decoration: ShapeDecoration(
        shape: XStadiumBorder(), 
        color: Colors.black.withAlpha(204)  // 半透明黑色背景
      ),
      child: child,
    );

    // 限制最大宽度和高度
    child = ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 160, 
        minHeight: 36, 
        maxHeight: 36
      ),
      child: child,
    );

    return child;
  }
}