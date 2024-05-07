import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// 公会中心列表控制器
class GuildCenterListController extends GetxController {
  final textController = TextEditingController();
  final keywordRx = RxnString();
  final ScrollController scrollController = ScrollController();
  final List dataList = ['','','','','',''].obs;

  @override
  OnInit(){
    super.onInit();
    // dataList.addAll(['','','']);
    // update();
  }
}