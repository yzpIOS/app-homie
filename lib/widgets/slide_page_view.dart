import 'package:flutter/material.dart';

class SlidePageView extends StatefulWidget {
  final List<Widget> pages;
  final ValueNotifier<int> selector;

  const SlidePageView({super.key, required this.pages, required this.selector});

  @override
  State<SlidePageView> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePageView> with SingleTickerProviderStateMixin {
  late final _pages = widget.pages.asMap();

  late final _pageCtrl = widget.selector;
  late int _inIndex = _outIndex, _outIndex = _pageCtrl.value;

  final _tweenList = [
    Tween(begin: const Offset(1, 0), end: Offset.zero),
    Tween(begin: Offset.zero, end: const Offset(-1, 0)),
    Tween(begin: const Offset(-1, 0), end: Offset.zero),
    Tween(begin: Offset.zero, end: const Offset(1, 0)),
  ];

  late final AnimationController _animCtrl;

  late Tween<Offset> _inTween;
  late Tween<Offset> _outTween;

  @override
  void initState() {
    super.initState();

    _animCtrl = AnimationController(vsync: this, duration: kTabScrollDuration);

    _pageCtrl.addListener(_changePage);
  }

  @override
  void dispose() {
    _pageCtrl.removeListener(_changePage);
    _animCtrl.dispose();

    super.dispose();
  }

  void _changePage() {
    setState(() {
      _outIndex = _inIndex;
      _inIndex = widget.selector.value;

      if (_inIndex > _outIndex) {
        _inTween = _tweenList[0];
        _outTween = _tweenList[1];
      } else {
        _inTween = _tweenList[2];
        _outTween = _tweenList[3];
      }

      _animCtrl.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children;

    if (_outIndex == _inIndex) {
      children = [
        _AnimView(_inIndex, _pages[_inIndex], true, true),
      ];
    } else {
      final _outAnim = _outTween.animate(
        CurvedAnimation(parent: _animCtrl, curve: Curves.easeOutCubic),
      );
      final _inAnim = _inTween.animate(
        CurvedAnimation(parent: _animCtrl, curve: Curves.easeOutCubic),
      );

      children = [
        _AnimView(_outIndex, _pages[_outIndex], true, false, _outAnim),
        _AnimView(_inIndex, _pages[_inIndex], true, true, _inAnim),
      ];
    }

    final offstage = //
        _pages.entries
            .where((it) => it.key != _inIndex && it.key != _outIndex)
            .map((it) => _AnimView(it.key, it.value, false, false));

    children.addAll(offstage);

    return Stack(children: children);
  }
}

class _AnimView extends StatefulWidget {
  final Widget? child;
  final bool show, enabled;
  final Animation<Offset>? anim;

  _AnimView(int index, this.child, this.show, this.enabled, [this.anim]) : super(key: ValueKey<int>(index));

  @override
  _AnimViewState createState() => _AnimViewState();
}

class _AnimViewState extends State<_AnimView> {
  @override
  Widget build(BuildContext context) {
    late final _anim = widget.anim ?? const AlwaysStoppedAnimation(Offset.zero);

    Widget child = Offstage(
      offstage: !widget.show,
      child: TickerMode(
        enabled: widget.enabled,
        child: SlideTransition(position: _anim, child: widget.child),
      ),
    );

    return child;
  }
}
