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
    '全部': _DetailsListView(),
    '收入': _DetailsListView(type: 1,),
    '支出': _DetailsListView(type: 2,),
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

class _DetailsListView extends SimplePageView<Map> {
  final int? type;//1：收入，2：支出(不传，默认是全部)
  _DetailsListView({this.type});

  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(horizontal: 15, bottom: 10 + AppSize.safeBottom),
      divider: const Divider(color: Color(0xFFE3E7ED),),
    );
  }

  @override
  Future fetchPage(PageNum page) => Api.Finance.diamondDetail(type: type, page: page);

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
    return Box(
      height: 62,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XText(
                  data['name'] ?? '-',
                  style: const TextStyle(fontSize: 14, color: AppPalette.txtDark, fontWeight: fw$Medium),
                ),
                Spacing.h4,
                XText(
                  TimeFormat.yyyyMMddHms.formatEpoch(data['created_at']),
                  style: const TextStyle(fontSize: 12, color: AppPalette.colorA9, fontWeight: fw$Regular),
                ),
              ],
            ),
          ),
          // const Expanded(child: Spacing.blank),
          XText(
            data['amount'] != null ? data['amount'].toString() : '-',
            style: const TextStyle(fontSize: 15, color: AppPalette.txtDark, fontWeight: fw$SemiBold),
          ),
        ],
      ),
    );
  }
}
