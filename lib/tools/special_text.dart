import 'package:app/tools.dart';
import 'package:app/widgets.dart';
// import 'package:extended_text/extended_text.dart';

// export 'package:extended_text/extended_text.dart' show ExtendedText, SpecialTextSpanBuilder;

final emojis = loadAssetJson('assets/emoji.json').then(
  (it) {
    final data = //
        (it as Iterable) //
            .map((it) => MapEntry<String, String>(it['glyph'], IMG.$('emoji/${it['asset']}')))
            .toList(growable: false);

    data.sort(
      (a, b) {
        final b1 = a.value.contains('_face');
        final b2 = b.value.contains('_face');

        return b1 == b2 ? 0 : (b1 ? -1 : 1);
      },
    );

    return Tuple2(data, Map.fromEntries(data));
  },
);

class DefaultSpecialTextSpanBuilder extends RegExpSpecialTextSpanBuilder {
  final Map<String, String> emj;

  DefaultSpecialTextSpanBuilder({required this.emj});

  @override
  late final List<RegExpSpecialText> regExps = [
    EmojiSpecialText(emj),
  ];
}

class EmojiSpecialText extends RegExpSpecialText {
  final Map<String, String> emj;

  @override
  late final RegExp regExp = RegExp(emj.keys.join('|'));

  EmojiSpecialText(this.emj);

  @override
  InlineSpan finishText(int start, Match match, {TextStyle? textStyle, SpecialTextGestureTapCallback? onTap}) {
    final size = (textStyle?.fontSize ?? 14) * 1.15;

    final actual = match[0]!;
    final asset = emj[actual];

    if (asset != null) {
      return ExtendedWidgetSpan(
        child: Image.asset(asset, width: size, height: size, scale: 4, fit: BoxFit.contain),
        actualText: actual,
        start: start,
      );
    }

    return SpecialTextSpan(text: actual, actualText: actual, start: start);
  }
}

extension XSpecialTextSpanBuilder on SpecialTextSpanBuilder? {
  TextSpan build({required String text}) {
    final tmp = this;

    if (tmp == null) {
      return TextSpan(text: text);
    } else {
      return tmp.build(text);
    }
  }
}

class StyledTextTagEmoji extends StyledTextTagBase {
  final Map<String, String> emj;

  StyledTextTagEmoji({required this.emj});

  @override
  InlineSpan createSpan({required context, text, children, required attributes, recognizer}) {
    final child = _builder(context, attributes);

    return WidgetSpan(
      child: child,
      alignment: PlaceholderAlignment.middle,
      baseline: TextBaseline.alphabetic,
    );
  }

  Widget _builder(BuildContext context, Map<String?, String?> attributes) {
    late final size = DefaultTextStyle.of(context).style.fontSize;

    switch (attributes['type']) {
      case 'local':
        return Image.asset(IMG.$('emoji/icon_${attributes['src']}'), width: size, height: size, scale: 3);
      default:
        return SizedBox(width: size, height: size);
    }
  }
}
