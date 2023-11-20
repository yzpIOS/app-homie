import 'package:app/store/room/room_hot_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/home/home_banner_view.dart';
import 'package:app/ui/home/room_item_view.dart';

class HotRoomView extends StatefulWidget {
  const HotRoomView({super.key});

  @override
  State<HotRoomView> createState() => _HotRoomViewState();
}

class _HotRoomViewState extends State<HotRoomView> with GetStateMixin {
  late final ctrl = bindGet(RoomHotCtrl());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final isLoading = ctrl.top6Rx.isNull();

        return RefreshIndicator(
          onRefresh: ctrl.doRefresh,
          child: CustomScrollView(
            slivers: [
              if (!isLoading)
                Obx(() {
                  final data = ctrl.top6Rx()!;

                  return SliverPadding(
                    padding: const Pad(horizontal: 10, top: 10),
                    sliver: SliverGrid(
                      gridDelegate: RoomItemView.delegate,
                      delegate: SliverChildBuilderDelegate(
                        childCount: data.length,
                        (_, i) => RoomItemView(data: data[i]),
                      ),
                    ),
                  );
                }),
              if (!isLoading)
                SliverPadding(
                  padding: const Pad(top: 10),
                  sliver: const HomeBannerView().toSliver(),
                ),
              ConfigList(
                config: const SliverGridConfig(
                  padding: Pad(horizontal: 10, top: 10, bottom: 50),
                  gridDelegate: RoomItemView.delegate,
                ),
                child: DataView$Page<RoomHotCtrl, Map>(
                  ctrl: ctrl,
                  itemBuilder: (_, item, __) => RoomItemView(data: item),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
