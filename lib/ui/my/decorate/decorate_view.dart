
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/common/room_card_view.dart';
import 'package:app/ui/main/nav_view.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/my_tab_indicator.dart';
import 'package:dartz/dartz.dart' as T;
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

typedef ItemFactory = Widget Function(String title);

///
/// 装扮页面
///
class DecoratePage extends StatefulWidget {

  const DecoratePage({super.key});

  @override
  _DecorateState createState() => _DecorateState();
}

class _DecorateState extends State<DecoratePage> with SingleTickerProviderStateMixin {

  final data = <String, Widget>{};

  late TabController  controller;

  int curSelectIndex = 0;

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
            borderRadius: BorderRadius.circular(100)
        ) : BoxDecoration(
            color: const Color(0xFFE9E9E9),
            borderRadius: BorderRadius.circular(100)
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

    return Scaffold(
      appBar: xAppBar(title: "装扮"),
      bottomNavigationBar: createBottomBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
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
              labelColor:const T.Tuple2(Colors.white, Color(0XFF666666)),
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
      ),
    );
  }

  Widget createItem(Map data) {
    String title = data["title"];
    List datas = [1, 10, 11, 12];

    // return SizedBox();
    return CustomScrollView(
      slivers: datas.map((e) {
        return SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 两个类别的间距
              datas.indexOf(e) == 0 ? SizedBox(height: 22,) : SizedBox(height: 15,),
              // 标题
              createNavigator(title),
              SizedBox(height: 19,),
              // 表格处理
              createGrid(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget createNavigator(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 11,),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 15
            ),
          ),
        ),

        Text(
          title,
          style: TextStyle(
            color: Color(0xFF6B6B6B),
            fontWeight: FontWeight.w500,
            fontSize: 12
          ),
        ),
        RightArrowIcon(),
        SizedBox(width: 11,),
      ],
    );
  }

  Widget createGrid() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 8,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 11,
          childAspectRatio: 0.68
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 图标
              RoomCardView(image: ""),
              // 名字
              SizedBox(height: 6,),
              Text(
                "电音派对",
                style: TextStyle(
                  color: AppPalette.txtDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w700
                ),
              ),
              // 价格
              SizedBox(height: 5,),
              createPrize(),
            ],
          );
        }
      ),
    );
  }

  Widget createPrize() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MoneyIcon(type: MoneyType.gold, size: 16),
        SizedBox(width: 2,),
        Text(
          "10",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppPalette.txtDark,
            fontSize: 12,
            fontWeight: FontWeight.w700
          ),
        )
      ],
    );
  }

  Widget createActivity() {
    return Container(
      width: 50,
      height: 16,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFFFEBF3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "活动获得",
        style: TextStyle(
          color: Color(0xFFFF569D),
          fontWeight: FontWeight.w700,
          fontSize: 10
        ),
      ),
    );
  }

  Widget createBottomBar() {
    return Container(
      height: 87,
      color: Color(0xFFEBEBFF),
      padding: EdgeInsets.only(bottom: 10, left: 11, right: 11),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "余额：",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppPalette.txtDark,
            ),
          ),

          Expanded(child: SizedBox()),

          // 紫砖
          Row(
            children: [
              // 紫砖
              SizedBox(
                height: 26,
                width: 26,
                child: Stack(
                  children: [
                    Positioned.fill(
                      left: 12,
                      top: 3,
                      bottom: 3,
                      child: Container(color: Color(0xFFC1C1C1)),
                    ),
                    Positioned.fill(
                      child: MoneyIcon(type: MoneyType.diamond, size: 50),
                    ),
                  ],
                ),
              ),

              // 金额
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFC1C1C1),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 5,),
                    Text(
                      "1000",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppPalette.txtDark,
                      ),
                    ),
                    // 充值
                    SizedBox(width: 8,),
                    Image.asset(IMG.format("my/charge_add"), width: 17, height: 17,),
                  ],
                ),
              )
            ],
          ),


          // 黄砖
          SizedBox(width: 20,),
          Row(
            children: [
              // 紫砖
              SizedBox(
                height: 26,
                width: 26,
                child: Stack(
                  children: [
                    Positioned.fill(
                      left: 12,
                      top: 3,
                      bottom: 3,
                      child: Container(color: Color(0xFFC1C1C1)),
                    ),
                    Positioned.fill(
                      child: MoneyIcon(type: MoneyType.gold, size: 50),
                    ),
                  ],
                ),
              ),

              // 金额
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFC1C1C1),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 5,),
                    Text(
                      "100011",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppPalette.txtDark,
                      ),
                    ),
                    SizedBox(width: 11,),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}