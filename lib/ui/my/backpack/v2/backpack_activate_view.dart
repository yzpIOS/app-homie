

import 'package:app/common/theme.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/backpack/v2/base_backpack_state.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class BackPackActivateView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _BackPackActivateState();
}

class _BackPackActivateState extends BaseBackPackState<BackPackActivateView> {

  _BackPackActivateState():super([]);

  @override
  Widget createTabView(Map data) {
    return BackPackDataView2(
      api: Api.DressUp.backpackList,
      category: data,
      padding: Pad(
        horizontal: 10,
        top: 0,
        bottom: 0
      ),
      selectRx: selectRx,
    );
  }
}