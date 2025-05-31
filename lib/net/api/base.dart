part of '../api.dart';

abstract class _IApi {
  final String _path;

  const _IApi(this._path);
}

mixin _HttpMixin on _IApi {
  static final _http = Http(baseUrl: '${Env.apiUrl}');

  String _withBasePath(String path) => '$_path/$path';

  Future<dynamic> _doPost(String path, {JMap? ext, data, int tryTimes = 0}) async {
    final _data = await _http.request('POST', _withBasePath(path), ext: ext, data: data ?? const {}, tryTimes: tryTimes);

    return _onResp(path, _data);
  }

  Future<dynamic> _doPost2(String url, {JMap? ext, data}) async {
    final _data = await _http.request('POST', url, ext: ext, data: data ?? const {});

    return _onResp(url, _data);
  }

  Future<dynamic> _doPost3(String path, {JMap? ext, data}) async {
    final _data = await _http.request('POST', _withBasePath(path), ext: ext, data: data ?? const {});

    return _data;
  }

  Future<dynamic> _doPost4(String path, {JMap? ext, data, int tryTimes = 0}) async {
    final _data = await _http.request('POST', _withBasePath(path), ext: ext, data: data ?? const {}, tryTimes: tryTimes);

    return _onResp4(path, _data);
  }

  dynamic _onResp(String path, data) {
    if (data is Map) {
      final int code = data['code'];

      switch (code) {
        case 0:
          return data['data'] ?? data;
        //  return data;
        // case 1:
        //   throw const NetException('服务异常');
        case 17:
          // 如果有正在显示的弹窗，关闭它
          if (Get.isDialogOpen != null && Get.isDialogOpen!) {
            Get.back();
          }
          Get.alertDialog(data['msg'] ?? '服务异常');
          throw NetException(data['msg'] ?? '服务异常');
        default:
          String genMsg() {
            final sb = StringBuffer();

            const width = 8;

            sb.writeln('==== ApiErr ====');

            sb.write('Path'.padRight(width));
            sb.write('-> ');
            sb.writeln(path);

            sb.write('Code'.padRight(width));
            sb.write('-> ');
            sb.writeln(code);

            sb.write('Body'.padRight(width));
            sb.writeln('-> ');
            sb.write(data);

            return sb.toString();
          }

          xlog(genMsg, level: 3, type: LogType.HTTP);

          throw LogicException(code, data['msg'] ?? '数据错误');
      }
    }

    return data;
  }

  dynamic _onResp4(String path, data) {
    if (data is Map) {
      final int code = data['code'];

      switch (code) {
        case 0:
          return data;
      //  return data;
      // case 1:
      //   throw const NetException('服务异常');
        case 17:
        // 如果有正在显示的弹窗，关闭它
          if (Get.isDialogOpen != null && Get.isDialogOpen!) {
            Get.back();
          }
          Get.alertDialog(data['msg'] ?? '服务异常');
          throw NetException(data['msg'] ?? '服务异常');
        default:
          String genMsg() {
            final sb = StringBuffer();

            const width = 8;

            sb.writeln('==== ApiErr ====');

            sb.write('Path'.padRight(width));
            sb.write('-> ');
            sb.writeln(path);

            sb.write('Code'.padRight(width));
            sb.write('-> ');
            sb.writeln(code);

            sb.write('Body'.padRight(width));
            sb.writeln('-> ');
            sb.write(data);

            return sb.toString();
          }

          xlog(genMsg, level: 3, type: LogType.HTTP);

          throw LogicException(code, data['msg'] ?? '数据错误');
      }
    }

    return data;
  }
}

class ApiBase extends _IApi with _HttpMixin {
  const ApiBase(super.path);
}
