import 'package:app/common/theme.dart';
import 'package:app/model/api/moment_dto.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/moment/detail/moment_detail_page.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class UserMomentView extends SimplePageView<Rx<MomentDto>> {
  final UID? uid;

  Function? callBack;

  UserMomentView({super.key, this.uid, this.callBack});

  @override
  Future fetchPage(PageNum page) {
    if(page.firstPage()) {
      callBack?.call();
    }
    return Api.Moment.list(page: page, uid: uid);
  }

  @override
  DataTr<Rx<MomentDto>> get transform {
    return (it) => (it as Iterable).map((it) => MomentDto.fromJson(it)).map(Rx.new);
  }

  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(horizontal: 10, top: 10, bottom: 64),
      divider: Spacing.h20,
    );
  }

  @override
  Widget itemBuilder(BuildContext context, Rx<MomentDto> item, int index) {
    return _ItemView(dataRx: item);
  }
}

class _ItemView extends StatelessWidget {
  final Rx<MomentDto> dataRx;

  const _ItemView({required this.dataRx});

  @override
  Widget build(BuildContext context) {
    const double size = 80;

    final dynamic = dataRx().content;

    Widget child = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        $MediaView(size, dynamic.media),
        Spacing.w10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: XText(
                  dynamic.text,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              XText(
                dynamic.dateTime?.fromNow() ?? '--',
                style: const TextStyle(fontSize: 10, color: AppPalette.c9),
              ),
            ],
          ),
        ),
      ],
    );

    child = Box(height: size, child: child);

    child = InkWell(
      child: child,
      onTap: () => Get.to(() => MomentDetailPage(MomentDtoAdapter(dataRx))),
    );

    return child;
  }

  Widget $MediaView(double size, List? items) {
    if (items != null && items.isNotEmpty) {
      final first = items.first;

      switch (first['type']) {
        case 0:
          return NineGrid(
            size: size,
            space: 2,
            items.map((it) => $ImageView(it['url'], it['extra'])),
          );
        case 1:
          return SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                $ImageView(first['cover']),
                const PlayIcon(),
              ],
            ),
          );
        default:
          assert(false, items);
      }
    }

    return Placeholder(
      child: SizedBox(width: size, height: size),
    );
  }

  Widget $ImageView(String url, [String? extra]) {
    return ClipRRect(
      borderRadius: AppBorderRadius.a4,
      child: NetImage(url, blur: extra, fit: BoxFit.cover),
    );
  }
}
