import 'dart:ui';

import 'package:app/common/theme.dart';
import 'package:app/store/my_dressup_ctrl.dart';
import 'package:app/store/my_wardrobe_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

typedef DateItem = Tuple2<RxInt, Map>;

class BackpackView$Wardrobe extends StatefulWidget {
  const BackpackView$Wardrobe({super.key});

  @override
  State<BackpackView$Wardrobe> createState() => _BackpackView$WardrobeState();
}

class _BackpackView$WardrobeState extends State<BackpackView$Wardrobe> {
  late final selectRx = RxMap<int, DateItem>();
  late final wardrobeCtrl = Get.find<MyWardrobeCtrl>();

  @override
  void initState() {
    super.initState();

    wardrobeCtrl.doRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _DataView(selectRx: selectRx),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 135 + AppSize.safeBottom,
          child: Obx(
            () {
              final data = selectRx();

              return data.isEmpty
                  ? Spacing.blank
                  : ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: AppBorderRadius.t10,
                      child: ColoredBox(
                        color: const Color(0x9DFFFFFF),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                          child: $ActionView(data),
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  Widget $ActionView(Map<int, DateItem> data) {
    final agg = <int, num>{};

    for (final item in data.values) {
      final k = item.value2['currency'];
      final v = item.value2['price'];

      final _v = agg[k];

      if (_v is num) {
        agg[k] = _v + v;
      } else {
        agg[k] = v;
      }
    }

    Widget child = Padding(
      padding: const Pad(top: 30),
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 16, color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            XText(
              '共${data.length}件商品',
              style: const TextStyle(fontWeight: fw$Medium),
            ),
            Spacing.h4,
            XRichText(
              TextSpan(
                children: [
                  const TextSpan(text: '总价值'),
                  ...agg.entries.expand((it) {
                    final type = MoneyType.fromVal(it.key);

                    return [
                      TextSpan(text: '\t${it.value}'),
                      if (type != null)
                        WidgetSpan(
                          child: MoneyIcon(type: type, size: 24),
                          alignment: PlaceholderAlignment.middle,
                        ),
                    ];
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );

    child = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: child),
        Padding(
          padding: const Pad(top: 35),
          child: $Btn(data.keys.toList(growable: false), '赠送'),
        ),
        Padding(
          padding: const Pad(top: 35),
          child: $Btn(data.keys.toList(growable: false), '使用'),
        ),
      ].separator(Spacing.w10).toList(growable: false),
    );

    child = Padding(padding: const Pad(horizontal: 20), child: child);

    return child;
  }

  Widget $Btn(List<int> ids, String action) {
    void onTap() {
      switch (action) {
        case '赠送':
          wardrobeCtrl.doGive(
            ids: ids,
            callback: selectRx.clear,
          );
          break;
        case '使用':
          wardrobeCtrl.doUse(
            ids: ids,
            callback: (_) => selectRx.clear(),
          );
      }
    }

    return XTextBtn(
      label: action,
      width: 67,
      height: 34,
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$SemiBold),
      onTap: onTap,
    );
  }
}

class _DataView extends StatelessWidget {
  final RxMap<int, DateItem> selectRx;

  const _DataView({required this.selectRx});

  @override
  Widget build(BuildContext context) {
    const delegate = XGridDelegate(
      childAspectRatio: 105 / 78,
      crossAxisCount: 3,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      fixedHeight: 22,
    );

    return GetX<MyWardrobeCtrl>(
      builder: (it) {
        final data = it.dataRx();

        return RefreshIndicator(
          onRefresh: it.doRefresh,
          child: data.isEmpty
              ? context.state<DataEmpty>(it.doRefresh)
              : GridView.builder(
                  padding: Pad(horizontal: 20, top: 20, bottom: selectRx.isEmpty ? 20 : 150),
                  gridDelegate: delegate,
                  itemCount: data.length,
                  itemBuilder: (_, i) => _ItemView(data: data[i], selectRx: selectRx),
                ),
        );
      },
    );
  }
}

class _ItemView extends StatelessWidget {
  final DateItem data;
  final RxMap<int, DateItem> selectRx;

  _ItemView({required this.data, required this.selectRx});

  late final _countRx = data.value1;
  late final _data = data.value2;
  late final _id = _data['product_id'];

  @override
  Widget build(BuildContext context) {
    final imageView = Box(
      padding: const Pad(top: 4, bottom: 8),
      child: BlankImgState(
        child: NetImage(_data['image']),
      ),
    );

    final nameView = DecoratedBox(
      decoration: const ShapeDecoration(
        shape: XRectangleBorder(borderRadius: AppBorderRadius.b8),
        gradient: LinearGradient(
          colors: [Color(0xFFB7E0FC), Color(0xFFE1F3FF), Color(0xFFB7E0FC)],
        ),
      ),
      child: Center(
        child: XText(
          _data['name'],
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );

    final countView = Container(
      constraints: const BoxConstraints(minWidth: 20),
      decoration: const ShapeDecoration(shape: XStadiumBorder(), color: Color(0x4D000000)),
      alignment: Alignment.center,
      child: Obx(
        () => XText(
          'X${_countRx()}',
          style: const TextStyle(fontSize: 8, color: Colors.white),
        ),
      ),
    );

    Widget child = Stack(
      children: [
        Positioned(top: 0, left: 0, right: 0, bottom: 22, child: imageView),
        Positioned(top: 3, right: 3, height: 10, child: countView),
        Positioned(left: 0, right: 0, bottom: 0, height: 22, child: nameView),

        // label图片
        if (_data case {'label_list': List items})
          for (var i = 0; i < items.length; ++i)
            Positioned(
              top: 5,
              left: 5.0 * (i + 1) + 32 * i,
              child: NetImage(items[i]['icon'], width: 32, height: 16, fit: BoxFit.contain),
            ),
      ],
    );

    child = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (selectRx.remove(_id) == null) selectRx[_id] = data;
      },
      child: child,
    );

    return Obx(
      () {
        final _decor = BoxDecoration(
          borderRadius: AppBorderRadius.a8,
          border: selectRx.containsKey(_id)
              ? const Border.fromBorderSide(
                  BorderSide(
                    width: 2,
                    color: AppPalette.primary,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                )
              : const Border.fromBorderSide(
                  BorderSide(
                    width: 2,
                    color: Color(0xFFE8F5FF),
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
        );

        return AnimatedContainer(
          duration: kTabScrollDuration,
          curve: Curves.easeOutCubic,
          decoration: _decor,
          child: child,
        );
      },
    );
  }
}
