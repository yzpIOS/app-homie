import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XInputPage extends StatefulWidget {

  final InputCfg cfg;

  const XInputPage._(this.cfg);

  static Future<String?> go(InputCfg cfg) {
    return Get.to(() => XInputPage._(cfg), preventDuplicates: false)!;
  }

  @override
  State<XInputPage> createState() => _XInputPageState();
}

class _XInputPageState extends State<XInputPage> {
  late final cfg = widget.cfg;
  late final ctrl = TextEditingController(text: cfg.initial);

  @override
  dispose() {
    ctrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      labelText: cfg.title,
      helperText: cfg.tips,
      suffixIcon: $SuffixIcon(),
    );

    return Scaffold(
      appBar: xAppBar(actions: _actions()),
      body: Padding(
        padding: const Pad(horizontal: 16),
        child: TextField(
          controller: ctrl,
          autofocus: true,
          onSubmitted: onSub,
          decoration: decoration,
          maxLines: cfg.maxLines,
          maxLength: cfg.maxLength,
          keyboardType: cfg.inputType,
          inputFormatters: cfg.formatter,
        ),
      ),
    );
  }

  Widget $SuffixIcon() {
    return $InputBuilder((isBlank) {
      return isBlank
          ? Spacing.blank
          : IconButton(
              onPressed: ctrl.clear,
              icon: const Icon(Icons.clear_rounded),
            );
    });
  }

  Widget _actions() {
    return $InputBuilder((isBlank) {
      final onTap = !cfg.emptyCallBack && isBlank ? null : onSub;

      return '确定'.toStadiumAction(onPressed: onTap);
    });
  }

  Widget $InputBuilder(Widget Function(bool isBlank) builder) {
    return NotifierView<TextEditingValue>(
      ctrl,
      onData: (it) => builder(it.text.trim().isEmpty),
    );
  }

  onSub([_]) async {
    cfg.flag = true;
    final txt = ctrl.text.trim();

    final errMsg = cfg.validator?.call(txt);

    if (errMsg != null) {
      showToast(errMsg);
    } else {
      Get.back(result: txt);
    }
  }
}

class InputCfg {
  final String title;
  final String? tips;
  final int? maxLines;
  final int? maxLength;
  final String? initial;
  final TextInputType? inputType;
  final List<TextInputFormatter>? formatter;
  final String? Function(String)? validator;
  final emptyCallBack;

  // 用于标记是否是点了确认按钮
  bool? flag = false;

  InputCfg({
    required this.title,
    this.tips,
    this.initial,
    this.validator,
    this.formatter,
    this.maxLines = 1,
    this.maxLength = 16,
    this.inputType = TextInputType.text,
    this.emptyCallBack = false,
  });
}
