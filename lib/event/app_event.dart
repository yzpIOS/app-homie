part of 'event.dart';

class MoneyChangeEvent extends Event {
  final Map<MoneyType, num> data;

  const MoneyChangeEvent(this.data);
}

class NewMomentCommentEvent extends Event {
  final int dynamicId;
  final Map data;

  const NewMomentCommentEvent({required this.dynamicId, required this.data});
}

class DeleteMomentCommentEvent extends Event {
  final int dynamicId;
  final int commentId;

  const DeleteMomentCommentEvent({required this.dynamicId, required this.commentId});
}

class DeleteMomentEvent extends Event {
  final int dynamicId;

  const DeleteMomentEvent({required this.dynamicId});
}

class GoDressUpEvent extends Event {
  const GoDressUpEvent();
}

class HotBroadcastEvent extends Event {
  const HotBroadcastEvent();
}

class MomentPageEvent extends Event {
  const MomentPageEvent();
}


class HomeShopPageEvent extends Event {
  const HomeShopPageEvent();
}

class ShowRedDotListEvent extends Event {
  final List? dataList;

  ShowRedDotListEvent([this.dataList]);
}

class ShowRedDotListGrowpEvent extends Event {
  final List? dataList;

  ShowRedDotListGrowpEvent([this.dataList]);
}


class GoComment extends Event {
  const GoComment();
}

class GoWardrobeEvent extends Event {
  const GoWardrobeEvent();
}

class ShoppingCartDelEvent extends Event {
  final int productId;

  const ShoppingCartDelEvent({required this.productId});

  @override
  String toString() {
    return 'ShoppingCartDelEvent{productId: $productId}';
  }
}

class SwitchRoomEvent extends Event {
  const SwitchRoomEvent();
}

class UserBlackEvent extends Event {
  UID userId;

  UserBlackEvent({required this.userId});
}

class HandleGuildAnchorApplyEvent extends Event {
  const HandleGuildAnchorApplyEvent();
}

class AgreeGuildAnchorApplyEvent extends Event {
  const AgreeGuildAnchorApplyEvent();
}