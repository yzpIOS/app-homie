import 'package:app/event/event.dart';
import 'package:app/model/api/moment_dto.dart';
import 'package:app/store/moment/moment_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/upgrade/upgrade_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/moment/detail/moment_detail_page.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/ui/moment/view_item/impl/export.dart';

class MomentView extends StatefulWidget {
  final bool autoRefresh;
  final Future Function(PageNum page) api;

  const MomentView({super.key, required this.api, this.autoRefresh = false});

  @override
  State<MomentView> createState() => _MomentViewState();
}

class _MomentViewState extends SimplePageState<Rx<MomentDto>, MomentView> with BusStateMixin {
  @override
  void initState() {
    super.initState();

    if (widget.autoRefresh) {
      on<MomentRefreshEvent>(
        (_) => controller.doRefresh(),
      );
    }

    on<DeleteMomentEvent>(
      (event) {
        final dynamicId = event.dynamicId;

        controller.removeOne(
          (data) => data().content.id == dynamicId,
        );
      },
    );

    // 拉黑时需要刷新数据
    on<UserBlackEvent>(
      (event) {
        controller.doRefresh();
      }
    );
  }

  @override
  Future fetchPage(PageNum page) => widget.api(page);

  @override
  DataTr<Rx<MomentDto>> get transform {
    return (it) => (it as Iterable).map((it) => MomentDto.fromJson(it)).map(Rx.new);
  }

  @override
  Widget itemBuilder(BuildContext context, Rx<MomentDto> item, int index) {
    return GetBuilder<MomentCtrl>(
      key: ValueKey(item),
      global: false,
      init: MomentCtrl(item),
      dispose: (it) => it.controller?.onDelete(),
      builder: (it) => _ItemView(MomentDtoAdapter(it.data), (data) {
        Get.to(() => MomentDetailPage(data));
      }),
    );
  }
}

class _ItemView extends ViewAdapter<MomentDtoAdapter>
    with //
        MomentHeader,
        MomentBottomBar {
  Function(MomentDtoAdapter) callBack;

  _ItemView(super.vm, this.callBack);

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const Pad(top: 10, bottom: 5),
          child: $header(),
        ),
        Padding(
          padding: Pad(horizontal: avatarSize + 10 * 2),
          child: _ContentView(vm),
        ),
        $bottomBar(),
      ],
    );

    child = DecorButton(
      child: child,
      onTap: () {
        if(Env.isDebug) {
          UpGradePage.showDialog();
          return;
        }
        callBack.call(vm);
      },
    );

    child = Material(color: Colors.white, child: child);

    return child;
  }
}

class _ContentView extends MomentContentView$Item<MomentDtoAdapter>
    with //
        MomentTopic,
        MomentTxt,
        MomentImage<MomentDtoAdapter>,
        MomentVideo<MomentDtoAdapter> {
  _ContentView(super.vm);

  @override
  late final imageCreator = ImageCreator$Grid(axisCount: 2, maxLines: 2);

  @override
  late final videoCreator = VideoCreator$Net();

  @override
  int? get maxLines => 3;
}
