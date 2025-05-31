import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/utils/base_client.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/store/user/my_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:app/widgets/list/list_ctrl.dart';
import 'package:get/get.dart';
import 'package:protobuf/protobuf.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';

class ShopCategoryCtrl extends AsyncListCtrl<Map> {
  ShopCategoryCtrl({required super.uid}) : super(boxName: 'ShopCategoryData');

  RxList<dynamic> allCategoryList = RxList();
  late final myInfo = Get.find<MyInfoCtrl>().dataRx;
  // 待发送列表
  List<int> listGoods = [];
  List<int> hasSendGoods = [];
  bool isonUnityRequestCome = false;
  StreamSubscription? streamSubscription;

  @override
  void onInit() {
    super.onInit();
    SocketCtrl.ins.onDataCmd(CMD.C_PushPreload, onUnityRequest);

  }

  void sendDataTick() {
    if(!isonUnityRequestCome) {
      return;
    }
    streamSubscription?.cancel();
    streamSubscription = Future.delayed(const Duration(seconds: 5)).asStream().listen((event) {
      onUnityRequest(0, null);
    });
  }

  ///
  /// unity请求商品数据
  ///
  void onUnityRequest(int cmd, GeneratedMessage? data) async {
    isonUnityRequestCome = true;
    if(listGoods.isEmpty) {
      return;
    }
    //debugPrint("send size ${listGoods.length}");
    S_PushPreload payLoad = S_PushPreload();
    payLoad.clothIds.addAll(listGoods);
    SocketCtrl.ins.senByteUnity(CMD.S_PushPreload, datas: payLoad.writeToBuffer());
    listGoods.clear();
  }

  void sendItems(int id) {
    //debugPrint("product id = $id");
    if(hasSendGoods.contains(id)) {
      return;
    }
    hasSendGoods.add(id);
    listGoods.add(id);
    // 延时去发送数据
    sendDataTick();
  }

  @override
  Future get api => Api.Shop.categoryList(true);


  @override
  void dispose() {
    super.dispose();
    listGoods.clear();
    hasSendGoods.clear();
    streamSubscription?.cancel();
    isonUnityRequestCome = false;
    SocketCtrl.ins.removeOnDataCmd(CMD.C_PushPreload, onUnityRequest);
  }

  Future getAllCategoryList() async {
    allCategoryList.value = await Api.Shop.categoryList(false);
  }
}
