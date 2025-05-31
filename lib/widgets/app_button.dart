import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

const Duration _fadeOutDuration = Duration(milliseconds: 10);
const Duration _fadeInDuration = Duration(milliseconds: 100);

class OpacityButton extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const OpacityButton({required this.child, this.onTap, this.onLongPress, super.key});

  @override
  State<OpacityButton> createState() => _OpacityButtonState();
}

class _OpacityButtonState extends State<OpacityButton> with SingleTickerProviderStateMixin {
  final _tween = Tween<double>(begin: 1.0, end: 0.618);

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );

    _animation = _controller //
        .drive(CurveTween(curve: Curves.easeOutCubic))
        .drive(_tween);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_controller.isAnimating) return;
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _controller.animateTo(1.0, duration: _fadeOutDuration)
        : _controller.animateTo(0.0, duration: _fadeInDuration);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final onTap = widget.onTap;
    final onLongPress = widget.onLongPress;

    Widget child = FadeTransition(opacity: _animation, child: widget.child);

    if (onTap != null || onLongPress != null) {
      child = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: onTap,
        onLongPress: onLongPress,
        child: child,
      );
    }

    return child;
  }
}

class DecorButton extends StatefulWidget {
  final Widget child;
  final Decoration begin;
  final Decoration end;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const DecorButton({
    required this.child,
    this.onTap,
    this.onLongPress,
    this.end = const BoxDecoration(color: Color(0xFFEEEEEE)),
    this.begin = const BoxDecoration(),
    super.key,
  });

  @override
  State<DecorButton> createState() => _DecorButtonState();
}

class _DecorButtonState extends State<DecorButton> with SingleTickerProviderStateMixin {
  late final _tween = DecorationTween(begin: widget.begin, end: widget.end);

  late AnimationController _controller;
  late Animation<Decoration> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );

    _animation = _tween.animate(
      _controller.drive(CurveTween(curve: Curves.easeOutCubic)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_controller.isAnimating) return;
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _controller.animateTo(1.0, duration: _fadeOutDuration)
        : _controller.animateTo(0.0, duration: _fadeInDuration);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = widget.child;

    final onTap = widget.onTap;
    final onLongPress = widget.onLongPress;

    if (onTap != null || onLongPress != null) {
      child = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: onTap,
        onLongPress: onLongPress,
        child: DecoratedBoxTransition(decoration: _animation, child: child),
      );
    }

    return child;
  }
}

class ShapeButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? width, height;
  final ShapeBorder? shape;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const ShapeButton({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.onTap,
    this.shape,
    this.color = AppPalette.primary,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.white),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.button,
      color: color,
      elevation: 0,
      textStyle: textStyle,
      clipBehavior: Clip.hardEdge,
      shape: shape,
      child: InkWell(
        onTap: onTap,
        child: Box(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

class XTextBtn extends ShapeButton {
  XTextBtn({
    required String label,
    super.key,
    super.onTap,
    super.color,
    super.width,
    super.height = AppSize.btnLarge,
    super.shape = const XStadiumBorder(),
    EdgeInsetsGeometry padding = Pad.zero,
    TextStyle? textStyle,
  }) : super(child: Padding(padding: padding, child: XText(label, style: textStyle)));
}

class XOutlinedBtn extends ShapeButton {
  XOutlinedBtn({
    required String label,
    super.key,
    super.onTap,
    super.width,
    super.height = AppSize.btnLarge,
    super.color = Colors.transparent,
    BorderSide side = const BorderSide(color: AppPalette.primary),
    TextStyle? textStyle,
  }) : super(
          child: XText(label, style: textStyle),
          shape: XStadiumBorder(side: side),
        );
}
