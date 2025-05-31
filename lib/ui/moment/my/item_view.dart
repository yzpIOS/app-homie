import 'package:app/model/api/moment_dto.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

import 'package:app/ui/moment/detail/moment_detail_page.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/ui/moment/widgets/num_view.dart';

class ItemView extends StatelessWidget {
  final Rx<MomentDto> dataRx;

  const ItemView({super.key, required this.dataRx});

  @override
  Widget build(BuildContext context) {
    Widget child = Obx(
      () {
        return NumView(
          action: '赞',
          num: $NumFormat(dataRx().count.likeCount),
        );
      },
    );

    child = Stack(
      children: [
        $MediaView(dataRx().content.media),
        Positioned(bottom: 0, child: child),
      ],
    );

    child = OpacityButton(
      child: child,
      onTap: () => Get.to(() => MomentDetailPage(MomentDtoAdapter(dataRx))),
    );

    return child;
  }

  Widget $MediaView(List? items) {
    if (items != null && items.isNotEmpty) {
      final first = items.first;

      switch (first['type']) {
        case 0:
          return NetImage(first['url'], blur: first['extra'], fit: BoxFit.cover);
        case 1:
          return NetImage(first['cover'], fit: BoxFit.cover);
        default:
          assert(false, items);
      }
    }

    return const Placeholder();
  }
}
