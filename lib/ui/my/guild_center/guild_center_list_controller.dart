
import 'package:app/ui/common/unity_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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