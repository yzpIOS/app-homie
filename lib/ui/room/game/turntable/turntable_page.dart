

import 'package:app/common/theme.dart';
import 'package:app/model/activity_info_model.dart';
import 'package:app/model/activity_lottery_model.dart';
import 'package:app/net/api.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:app/ui/my/wallet/recharge_page.dart';
import 'package:app/ui/room/game/turntable/dialog/turntable_prize_dialog.dart';
import 'package:app/ui/room/game/turntable/views/turntable_item_view.dart';
import 'package:app/ui/room/game/turntable/dialog/turntable_record_dialog.dart';
import 'package:app/ui/room/game/turntable/dialog/turntable_rule_dialog.dart';
import 'package:app/ui/room/persion/common_dialog.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class TurntablePage extends StatefulWidget {

  ActivityInfoModel infoModel;

  TurntablePage({required this.infoModel, super.key});

  static Future<void> showDialog(ActivityInfoModel infoModel) async {
    if(infoModel.type != 1) {
      return;
    }

    var dialog = TurntablePage(infoModel:infoModel);
    await Get.dialog(
      dialog,
      useSafeArea: false,
      routeSettings: dialog.toRouteSettings(),
    );
  }

  @override
  State<StatefulWidget> createState() => _TurntablePageState();
}


class _TurntablePageState extends State<TurntablePage> {

  // 当前的模式
  int curSelectedIndex = 0;

  // 位置列表
  List<EdgeInsets> locations = [];

  // 每个礼物的大小
  double totalWidth = 66.0;

  // 转动值变化处理
  final ValueNotifier<double> _counter = ValueNotifier<double>(0);
  // 是否均速运动
  bool _speedNotChange = false;

  // 中奖的位置
  int _resultIndex = -1;
  // 当前中奖列表
  List currentPrizeList = [];

  // 奖品列表
  List prizeItemList = [];
  dynamic modeId;
  int lotteryPrice = 0;


  bool noPlayAnimation = false;
  
  @override
  void initState() {
    super.initState();
    double gap = 7.0;
    totalWidth = (326.0 - 26 * 2 - 9 * 2 - gap * 3) / 4.0;

    // 第一个
    locations.add(EdgeInsets.only(left: 9, top: 11));
    // 第二个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap), top: 11));
    // 第三个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 2, top: 11));
    // 第四个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 3, top: 11));

    // 第五个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 3, top: 11 + (totalWidth + gap)));
    // 第六个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 3, top: 11 + (totalWidth + gap) * 2));
    // 第七个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 3, top: 11 + (totalWidth + gap) * 3));


    // 第八个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 2, top: 11 + (totalWidth + gap) * 3));
    // 第九个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 1, top: 11 + (totalWidth + gap) * 3));
    // 第十个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 0, top: 11 + (totalWidth + gap) * 3));


    // 第十一个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 0, top: 11 + (totalWidth + gap) * 2));
    // 第十二个
    locations.add(EdgeInsets.only(left: 9 + (totalWidth + gap) * 0, top: 11 + (totalWidth + gap) * 1));


    var itemList = widget.infoModel.lotteryItemList ?? [];
    modeId = itemList[curSelectedIndex].id;
    lotteryPrice = itemList[curSelectedIndex].lotteryPrice ?? 0;

    requestLottery(showLoading: false);
  }

  ///
  /// 刷新商品列表
  ///
  void requestLottery({bool showLoading = true}) async {
    // 获取商品列表
    simpleTry(() => Api.Activity.getLotteryList(modeId), callback: (list) {
      if(list == null || list["items"] == null) {
        prizeItemList = [];
      } else {
        prizeItemList = list["items"] ?? [];
      }
      setState(() { });
    }, showProgress: showLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(child: SizedBox()),

            // 转盘界面
            SizedBox(
              width: 326,
              height: 416,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  // tabBar
                  _createTabBar(),

                  // 内容
                  _createContentView(),

                  // 规则，中奖记录
                  _createRuleAndRecord(),
                ],
              ),
            ),

            // 底部按钮
            _createBottomButton(),

