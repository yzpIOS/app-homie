import 'package:app/event/event.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/wealthy_level_view.dart';
import 'package:app/ui/room/user/room_user_info_dialog.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/nine_image.dart';
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
        final NUID? myNUid = data.nuid;
        if(myUid == null || myNUid == null) {
          return;
        }
        _ctrl.add(_WelcomeView(uid: myUid, myNUid: myNUid,));
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
      height: 50,
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
  final NUID myNUid;
  _WelcomeView({required this.uid, required this.myNUid}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    Widget builder(UserInfoDto? data) {
      final _level = data?.level;
      bool isSpecial = false;
      String bgImageName = '';
      double _boxWidth = 134;
      double _boxHeight = 20;

      if (_level == '0' || _level == null || _level.isEmpty) {
        bgImageName = 'room/welcome_bg_1~9';
      } else if (int.parse(_level) < 10) {
        bgImageName = 'room/welcome_bg_1~9';
      } else if (int.parse(_level) < 20) {
        bgImageName = 'room/welcome_bg_10~19';
      } else if (int.parse(_level) < 30) {
        bgImageName = 'room/welcome_bg_20~29';
      } else if (int.parse(_level) < 40) {
        bgImageName = 'room/welcome_bg_30~39';
      } else if (int.parse(_level) < 50) {
        bgImageName = 'room/welcome_bg_40~49';
      } else if (int.parse(_level) < 60) {
        bgImageName = 'room/welcome_bg_50~59';
      } else {
        bgImageName = 'room/welcome_bg_60+';
        _boxWidth = 175.6;
        _boxHeight = 49.6;
        isSpecial = true;
      }

      Widget child = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: isSpecial ? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment: isSpecial ? CrossAxisAlignment.end : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: Pad(bottom: isSpecial ? 0.5 : 0),
            child: WealthyLevelView(level: data?.level, height: 11),
          ),
          Flexible(
            child: Padding(
              padding: const Pad(horizontal: 3,),
              child: XText(
                  data?.showName() ?? '--',
                  overflow: TextOverflow.fade,
              ),
            ),
          ),
          const XText('来了'),
        ],
      );


      if(data?.approach_special_effect?.isNotEmpty == true) {
        _boxHeight = 69.6;
        _boxWidth = 180;

        child = DefaultTextStyle(
          style: const TextStyle(fontSize: 9, color: Colors.white,),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          child: child,
        );


        child = Container(
          width: 191,
          height: _boxHeight,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data?.approach_special_effect ?? "", scale: 1),
            )
          ),
          padding: EdgeInsets.only(left: 56, top: 2),
          child: child,
        );
      } else {
        child = Padding(
          padding: Pad(left: 7, right: 6, bottom: isSpecial ? 6 : 0),
          child: child,
        );

        child = DefaultTextStyle(
          style: const TextStyle(fontSize: 9, color: Colors.white,),
          child: child,
        );

        child = DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(IMG.format(bgImageName)), centerSlice: const Rect.fromLTRB(30, 5, 40, 10), scale: 3, fit: BoxFit.fill,),
          ),
          child: child,
        );

        // child = ConstrainedBox(
        //   constraints: const BoxConstraints(maxWidth: 160, minHeight: 20, maxHeight: 20),
        //   child: child,
        // );
      }

      child = ConstrainedBox(
        constraints: BoxConstraints(minWidth: _boxWidth, maxWidth: 180, minHeight: _boxHeight, maxHeight: _boxHeight),
        child: child,
      );

      child = OpacityButton(
        onTap: () => RoomUserInfoDialog.show(uid: uid, nuid: myNUid),
        child: child,
      );

      return child;
    }
    return UserInfoCtrl.use(uid, forceUseNet: true, builder: builder);

    // Widget child = UserInfoCtrl.use(
    //   uid,
    //   builder: (it) {
    //     return Row(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         WealthyLevelView(level: it?.level, height: 10),
    //         Flexible(
    //           child: Padding(
    //             padding: const Pad(horizontal: 3),
    //             child: XText(it?.showName() ?? '--', overflow: TextOverflow.fade),
    //           ),
    //         ),
    //         const Text('来了'),
    //       ],
    //     );
    //   },
    // );
    //
    // child = DefaultTextStyle(
    //   style: const TextStyle(fontSize: 12, color: Colors.white, height: 1),
    //   child: child,
    // );
    //
    // child = Padding(
    //   padding: const Pad(left: 4, right: 8),
    //   child: child,
    // );
    //
    // child = DecoratedBox(
    //   decoration: const ShapeDecoration(
    //     shape: XStadiumBorder(
    //       side: BorderSide(color: Color(0xFFCBCCFF), strokeAlign: BorderSide.strokeAlignOutside),
    //     ),
    //     color: Color(0xFF7D7FD3),
    //   ),
    //   child: child,
    // );
    //
    // child = ConstrainedBox(
    //   constraints: const BoxConstraints(maxWidth: 160, minHeight: 20, maxHeight: 20),
    //   child: child,
    // );
    //
    // child = OpacityButton(
    //   onTap: () => RoomUserInfoDialog.show(uid: uid, nuid: myNUid),
    //   child: child,
    // );
    //
    // return child;
  }
}
