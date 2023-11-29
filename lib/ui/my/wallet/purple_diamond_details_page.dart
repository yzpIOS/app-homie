import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class PurpleDiamondDetailsPage extends StatefulWidget {
  const PurpleDiamondDetailsPage({super.key});

  @override
  State<PurpleDiamondDetailsPage> createState() => _PurpleDiamondDetailsPageState();
}

class _PurpleDiamondDetailsPageState extends State<PurpleDiamondDetailsPage> {
  final tabs = {
    '全部': _HistoryView(),
    '收入': _HistoryView(),
    '支出': _HistoryView(),
  };

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '紫钻明细'),
      body: DefaultTabController(
        length: tabs.length,
        child: Column(
          children: [
            $TabBar(),
            Expanded(
              child: ConfigListState(
                buildNoMoreView: ([_]) => const Box(
                  height: 40,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Divider(color: Color(0xFFE3E7ED),),
                      Spacing(height: 15, flex: null,),
                      XText(
                        '最多展示6个月的数据',
                        style: TextStyle(fontSize: 11, color: AppPalette.colorA9),
                      ),
                    ],
                  )
                ),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: tabs.values.toList(growable: false),
                ),
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
      labelPadding: const Pad(horizontal: 31),
      labelStyle: const TextStyle(fontSize: 16, color: AppPalette.primary, fontWeight: fw$SemiBold),
      unselectedLabelStyle: const TextStyle(fontSize: 16, color: AppPalette.appBarForegroundColorDark, fontWeight: fw$Regular),
      indicatorSize: TabBarIndicatorSize.label,
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
      padding: Pad(horizontal: 15, bottom: 10 + AppSize.safeBottom),
      divider: const Divider(color: Color(0xFFE3E7ED),),
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

      return '微信充值';
    } catch (e, s) {
      errLog(e, s);

      return '$tmp';
    }
  }

  Widget groupBuilder(int i, String title) {
    Widget child = Box(
      height: 36,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$SemiBold),
      ),
    );

    return child;
  }

  @override
  Future fetchPage(PageNum page) => Api.Room.historyList(page: page);

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
    return const Box(
      height: 40,
      child: Row(
        children: [
          XText(
            '2023-11-24 10:06:27',
            style: TextStyle(fontSize: 12, color: AppPalette.colorA9, fontWeight: fw$Regular),
          ),
          Expanded(child: Spacing.blank),
          XText(
            '+6.00',
            style: TextStyle(fontSize: 14, color: AppPalette.txtDark, fontWeight: fw$SemiBold),
          ),
        ],
      ),
    );
  }
}
