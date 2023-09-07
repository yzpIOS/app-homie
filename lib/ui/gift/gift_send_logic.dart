import 'package:app/common/nets/cmds.dart';
import 'package:app/common/nets/commons/proto/ErrorCode.pbenum.dart';
import 'package:app/common/nets/commons/proto/Message.pb.dart';
import 'package:app/common/nets/socket/socket_ctrl.dart';
import 'package:app/common/theme.dart';
import 'package:app/common/utils/en.dart';
import 'package:app/event/event.dart';
import 'package:app/exception.dart';
import 'package:app/model/enum/money_type.dart';
import 'package:app/net/api.dart';
import 'package:app/store/room/my_gift_ctrl.dart';
import 'package:app/store/wallet_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/common/orientation_sheet.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fixnum/fixnum.dart';

enum UseMyGift { enable, disable, only }

abstract class GiftSendLogic {
  final UseMyGift useMyGift;
  final bool isModal;

  GiftSendLogic({required this.useMyGift, this.isModal = false});

  final selectRx = Rxn<Map>();

  Tuple2<SheetOrientation, BoxConstraints> get layout {
    final constraints = BoxConstraints.tightFor(
      width: AppSize.width,
      height: 313 + AppSize.safeBottom,
    );

    return Tuple2(SheetOrientation.bottom, constraints);
  }

  Widget? get $MiddleView => null;

  Future<int> doSend(Map data, int count);

  void onDone(Map data, int total) {
    void doBackpackChange() {
      final giftId = data['id'];

      final _data = Get.find<MyGiftCtrl>().dataRx;
      final item = _data.firstWhereOrNull((it) => giftId == it['id']);

      if (item == null) {
        assert(false, '数据错误 -> $data');
      } else {
        if (item['backpack_count'] > total) {
          item['backpack_count'] -= total;
        } else {
          selectRx.nil();

          _data.remove(item);
        }

        _data.refresh();
      }
    }

    void doMoneyChange() {
      // final type = MoneyType.fromVal(data['currency']);
      // assert(type != null, '数据错误 -> $data');
      //
      // if (type != null) {
      //   final amount = data['price'] * total;
      //
      //   MoneyChangeEvent({type: -amount}).fire();
      // }
      WalletCtrl.ins.doRefresh();
    }

    (data.containsKey('backpack_count') ? doBackpackChange : doMoneyChange).call();
  }
}

class GiftSend2Moment extends GiftSendLogic {
  final int dynamicId;
  final ValueChanged<int>? _onDone;

  GiftSend2Moment(this.dynamicId, [this._onDone]) : super(useMyGift: UseMyGift.disable, isModal: true);

  @override
  Future<int> doSend(Map data, int count) async {
    final type = MoneyType.fromVal(data['currency']);

    assert(type != null, '数据错误 -> $data');

    S_GiveGiftByDynamic? giveGiftByDynamic = await Api.Gift.sendGift2Moment(
      id: dynamicId,
      giftId: data['id'],
      count: count,
      isBackpack: data.containsKey('backpack_count'),
    );

    if(giveGiftByDynamic?.code != ErrorCode.Ok) {
      throw LogicException(giveGiftByDynamic?.code.value ?? -10, "");
    }

    return count;
  }

  @override
  void onDone(Map data, int total) {
    super.onDone(data, total);

    Get.back();

    _onDone?.call(total);
  }
}

class GiftSend2ImUser extends GiftSendLogic {
  final UID uid;

  GiftSend2ImUser(this.uid) : super(useMyGift: UseMyGift.only, isModal: true);

  @override
  Future<int> doSend(Map data, int count) async {
    final type = MoneyType.fromVal(data['currency']);

    assert(type != null, '数据错误 -> $data');

    await Api.Gift.sendGift2ImUser(
      uid: uid,
      giftId: data['id'],
      count: count,
    );

    return count;
  }

  @override
  void onDone(Map data, int total) {
    super.onDone(data, total);

    Get.back();
  }
}

class GiftSend2Room extends GiftSendLogic {
  final int roomId;
  final List<GiftSend2RoomEntity> users;
  final RxList<GiftSend2RoomEntity> userRx;

  GiftSend2Room({required this.roomId, required this.users})
      : userRx = RxList(users),
        super(useMyGift: UseMyGift.enable);

  @override
  Future<int> doSend(Map data, int count) async {
    final type = MoneyType.fromVal(data['currency']);
    final users = userRx.map((it) => it.uid).toList(growable: false);

    if (users.isEmpty) {
      throw LogicException(-1, '请选择礼物赠送对象'.en());
    }

    assert(type != null, '数据错误 -> $data');


    S_GiveGiftByRoom? s_giveGiftByRoom = await Api.Gift.sendGift2Room(
      roomId: roomId,
      uid: users,
      count: count,
      giftId: data['id'],
      isBackpack: data.containsKey('backpack_count'),
    );

    if(s_giveGiftByRoom?.code != ErrorCode.Ok) {
      throw LogicException(s_giveGiftByRoom?.code.value ?? 0, "");
    }

    return count * users.length;
  }

