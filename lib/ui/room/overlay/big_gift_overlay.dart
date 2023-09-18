import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
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

  late final _ctrl = StreamController<Widget>.broadcast();
  late final _queue = StreamQueue(_ctrl.stream);

  @override
  void initState() {
    super.initState();

    final findByUidX = Get.find<UserInfoCtrl>().findByUidX;

    on<GiftEvent>((data) async {
      final giftModel = data.data;
      if(giftModel == null) {
        return;
      }
      final sendUid = data.uid;
      final sendNUid = data.nuid;
      if(sendUid == null || sendNUid == null) {
        return;
      }
      final ids = data.data?.acceptUidList ?? [];

      final users = await findByUidX({sendUid, ...ids}, useNet: true);

      for(int index = 0; index < ids.length; index ++) {
        _ctrl.add(
          _BigGiftView(uid: sendUid, nuid: sendNUid, acceptUid: ids[index], users: users, data: giftModel),
        );
      }
    });

    on<MoreGiftPlayEvent>((data) async {
      S_MoreGiftPlay? moreGift = data.data;
      if(moreGift == null) {
        return;
      }
      final List<S_GiftPlay>? items = data.items;
      if(items == null) {
        return;
      }
      for(S_GiftPlay gift in items) {
        final sendUid = gift.sendId;
        final sendNUid = gift.roleId;
        final ids = gift.acceptUidList ?? [];
        final users = await findByUidX({sendUid, ...ids}, useNet: true);
        _ctrl.add(
          _BigGiftView(uid: sendUid, nuid: sendNUid, acceptUid: '', users: users, data: gift, blindBoxName: moreGift.blindBoxName,),
        );
      }
    });
  }

  @override
  void dispose() {
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
              Row(
                children: [
                  _X(size: c.biggest, padding: padding, queue: _queue),
                  const Spacing(width: 5, flex: null,),
                  _X(size: c.biggest, padding: padding, queue: _queue),
                ],
              ),
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
        (child) => _AnimateView(onComplete: _doLoop, size: widget.size, padding: widget.padding, child: child),
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

class _BigGiftView extends StatelessWidget {
  final UID uid;
  final NUID nuid;

  final UID acceptUid;
  final Map<UID, UserInfoDto> users;
  final S_GiftPlay data;
  final String? blindBoxName;//盲盒名称

  _BigGiftView({required this.uid, required this.nuid, required this.acceptUid, required this.users, required this.data, this.blindBoxName})
      : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    final user = users[uid];

    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        XText(
          user?.showName() ?? '--',
          overflow: TextOverflow.fade,
          style: const TextStyle(fontSize: 12),
        ),
        XRichText(
          TextSpan(
            text: '送',
            children: [
              TextSpan(
                text: blindBoxName ?? users[acceptUid]?.showName() ?? '--',
                style: const TextStyle(color: AppPalette.colorY),
              ),
              if (blindBoxName != null) const TextSpan(text: '开出'),
            ],
          ),
          overflow: TextOverflow.fade,
          style: const TextStyle(fontSize: 8),
        ),
      ],
    );

    child = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OpacityButton(
          onTap: () => RoomUserInfoDialog.show(uid: uid, nuid: nuid),
          child: AvatarView(user?.avatar, blur: user?.avatarEx, size: 30),
        ),
        Expanded(
          child: Padding(
            padding: const Pad(horizontal: 5),
            child: child,
          ),
        ),
        GiftImgState(
          child: NetImage(data.cover, width: 36, height: 36),
        ),
        Row(
          textBaseline: TextBaseline.ideographic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            const Text('x', style: TextStyle(fontSize: 8, fontWeight: fw$Medium)),
            Text('${data.count}', style: const TextStyle(fontWeight: fw$Medium)) //
                .animate()
                .scaleXY(
                  delay: const Duration(milliseconds: 1000 - 618),
                  duration: const Duration(milliseconds: 618),
                  begin: 0,
                  curve: Curves.easeOutBack,
                ),
          ],
        ),
      ],
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 14, color: Colors.white, height: 1),
      child: child,
    );

    child = Padding(
      padding: const Pad(left: 4, right: 8),
      child: child,
    );

    child = DecoratedBox(
      decoration: const ShapeDecoration(shape: XStadiumBorder(), color: AppPalette.room),
      child: child,
    );

    child = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 160, minHeight: 36, maxHeight: 36),
      child: child,
    );

    return child;
  }
}