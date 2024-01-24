

import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/backpack/v2/base_backpack_state.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class BackPackInActivateView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _BackPackInActivateState();
}

class _BackPackInActivateState extends BaseBackPackState<BackPackInActivateView> {

  @override
  Widget createItem(Map data) {
    return BackPackDataView2(
        selectRx: RxMap(),
        padding: Pad(
            horizontal: 10,
            top: 0,
            bottom: 0
        )
    );
  }

}