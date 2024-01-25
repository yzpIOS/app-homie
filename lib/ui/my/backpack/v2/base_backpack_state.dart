
import 'package:app/common/theme.dart';
import 'package:app/store/my_wardrobe_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import '../v1/backpack_view_wardrobe.dart';
typedef DateItem = Tuple2<RxInt, Map>;

abstract class BaseBackPackState<T extends StatefulWidget> extends State<T> with SingleTickerProviderStateMixin {

  int curSelectIndex = 0;

  final data = RxMap<String, Widget>();

  late final selectRx = RxMap<int, DateItem>();

  late TabController  controller;

  @override
  void initState() {
    super.initState();
    data["派对背景"] = createItem({"title": "语音派对背景", "data": {}});
    data["头像框"] = createItem({"title": "语音派对背景", "data": {}});
    data["坐骑"] = createItem({"title": "语音派对背景", "data": {}});
    data["气泡"] = createItem({"title": "语音派对背景", "data": {}});
    data["月榜"] = createItem({"title": "语音派对背景", "data": {}});
    data["月榜"] = createItem({"title": "语音派对背景", "data": {}});

    controller = TabController(vsync: this, length: data.length);
    controller.addListener(() {
      curSelectIndex = controller.index;
      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    var items = data.keys.toList();
    for(int index = 0; index < items.length; index ++) {
      children.add(Container(
        height: 23,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: curSelectIndex == index ? BoxDecoration(
            color: AppPalette.primary,
            borderRadius: BorderRadius.circular(5)
        ) : BoxDecoration(
            color: const Color(0xFFE9E9E9),
            borderRadius: BorderRadius.circular(5)
        ),

        child: Text(
          items[index],
          style: TextStyle(
              color: curSelectIndex == index ? Colors.white : Color(0xFF6C6C6C),
              fontWeight: FontWeight.normal,
              fontSize: 12
          ),
        ),
      ));
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(left: 7, right: 7, top: 7, bottom: 10),
          child: xAppBar$TabBar(
            data.keys,
            controller: controller,
            alignment: Alignment.centerLeft,
            needPadding: false,
            needDownLine: false,
            isScrollable: true,
            fontSize: 12,
            height: 23,
            labelPadding: 5,
            kItemHeight: 23,
            decoration: const BoxDecoration(),
            indicatorColor: AppPalette.sheetWhite,
            labelColor:const Tuple2(Colors.white, Color(0XFF666666)),
            tabManufacture: children,
          ),
        ),

        Expanded(
            child: TabBarView(
              controller: controller,
              children: data.values.toList(),
            )
        ),
      ],
    );
  }


  Widget createItem(Map data);
}



class BackPackDataView2 extends StatelessWidget {

  final Pad? padding;

  final selectRx = RxMap<int, DateItem>();

  BackPackDataView2({required this.padding});

  @override
  Widget build(BuildContext context) {
    const delegate = XGridDelegate(
      childAspectRatio: 112 / 116,
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
            padding: padding,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          XText(
            _data['name'],
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          Image.asset(IMG.format("my/icon_nan"), width: 20, height: 20,)
        ],
      ),
    );

    final countView = Container(
      constraints: BoxConstraints(
          minWidth: 35, minHeight: 16),
      decoration: BoxDecoration(
        color: Color(0xFF27E4BB),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0)
        )
      ),
      alignment: Alignment.center,
      child: Obx(
            () => XText(
          'X${_countRx()}',
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );

    Widget leftTime = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(IMG.format("my/icon_sj"), width: 12, height: 12,),
        SizedBox(width: 1,),
        Text(
          "3天",
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF999999),
            fontWeight: FontWeight.normal
          ),
        )
      ],
    );

    Widget child = Stack(
      children: [
        Positioned(top: 0, left: 0, right: 0, bottom: 22, child: imageView),
        Positioned(top: 1, left: 1, height: 16, child: countView),
        Positioned(left: 0, right: 0, bottom: 0, height: 22, child: nameView),
        Positioned(
          right: 3,
          bottom: 25,
          height: 11,
          child: leftTime,
        ),

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
          borderRadius: AppBorderRadius.a10,
          border: selectRx.containsKey(_id)
              ? const Border.fromBorderSide(
            BorderSide(
              width: 2,
              color: AppPalette.primary,
            ),
          )
              : const Border.fromBorderSide(
            BorderSide(
              width: 2,
              color: Color(0xFFE8F5FF),
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
