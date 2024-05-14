import 'package:app/common/theme.dart';
import 'package:app/model/enum/room_state.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/room_manager_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class RoomFavPage extends StatefulWidget {
  const RoomFavPage({super.key});

  @override
  State<RoomFavPage> createState() => _RoomFavPageState();
}

class _RoomFavPageState extends State<RoomFavPage> {
  final tabs = {
    '我看过的房间': _HistoryView(),
    '我关注的房间': _FavView(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background2,
      appBar: xAppBar(title: '足迹与关注'),
      body: DefaultTabController(
        length: tabs.length,
        child: Column(
          children: [
            $TabBar(),
            Expanded(
              child: TabBarView(
                children: tabs.values.toList(growable: false),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget $TabBar() {
    Widget child = TabBar(
      tabAlignment: TabAlignment.center,
      isScrollable: true,
      labelPadding: const Pad(horizontal: 16),
      indicatorPadding: const Pad(horizontal: 32),
      labelStyle: const TextStyle(fontSize: 14, fontWeight: fw$SemiBold),
      unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: fw$Regular),
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: tabs.keys.map((it) => Tab(text: it, height: 28)).toList(growable: false),
    );

    return Material(
      color: Colors.white,
      child: Box(
        height: 42,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

class _HistoryView extends SimplePageView<Map> {
  @override
  BaseConfig get config {
    return GroupedListConfig<Map>(
      padding: Pad(horizontal: 10, bottom: 10 + AppSize.safeBottom),
      divider: Spacing.h10,
      groupBuilder: groupBuilder,
      groupBy: groupBy,
    );
  }

  String groupBy(Map data) {
    final tmp = data['created_at'] ?? '';

    final now = DateTime.now();

    try {
      final time = DateTime.parse(tmp).let((it) => DateTime(it.year, it.month, it.day));

      final today = DateTime(now.year, now.month, now.day);

      if (today == time) return '今天';
      if (today.subtract(const Duration(days: 1)) == time) return '昨天';

      return TimeFormat.yyyyMMdd.format(time);
    } catch (e, s) {
      errLog(e, s);

      return '$tmp';
    }
  }

  Widget groupBuilder(int i, String title) {
    Widget child = Box(
      height: 40,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );

    if (i != 0) {
      child = Padding(
        padding: const Pad(top: 8),
        child: child,
      );
    }

    return child;
  }

  @override
  Future fetchPage(PageNum page) => Api.Room.historyList(page: page);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return _ItemView(data: item);
  }
}

class _FavView extends SimplePageView<Map> {
  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(horizontal: 10, vertical: 10, bottom: AppSize.safeBottom),
      divider: Spacing.h10,
    );
  }

  @override
  Future fetchPage(PageNum page) => Api.Room.followList(page: page);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return _ItemView(data: item);
  }
}

class _ItemView extends StatelessWidget {
  final Map data;

  const _ItemView({required this.data});

  @override
  Widget build(BuildContext context) {
    String? homeowner = data['homeowner'];

    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        XText(
          data['room_name'],
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        Spacing.h2,
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            XText('ID:${data['room_no'] ?? data['room_id']}'),
            Spacing.w6,
            if (homeowner != null && homeowner.isNotEmpty)
              XText('房主:$homeowner'),
              // UserInfoCtrl.use(
              //   data['uid'] ?? '',
              //   builder: (it) => XText('房主:${it?.showName ?? ''}'),
              // ),
          ],
        ),
        Spacing.h2,
        XRichText(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.bottom,
                child: Padding(
                  padding: const Pad(right: 2),
                  child: SvgView(SVG.$('room/热度'), width: 12, height: 12),
                ),
              ),
              TextSpan(text: '${data['hot_value']}'),
            ],
          ),
        ),
      ],
    );

    child = Row(
      children: [
        ClipRRect(
          borderRadius: AppBorderRadius.a6,
          child: NetImage(data['image'], width: 60, height: 60, fit: BoxFit.cover),
        ),
        Expanded(
          child: Padding(
            padding: const Pad(horizontal: 10),
            child: child,
          ),
        ),
        if (data['status'] == 1) $OnlineView(),
      ],
    );

    child = Box(
      height: 80,
      padding: const Pad(all: 10),
      child: child,
    );

    child = InkWell(
      child: child,
      onTap: () {
        if (data['status'] == 1) {
          final managerCtrl = Get.find<RoomManagerCtrl>();

          switch (RoomType.fromVal(data['room_type'])) {
            case RoomType.customize:
            case RoomType.guild:
              managerCtrl.toRoom(roomId: data['room_id']);
              break;
            case RoomType.square:
              managerCtrl.toSquare();
              break;
            default:
              showToast('数据错误');
          }
        } else {
          showToast('直播间未开播');
        }
      },
    );

    child = Material(
      shape: AppShape.a6,
      color: Colors.white,
      textStyle: const TextStyle(fontSize: 10, color: AppPalette.c9),
      child: child,
    );

    return child;
  }

  Widget $OnlineView() {
    return Image.asset(IMG.format('room/房间状态_1'), width: 60, height: 24, scale: 3);
  }
}
