import 'package:app/types.dart';
import 'package:app/widgets.dart';

// abstract class IContent<DATA> implements View<DATA> {
//   Widget $content();
// }

abstract class ITxtView<DATA> implements View<DATA> {
  abstract final int? maxLines;
  abstract final TextStyle? textStyle;

  InlineSpan $txt();
}

mixin ITopicView<DATA> implements View<DATA> {
  abstract final ValueChanged<JMap>? onTapTopic;

  InlineSpan $topic(TextStyle style);
}

abstract class IImageView<DATA> implements View<DATA> {
  Widget $img();
}

abstract class IVideoView<DATA> implements View<DATA> {
  Widget $video();
}
