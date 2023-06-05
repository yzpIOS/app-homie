part of 'event.dart';

class RtcEvent<T extends String?> extends Event {
  final T channel;

  RtcEvent({required this.channel}) : assert(channel != null);
}

class JoinChannelEvent extends RtcEvent {
  JoinChannelEvent({super.channel});
}

class RejoinChannelEvent extends JoinChannelEvent {
  RejoinChannelEvent({super.channel});
}

class TokenExpireEvent extends RtcEvent {
  TokenExpireEvent({super.channel});
}

class TokenWillExpireEvent extends RtcEvent {
  TokenWillExpireEvent({super.channel});
}
