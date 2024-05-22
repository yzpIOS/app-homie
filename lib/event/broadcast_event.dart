part of 'event.dart';

class BroadcastEvent<T> extends Event {
  final T data;

  const BroadcastEvent(this.data);
}

class SuperGiftEvent extends BroadcastEvent<S_FloatingScreen> {
  String? blinkName;
  String? blinkUrl;
  SuperGiftEvent(super.data, {this.blinkName = "", this.blinkUrl = ""});
}

class LevelUpdateEvent extends BroadcastEvent<S_UpdateLevel_All> {
  LevelUpdateEvent(super.data);
}


