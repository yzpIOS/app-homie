import 'package:app/widgets.dart';

export 'package:extended_text/extended_text.dart';

class XText extends ExtendedText {
  const XText(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap = false,
    super.overflow = TextOverflow.ellipsis,
    super.maxLines = 1,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
    super.specialTextSpanBuilder,
  });
}

class XRichText extends Text {
  const XRichText(
    super.textSpan, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap = false,
    super.overflow = TextOverflow.ellipsis,
    super.textScaleFactor,
    super.maxLines = 1,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super.rich();
}
