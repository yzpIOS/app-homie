import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class XCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  final double size;

  const XCheckbox({super.key, required this.value, this.onChanged, this.size = 48});

  @override
  State<XCheckbox> createState() => _XCheckboxState();
}

class _XCheckboxState extends State<XCheckbox> {
  late bool b = widget.value;

  @override
  void didUpdateWidget(XCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    b = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;

    return InkResponse(
      onTap: _onTap,
      child: Box(
        width: size,
        height: size,
        alignment: Alignment.center,
        child: Checkbox(value: b, onChanged: (_) {}),
      ),
    );
  }

  void _onTap() {
    b = !b;

    widget.onChanged?.call(b);

    setState(() {});
  }
}

class XRadio extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  final double size;

  const XRadio({super.key, required this.value, this.onChanged, this.size = 18});

  @override
  State<XRadio> createState() => _XRadioState();
}

class _XRadioState extends State<XRadio> {
  late bool b = widget.value;

  @override
  void didUpdateWidget(XRadio oldWidget) {
    super.didUpdateWidget(oldWidget);

    b = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;

    return InkResponse(
      onTap: _onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: SizedBox(
            width: 20,
            height: 20,
            child: IgnorePointer(
              child: Checkbox(
                value: b,
                onChanged: (_) {},
                activeColor: AppPalette.primary,
                shape: const CircleBorder(),
                side: const BorderSide(color: AppPalette.c9),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    b = !b;

    widget.onChanged?.call(b);

    setState(() {});
  }
}
