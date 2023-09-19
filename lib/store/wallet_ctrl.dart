import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/common/async_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/money_icon.dart';
import 'package:flutter/widgets.dart';

export 'package:app/model/enum/money_type.dart';

class WalletCtrl extends AsyncMapCtrl with BusGetLifeMixin {
  final _rx = Rxn<DateTime>();

  static WalletCtrl get ins {
    return Get.find<WalletCtrl>();
  }

  WalletCtrl({required super.uid}) : super(boxName: 'UserWallet');

  @override
  Future get api => Api.Wallet.myWallet();

  @override
  void onInit() {
    super.onInit();

    on<MoneyChangeEvent>(
      (event) {
        event.data.forEach((k, v) {
          late final String key;

          switch (k) {
            case MoneyType.gold:
              key = 'gold_coins_balance';
              break;
            case MoneyType.diamond:
              key = 'diamond_balance';
              break;
            case MoneyType.homie:
              key = 'homie_balance';
              break;
            default:
              assert(false, '数据错误 -> $k,$v');

              return;
          }

          dataRx[key] = (dataRx[key] ?? 0) + v;

          _rx.value = DateTime.now();
        });
      },
    );

    interval(
      _rx,
      (_) => doRefresh(),
      time: const Duration(seconds: 6),
    );
  }

  static Widget use({required Widget Function(Map<MoneyType, num?> data) builder, bool refresh = false}) {
    final keys = {
      MoneyType.gold: 'gold_coins_balance',
      MoneyType.diamond: 'diamond_balance',
      MoneyType.homie: 'homie_balance',
    };

    return GetX<WalletCtrl>(
      builder: (it) {
        dynamic data = it.autoGet();
        return builder(keys.map((k, v) => MapEntry(k, data[v])));
      },
    );
  }
}
