library exception;

class LogicException implements Exception {
  final int code;
  final String msg;

  const LogicException(this.code, this.msg);

  @override
  String toString() {
    return 'LogicException{code: $code, msg: $msg}';
  }
}

class NetException implements Exception {
  final String msg;

  const NetException(this.msg);

  @override
  String toString() => msg;
}

class AuthException implements Exception {
  const AuthException();

  @override
  String toString() => '登录状态失效';
}

class CanceledException implements Exception {
  const CanceledException();
}

class OperationException implements Exception {

  @override
  String toString() {
    return '操作太频繁';
  }
}