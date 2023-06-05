import 'package:app/tools.dart';
import 'package:app/ui/moment/topic/topic_moment_page.dart';
import 'package:app/ui/moment/view_item/content.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/widgets.dart';

mixin MomentTopic implements ITopicView<MomentDtoAdapter> {
  @override
  InlineSpan $topic(TextStyle style) {
    final data = vm.topic;

    return TextSpan(
      children: [
        if (data != null)
          for (final item in data)
            WidgetSpan(
              style: style,
              baseline: TextBaseline.alphabetic,
              alignment: PlaceholderAlignment.baseline,
              child: DecorButton(
                onTap: onTapTopic?.let((fn) => () => fn(item)),
                child: Padding(
                  padding: const Pad(right: 4),
                  child: Text(
                    '#${item['name']}#',
                    style: style.copyWith(color: const Color(0xFF5E94FF)),
                  ),
                ),
              ),
            ),
      ],
    );
  }

  @override
  ValueChanged<Map>? get onTapTopic {
    return (Map data) {
      Get.to(() => TopicMomentPage(topic: data));
    };
  }
}
