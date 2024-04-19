import 'package:app/model/api/moment_dto.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';

import 'package:app/ui/moment/my/item_view.dart';

class SecretMomentView extends SimplePageView<Rx<MomentDto>> {
  SecretMomentView({super.key});

  @override
  Future fetchPage(PageNum page) => Api.Moment.secretList(page: page);

  @override
  DataTr<Rx<MomentDto>> get transform {
    return (it) => (it as Iterable).map((it) => MomentDto.fromJson(it)).map(Rx.new);
  }

  @override
  BaseConfig get config {
    const double spacing = 1;

    return GridConfig(
      padding: Pad(horizontal: spacing, top: spacing, bottom: 64),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 4,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
      ),
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Rx<MomentDto> item, int index) {
    return ItemView(dataRx: item);
  }
}
