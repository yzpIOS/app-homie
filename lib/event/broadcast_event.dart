part of 'event.dart';

class BroadcastEvent<T> extends Event {
  final T data;

  const BroadcastEvent(this.data);
}

class SuperGiftEvent extends BroadcastEvent<Map> {
  SuperGiftEvent(super.data);
}
