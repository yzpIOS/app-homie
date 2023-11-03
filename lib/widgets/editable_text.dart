import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class XInputView extends StatelessWidget {
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final bool autofocus;
  final String? hintText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final Color bgColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;

  const XInputView({
    super.key,
    this.textInputAction = TextInputAction.send,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.focusNode,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.onTap,
    this.height = 40,
    this.fontSize = 14,
    this.fontWeight = fw$Regular,
    this.autofocus = false,
    this.bgColor = const Color(0xFFF5F5F5),
    this.inputFormatters,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
      gapPadding: 0,
      borderSide: BorderSide.none,
      borderRadius: AppBorderRadius.max,
    );

    return ExtendedTextField(
      textAlign: textAlign,
      specialTextSpanBuilder: context.watch<SpecialTextSpanBuilder?>(),
      controller: controller,
      autofocus: autofocus,
      focusNode: focusNode,
      style: TextStyle(fontSize: fontSize, color: Colors.black, fontWeight: fontWeight),
      decoration: InputDecoration(
        constraints: BoxConstraints.tightFor(height: height),
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(minWidth: height),
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(minWidth: height),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: fontSize, color: AppPalette.c9, fontWeight: fw$Regular),
        filled: true,
        fillColor: bgColor,
        contentPadding: const Pad(horizontal: 12),
        border: inputBorder,
      ),
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
    );
  }
}

class FormInputView extends StatelessWidget {
  final String? hint;
  final bool isPwd;
  final bool enabled;
  final bool autofocus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final BorderRadius? borderRadius;

  FormInputView({
    super.key,
    this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.inputFormatters,
    this.isPwd = false,
    this.enabled = true,
    this.autofocus = false,
    this.maxLength,
    this.borderRadius,
    this.onSubmitted,
    TextInputType? keyboardType,
  }) : keyboardType = keyboardType ?? (isPwd ? TextInputType.visiblePassword : TextInputType.text);

  late final obscureRx = RxBool(isPwd);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 14, color: Colors.black);
    final decor = _decor.copyWith(
      constraints: const BoxConstraints.tightFor(height: AppSize.editLarge),
    );

    return Obx(() {
      return TextField(
        style: style,
        decoration: decor,
        autofocus: autofocus,
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureRx(),
        onChanged: onChanged,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        onSubmitted: onSubmitted,
      );
    });
  }

  InputDecoration get _decor {
    return InputDecoration(
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(),
      suffixIcon: $SuffixView(),
      suffixIconConstraints: const BoxConstraints(minWidth: AppSize.editLarge, maxWidth: 90),
      hintText: '请输入${hint ?? ''}',
      hintStyle: const TextStyle(fontSize: 12),
      contentPadding: const Pad(horizontal: 16),
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      counterText: "",
      border: OutlineInputBorder(
        gapPadding: 0,
        borderSide: BorderSide.none,
        borderRadius: borderRadius ?? AppBorderRadius.max,
      ),
    );
  }

  Widget? $SuffixView() {
    final child = suffixIcon;

    if (child != null) {
      return child;
    } else if (isPwd) {
      return $PwdSwitchView();
    } else {
      return null;
    }
  }

  InkResponse $PwdSwitchView() {
    final child = Obx(
      () => SvgView(SVG.$('login/密码_${obscureRx() ? 0 : 1}')),
    );

    return InkResponse(
      onTap: obscureRx.toggle,
      child: Box(
        width: 32,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
