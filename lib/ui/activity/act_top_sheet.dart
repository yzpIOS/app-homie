import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ActTopSheet extends ISheetWidget {
  final TickerProvider vsync;

  ActTopSheet(this.vsync, {super.key});

  @override
  late final Tuple2<Widget, VoidCallback>? leading = null;
  @override
  late final Tuple2<Widget, VoidCallback>? trailing = closeBtn;

  @override
  late final Widget title = TabBar(
    controller: ctrl,
    //
    isScrollable: true,
    tabs: tabs.keys.map((it) => Tab(height: 32, text: it)).toList(growable: false),
  );

  late final ctrl = TabController(
    length: tabs.length,
    vsync: vsync,
  );

  late final tabs = {
    '今日榜': _DataView(Api.Lottery.today),
    '昨日榜': _DataView(Api.Lottery.yesterday),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const Pad(top: 8),
      child: TabBarView(
        controller: ctrl,
        children: tabs.values.toList(growable: false),
      ),
    );
  }
}

class _DataView extends SimpleDataView<Map> {
  final Future Function() api;

  _DataView(this.api);

  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(top: 8, bottom: AppSize.safeBottom),
      divider: const Divider(indent: 10, endIndent: 10),
    );
  }

  @override
  Future fetch() => api();

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    final uid = item['uid'];

    return Box(
      padding: const Pad(horizontal: 10),
      height: 52,
      child: Row(
        children: [
          index < 3
              ? SvgView(SVG.$('top/$index'), width: 28, height: 28)
              : Box(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
          Spacing.w10,
          AsyncAvatar(uid: uid, size: 32),
          Spacing.w10,
          Expanded(
            child: UserInfoCtrl.use(
              uid,
              builder: (it) => XText(
                it?.showName() ?? '',
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ),
          Spacing.w10,
          $GiftView(item['items']),
        ],
      ),
    );
  }

  Widget $GiftView(Iterable items) {
    const size = 32.0;
    const space = 10.0;

    const count = 3;

    Widget itemBuilder(data) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(color: Color(0xFFF5F5F5), shape: BoxShape.circle),
            child: Padding(
              padding: const Pad(all: 6),
              child: NetImage(data['image'], fit: BoxFit.cover),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            height: 12,
            child: IntrinsicWidth(
              child: Container(
                constraints: const BoxConstraints(minWidth: 12, maxWidth: 24),
                decoration: const BoxDecoration(color: Color(0xFF2CDFB9), shape: BoxShape.circle),
                alignment: Alignment.center,
                child: XText(
                  '${data['count']}',
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                  style: const TextStyle(fontSize: 8, color: Colors.white, fontWeight: fw$Medium, height: 1),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: size * count + space * (count - 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: items.take(count).map(itemBuilder).separator(Spacing.w10).toList(growable: false),
      ),
    );
  }
}
