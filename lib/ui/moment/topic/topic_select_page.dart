import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TopicSelectPage extends StatefulWidget {
  const TopicSelectPage({super.key});

  @override
  State<TopicSelectPage> createState() => _TopicSelectPageState();
}

class _TopicSelectPageState extends State<TopicSelectPage> {
  final keywordRx = RxnString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background2,
      appBar: xAppBar(title: '话题列表'),
      body: Column(
        children: [
          Box(
            color: Colors.white,
            height: AppSize.appBar,
            alignment: Alignment.center,
            padding: const Pad(horizontal: 16),
            child: $SearchView(),
          ),
          Expanded(
            child: Obx(() => _DataView(keywordRx())),
          ),
        ],
      ),
    );
  }

  // Widget $CreateBtn() {
  //   const icon = Text(
  //     '#',
  //     style: TextStyle(fontSize: 16, color: Color(0xFF5E94FF), fontWeight: fw$Bold),
  //   );
  //
  //   return xActionBtn(
  //     icon: icon,
  //     onPressed: () {
  //       XInputPage.go(InputCfg(title: '创建话题')).onNotNull((val) {
  //         //
  //       });
  //     },
  //   );
  // }

  Widget $BlankView() {
    return Spacing.blank;
  }

  Widget $SearchView() {
    return XInputView(
      height: 32,
      hintText: '请输入关键字',
      textInputAction: TextInputAction.search,
      prefixIcon: Container(
        width: 24,
        height: 24,
        margin: const Pad(left: 10, right: 5, top: 2),
        child: const Icon(Icons.search_rounded, size: 18, color: AppPalette.c9),
      ),
      onSubmitted: keywordRx,
    );
  }
}

class _DataView extends StatefulWidget {
  final String? keyword;

  _DataView(this.keyword) : super(key: ValueKey(keyword));

  @override
  State<_DataView> createState() => _DataViewState();
}

class _DataViewState extends SimplePageState<Map, _DataView> {
  @override
  BaseConfig get config {
    return ListConfig(
      padding: Pad(top: 10, bottom: AppSize.safeBottom),
      divider: Spacing.h10,
    );
  }

  @override
  Future fetchPage(PageNum page) {
    return Api.Moment.topicList(page: page, name: widget.keyword);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    Widget child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12, color: AppPalette.c9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.h4,
          XText(
            '#${item['name']}#',
            style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Medium),
          ),
          Spacing.h2,
          XText('${item['dynamic_count']}条动态'),
          Spacing.h2,
          XText(item['description'] ?? ''),
        ],
      ),
    );

    child = Row(
      children: [
        ClipRRect(
          borderRadius: AppBorderRadius.a4,
          child: NetImage(item['image'], width: 70, height: 70, fit: BoxFit.cover),
        ),
        Spacing.w10,
        Expanded(
          child: child,
        ),
      ],
    );

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () => Get.back(result: item),
        child: Padding(
          padding: const Pad(horizontal: 10, vertical: 10),
          child: child,
        ),
      ),
    );
  }
}
