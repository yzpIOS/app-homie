import 'package:app/event/event.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/level_view.dart';
import 'package:app/ui/room/user/room_user_info_dialog.dart';
import 'package:app/widgets.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomeOverlay extends StatefulWidget {
  final double padding;

  const WelcomeOverlay({super.key, required this.padding});

  @override
  State<WelcomeOverlay> createState() => _WelcomeOverlayState();
}

class _WelcomeOverlayState extends State<WelcomeOverlay> with BusStateMixin {
  late final padding = widget.padding;

  late final _ctrl = StreamController<Widget>.broadcast();
  late final _queue = StreamQueue(_ctrl.stream);

  Widget? view;

  @override
  void initState() {
    super.initState();

    on<UserInEvent>(
      (data) {
        final UID? myUid = data.uid;
        if(myUid == null) {
          return;
        }
        _ctrl.add(_WelcomeView(uid: myUid));
      },
    );

    _doLoop().ignore();
  }

  @override
  void dispose() {
    [_queue.cancel, _ctrl.close].tryRun();

    view = null;

    super.dispose();
  }

  Future<void> _doLoop() async {
    if (view != null && mounted) setState(() => view = null);

    await _queue.hasNext;

    if (mounted) {
      final _view = await _queue.next;

      if (mounted) {
        setState(() => view = _view);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: view?.let(
        (child) => LayoutBuilder(
          builder: (_, c) => _AnimateView(onComplete: _doLoop, size: c.biggest, padding: padding, child: child),
        ),
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
    final begin = size.width;
    final dock = padding * 0.618;

    final effects = <Effect>[
      const Effect(duration: Duration(milliseconds: 618), curve: Curves.easeOutQuart),
      MoveEffect(
        begin: Offset(begin, 0),
        end: Offset(padding, 0),
      ),
      const ThenEffect(duration: Duration(seconds: 3), curve: Curves.linear),
      MoveEffect(
        begin: Offset.zero,
        end: Offset(-dock, 0),
      ),
      const ThenEffect(duration: Duration(milliseconds: 1000 - 618), curve: Curves.linearToEaseOut),
      const SlideEffect(
        begin: Offset.zero,
        end: Offset(-1, 0),
      ),
      MoveEffect(
        begin: Offset.zero,
        end: Offset(-(padding - dock), 0),
      ),
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

class _WelcomeView extends StatelessWidget {
  final UID uid;
  _WelcomeView({required this.uid}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    Widget child = UserInfoCtrl.use(
      uid,
      builder: (it) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LevelView(level: it?.level, height: 10),
            Flexible(
              child: Padding(
                padding: const Pad(horizontal: 3),
                child: XText(it?.showName() ?? '--', overflow: TextOverflow.fade),
              ),
            ),
            const Text('来了'),
          ],
        );
      },
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: Colors.white, height: 1),
      child: child,
    );

    child = Padding(
      padding: const Pad(left: 4, right: 8),
      child: child,
    );

    child = DecoratedBox(
      decoration: const ShapeDecoration(
        shape: XStadiumBorder(
          side: BorderSide(color: Color(0xFFCBCCFF), strokeAlign: BorderSide.strokeAlignOutside),
        ),
        color: Color(0xFF7D7FD3),
      ),
      child: child,
    );

    child = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 160, minHeight: 20, maxHeight: 20),
      child: child,
    );

    child = OpacityButton(
      onTap: () => RoomUserInfoDialog.show(uid: uid),
      child: child,
    );

    return child;
  }
}