            // 跳过动画
            _createAnimationButton(),

            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget _createTabBar() {
    var itemList = widget.infoModel.lotteryItemList ?? [];
    return Positioned(
      left: 0,
      right: 0,
      top: 2,
      height: 66,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: itemList.map((e) {
          String modeName = "";
          if(e.mode == 1) {
            modeName = "普通模式";
          } else if(e.mode == 2) {
            modeName = "高级模式";
          } else if(e.mode == 3) {
            modeName = "疯狂模式";
          } else {
            return const SizedBox();
          }
          return _createTabBButton(modeName, itemList.indexOf(e), curSelectedIndex);
        }).toList(),
      ),
    );
  }

  ///
  /// 头部tab单个按钮
  ///
  Widget _createTabBButton(String label, int index, int selectedIndex) {
    // 背景图
    String imagePath;
    if(index == selectedIndex) {
      imagePath = IMG.format("room/game/turntable_pic_xz");
    } else {
      imagePath = IMG.format("room/game/turntable_pic_wxz");
    }

    // 文字样式
    TextStyle style;
    if(index == selectedIndex) {
      style = const TextStyle(
        color: Color(0xffA953AB),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
    } else {
      style = const TextStyle(
        color: Color(0xffC98FD7),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );
    }

    return GestureDetector(
      onTap: () {
        // 动画没有播放完
        if(currentPrizeList.isNotEmpty || _timer != null) {
          return;
        }
        //debugPrint("GestureDetector .......");
        curSelectedIndex = index;

        var itemList = widget.infoModel.lotteryItemList ?? [];
        modeId = itemList[curSelectedIndex].id;
        lotteryPrice = itemList[curSelectedIndex].lotteryPrice ?? 0;
        requestLottery();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 100,
        height: 66,
        padding:const EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            scale: 2
          )
        ),
        child: Text(
          label,
          style: style,
        ),
      ),
    );
  }

  Widget _createContentView() {
    return Positioned(
      left: 0,
      right: 0,
      top: 44,
      child: Container(
        width: 354,
        height: 370,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(IMG.format("room/game/turntable_pic_di")),
            )
        ),
        child: Stack(
          children: [
            _userInfo(),
            _createPrizeList(),
          ],
        ),
      ),
    );
  }

  ///
  /// 用户信息
  ///
  Widget _userInfo() {
    return Positioned(
      left: totalWidth + 26 + 7 + 9,
      top: totalWidth + 61 + 7 + 9,
      child: Container(
        width: totalWidth * 2 + 7,
        height: totalWidth * 2 + 7,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFFE3F9).withAlpha(60),width: 1,),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffCF93F5),
        ),
        child: Column(
          children: [
            Expanded(child: SizedBox()),

            // 充值按钮
            GestureDetector(
              onTap: () async {
                await Get.to(() => RechargePage(hasShowUnityView: false,));
                // 刷新
                await WalletCtrl.ins.doRefresh();
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: 104,
                height: 39,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(39),
                  image: DecorationImage(
                    image: AssetImage(IMG.format("room/game/turntable_button_cz")),
                  )
                ),
                child: Text(
                  "去充值",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                ),
              ),
            ),

            // 余额
            SizedBox(height: 8,),
            WalletCtrl.use(
              builder: (it) {
                return XRichText(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '余额:${it[MoneyType.diamond] ?? '--'} ',
                        style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: fw$SemiBold),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: MoneyIcon(type: MoneyType.diamond, size: 14),
                      )
                    ]
                  )
                );
              },
            ),

            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget _createRuleAndRecord() {
    return Positioned(
      left: 11,
      top: 51,
      right: 11,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 规则 按钮
          GestureDetector(
            onTap: () async {
              if(widget.infoModel.rule == null || widget.infoModel.rule!.isEmpty) {
                return;
              }
              var dialog = TurntableRuleDialog(widget.infoModel.rule ?? "");
              await Get.dialog(
                dialog,
                useSafeArea: false,
                routeSettings: dialog.toRouteSettings(),
              );
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 44,
              height: 23,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient:const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFF97F8),
                        Color(0xFFFF4CF2),
                      ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:const Color(0xff890085).withAlpha(30),
                      offset:const Offset(0, 1),
                      spreadRadius: 1,
                    )
                  ]
              ),
              child:const Text(
                "规则",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),


          // 中奖记录 按钮
          GestureDetector(
            onTap: () async {
              var dialog = TurntableRecordialog(modeId);
              await Get.dialog(
                dialog,
                useSafeArea: false,
                routeSettings: dialog.toRouteSettings(),
              );
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 66,
              height: 23,
              margin: EdgeInsets.only(left: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFF97F8),
                    Color(0xFFFF4CF2),
                  ]
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff890085).withAlpha(30),
                    offset: Offset(0, 1),
                    spreadRadius: 1,
                  )
                ]
              ),
              child: Text(
                "中奖记录",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),

          Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            behavior: HitTestBehavior.translucent,
            child: Image.asset(IMG.format("room/game/turntable_button_close"), width: 21, height: 21,),
          ),
        ],
      ),
    );
  }

  ///
  /// 礼物列表
  ///
  Widget _createPrizeList() {
    return ValueListenableBuilder<double>(
      valueListenable: _counter,
      builder: (a1, a2, a3) {
        return Positioned.fill(
          child: Stack(
            children: locations.map((e) {
              // 计算位置
              int curIndex = locations.indexOf(e);

              if(curIndex < 0 || curIndex >= prizeItemList.length) {
                // 没有数据
                return Positioned(
                  left: e.left + 26,
                  top: e.top + 61,
                  width: totalWidth,
                  height: totalWidth,
                  child: SizedBox(),
                );
              }
              var selectedIndex = _counter.value.toInt() % prizeItemList.length;

              // 己经中奖. 停止定时器，不前进
              if(selectedIndex == _resultIndex && _speedNotChange) {
                toOpenWindowDialog();
              }
              //debugPrint("己经中奖. 停止定时器，不前进 = ${_resultIndex}");

              // 获取当前位置
              var item = prizeItemList[curIndex];

              // 商品
              return Positioned(
                left: e.left + 26,
                top: e.top + 58,
                width: totalWidth + 1,
                height: totalWidth + 1,
                child: TurntableItemView(item, background: selectedIndex == curIndex ? "turntable_pic_xzk" : "turntable_pic_jlk",),
              );
            }).toList(),
          ),
        );
      },
    );

  }

  ///
  /// 底部按钮组
  ///
  Widget _createBottomButton() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _createSingleBottomButton(
          "单购",
          "${lotteryPrice}紫钻",
          Color(0xff193883),
          1
        ),
        _createSingleBottomButton(
          "十连抽",
          "${lotteryPrice * 10}紫钻",
          Color(0xffAB189A),
          10
        ),
        _createSingleBottomButton(
          "百连抽",
          "${lotteryPrice * 100}紫钻",
          Color(0xffCB5301),
          100
        ),
      ],
    );
  }


  ///
  /// 头部tab单个按钮
  ///
  Widget _createSingleBottomButton(String label, String prize, Color prizeTxtColor, int selectedIndex) {
    return GestureDetector(
      onTap: () {
        startSpin(selectedIndex);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 108,
        height: 66,
        transformAlignment: Alignment.center,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IMG.format("room/game/turntable_$label")),
            scale: 2
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 抽奖类型：单购，十连抽，百连抽
            Text(
              label,
              style: TextStyle(
                color: prizeTxtColor,
                fontSize: 16,
                height: 0.9,
                fontWeight: FontWeight.bold,
              ),
            ),

            // 价格
            SizedBox(height: 2,),
            Text(
              prize,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                height: 0.9,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  /// 跳过动画
  ///
  Widget _createAnimationButton() {
    var image = noPlayAnimation ? "room/game/turntable_icon_xz" : "room/game/turntable_icon_xz2";
    return GestureDetector(
      onTap: () {
        noPlayAnimation = !noPlayAnimation;
        setState(() { });
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 28,
        width: 128,
        margin: EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffFFD9FB).withAlpha(60),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(IMG.format(image), width: 17, height: 17,),
            SizedBox(width: 5,),
            Text("跳过动画", style: TextStyle(color: Colors.white, fontSize: 14),),
          ],
        ),
      ),
    );
  }

  Timer? _timer = null;
  int _startTime = 0;

  bool reqBack = true;

  ///
  /// 开始转动
  ///
  void startSpin(int selectedIndex) async {
    if(!reqBack) {
      return;
    }
    resetTurnable();

    // 不播放动画
    if(!noPlayAnimation) {
      _resultIndex = -1;
      // 是否是匀速运行
      _speedNotChange = false;
      // 更新开始时间
      _startTime = DateTime.now().millisecondsSinceEpoch;
      // 定时器
      _timer = Timer.periodic(Duration(milliseconds: 10), onTimings);
    }
    divideTime = DateTime.now().millisecondsSinceEpoch.toDouble();

    // 5秒后请求弹窗
    reqBack = false;
    simpleTry(() => Api.Activity.getStartSpin(modeId, selectedIndex), callback: (result) async {
      reqBack = true;

      await WalletCtrl.ins.doRefresh();

      // 奖品列表
      var windList = result != null ? result["items"] as List : [];
      if(windList.isEmpty) {
        resetTurnable();
        showToast(result["msg"] ?? "数据错误");
        return;
      }

      // 查找出价格最大的值
      Map? maxPrizeValue;
      windList.forEach((element) {
        if(maxPrizeValue == null) {
          maxPrizeValue = element;
        } else if(maxPrizeValue!["price"] < element["price"]) {
          maxPrizeValue = element;
        }
      });

      currentPrizeList = windList;

      // 不播放动画
      if(noPlayAnimation) {
        toOpenWindowDialog();
        resetTurnable();
        return;
      }


      // 要转到的位置
      var targetItem = prizeItemList.firstWhereOrNull((element) => element["prize_id"] == maxPrizeValue?["prize_id"]);
      _resultIndex = prizeItemList.indexOf(targetItem);
      if(_resultIndex < 0) {
        resetTurnable();

        showToast(result["msg"] ?? "数据错误2");
        return;
      }

      divideTime = (DateTime.now().millisecondsSinceEpoch.toDouble() - divideTime) / 1000;
      // 更新开始时间
      _startTime = DateTime.now().millisecondsSinceEpoch;

      if(Env.isDebug) {
        showToast(targetItem["prize_name"]);
      }

    },
    codeCallBack: (code, e) {
      reqBack = true;
      resetTurnable();
      // 余额不足，弹窗去充值
      if(code == 11001) {
        showDialog(context: Get.context!, builder: (context) {
          return CommonDialog(title: "余额不足", confirmLabel: "去充值", confirm:  () async {
            await Get.to(() => RechargePage(hasShowUnityView: false,));

            // 刷新
            await WalletCtrl.ins.doRefresh();
          });
        });
        return;
      };
      showToast("操作失败");
    },
    showProgress: noPlayAnimation);

  }

  void resetTurnable() {
    _timer?.cancel();
    _timer = null;
    _resultIndex = -1;
    _speedNotChange = false;

    _counter.value = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _counter.dispose();
    locations.clear();
    _timer?.cancel();
    _timer = null;
  }


  void toOpenWindowDialog() {
    _timer?.cancel();
    _timer = null;

    if(currentPrizeList.isEmpty) {
      return;
    }
    var newList = currentPrizeList.map((e) => ActivityLotteryModel.fromJson(e)).toList();
    currentPrizeList = [];
    delay(milliseconds:10,callBack: () {
      TurntablePrizeDialog.showDialog(newList);
    });
  }

  int preTime = 0;
  double divideTime = 0;

  void onTimings(Timer timer) {
    int curTime = DateTime.now().millisecondsSinceEpoch;

    // 过的时间
    double seconds = (curTime - _startTime) / 1000.0;
    //debugPrint("startSpin startSpin seconds = ${seconds}");

    // 初始速度
    double v0 = 16;

    if(_resultIndex == -1) {
      // v0t＋ at2
      _counter.value = v0 * seconds;
    } else {
      // 加速度
      double a = 4.0;
      // 最后速度
      double endSpeed = 4.0;

      // vt = vo + at;
      double vt = v0 - a * seconds;


      if(vt > endSpeed) {
        preTime = curTime;
        _speedNotChange = false;
        // v0t＋ at2
        _counter.value = v0 * seconds - 0.5 * a * seconds * seconds + divideTime * v0;

      } else {
        _speedNotChange = true;
        // 速度等于0时，就均速运运
        _counter.value = _counter.value + endSpeed * (curTime - preTime) / 1000;
        preTime = curTime;
      }

    }
    //debugPrint("startSpin startSpin ");
  }
}