  @override
  Tuple2<SheetOrientation, BoxConstraints> get layout {
    final layout = super.layout;

    switch (Get.orientation) {
      case Orientation.portrait:
        return layout.copyWith(value1: SheetOrientation.bottom);
      case Orientation.landscape:
        return layout.copyWith(value1: SheetOrientation.left);
    }
  }

  @override
  Widget? get $MiddleView {
    Widget $UserView() {
      final _decor = BoxDecoration(
        shape: BoxShape.circle,
        color: AppPalette.barrier,
        border: Border.fromBorderSide(BorderSide(color: Colors.white, width: AppSize.px1)),
      );

      Widget itemBuilder(GiftSend2RoomEntity item) {
        // 分隔线
        if(item.userType == GiftSend2RoomEntity.DIVIDE_TYPE) {
          return Container(
            color: Colors.white,
            width: 1,
            height: 20,
          );
        }

        final onTap = Some(() {
          if (!userRx.remove(item)) userRx.add(item);
        });

        Widget child = Obx(
          () {
            final isSelected = userRx.contains(item);

            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                AsyncAvatar(
                  uid: item.uid,
                  size: 30,
                  onTap: onTap,
                  side: isSelected //
                      ? const BorderSide(width: 1, color: AppPalette.primary, strokeAlign: BorderSide.strokeAlignCenter)
                      : BorderSide.none,
                ),
                if (isSelected)
                  IgnorePointer(
                    child: SvgView(SVG.$('room/选中'), width: 12, height: 12),
                  ),
                if (item.no.isNotEmpty)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    width: 10,
                    height: 10,
                    child: IgnorePointer(
                      child: Container(
                        decoration: _decor,
                        alignment: Alignment.center,
                        child: XText(
                          item.no,
                          textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: false,
                          ),
                          style: const TextStyle(fontSize: 8, color: Colors.white, height: 1),
                        ),
                      ),
                    ),
                  ),

                if(item.userType == 1)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(IMG.format("room/room_owner"), width: 24,height: 11,),
                  ),

                if(item.userType == 2)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(IMG.format("room/room_direct"), width: 24,height: 11,),
                  )
              ],
            );
          },
        );

        child = SizedBox(width: 30, height: 30, child: child);

        return child;
      }

      Widget child = Box(
        padding: const Pad(vertical: 2),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const Pad(left: 10, right: 72),
          itemCount: users.length,
          itemBuilder: (_, i) => itemBuilder(users[i]),
          separatorBuilder: (_, __) => Spacing.w10,
        ),
      );

      return child;
    }

    final child = Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(right: 40, child: $UserView()),
        Positioned(
          top: -1,
          right: -1,
          bottom: -1,
          width: 50,
          child: $SelectAll(),
        ),
      ],
    );

    const _decor = ShapeDecoration(
      shape: XRectangleBorder(
        borderRadius: AppBorderRadius.a6,
        side: BorderSide(color: AppPalette.primary),
      ),
    );

    return Container(
      height: 40,
      decoration: _decor,
      margin: const Pad(horizontal: 10, bottom: 5),
      child: child,
    );
  }

  Widget $SelectAll() {
    void onTap() {
      if (userRx.length == users.length) {
        userRx.clear();
      } else {
        userRx.assignAll(users);
      }
    }

    Widget child = const ClipRRect(
      borderRadius: AppBorderRadius.r6,
      child: Box(
        color: AppPalette.primary,
        alignment: Alignment.center,
        child: XText(
          '全麦',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );

    child = OpacityButton(onTap: onTap, child: child);

    return child;
  }
}

class GiftSend2UserInRoom extends GiftSend2Room {
  GiftSend2UserInRoom({required super.roomId, required UID uid})
      : super(users: [GiftSend2RoomEntity(uid: uid, no: '', userType: 0)]);

  @override
  Widget? get $MiddleView => null;
}

class GiftSend2RoomEntity {
  static const DIVIDE_TYPE = 10000;
  final UID uid;
  // 麦号
  final String no;
  // 用户类型
  final int userType;

  const GiftSend2RoomEntity({required this.uid, required this.no, required this.userType});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiftSend2RoomEntity && runtimeType == other.runtimeType && uid == other.uid && no == other.no && userType == other.userType;

  @override
  int get hashCode => uid.hashCode ^ no.hashCode ^ userType.hashCode;
}
