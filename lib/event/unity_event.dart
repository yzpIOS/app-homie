part of 'event.dart';

class XUnityEvent extends Event {
  final dynamic data;
  final Unity2AppEnum code;

  XUnityEvent({required this.code, this.data});

  late final ext = switch (data) {
    String json when json.isNotEmpty => jsonDecode(json),
    _ => null,
  };

  @override
  String toString() {
    return '$runtimeType{data: $data, code: $code}';
  }
}

class RespUnityEvent extends XUnityEvent {
  final String requestId;

  RespUnityEvent({required this.requestId, required super.code, super.data});

  final _complete = Completer();

  void complete(dynamic data) => _complete.complete(data);

  void doResp(Future<void> Function(String message) doSend) async {
    try {
      final message = <String, dynamic>{
        'responseId': requestId,
        'action': code.name,
        'data': '{}',
      };

      try {
        final data = await _complete.future.timeout(const Duration(seconds: 5));

        message
          ..['data'] = data == null ? '{}' : (data is String ? data : jsonEncode(data))
          ..['code'] = 0;
      } on LogicException catch (e) {
        message
          ..['message'] = e.msg
          ..['code'] = e.code;
      } on TimeoutException catch (e) {
        _complete.completeError(const CanceledException());

        message
          ..['message'] = e.message
          ..['code'] = 408;
      } catch (e) {
        message
          ..['message'] = e.toString()
          ..['code'] = 502;
      }

      final json = jsonEncode(message);

      xlog(() => '回复Unity请求 -> [$requestId] $json', type: LogType.UNITY);

      doSend(json);
    } catch (e, s) {
      errLog(e, s);
    }
  }
}
