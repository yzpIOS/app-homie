import 'package:app/3rd/sentry/sentry.dart';
import 'package:app/tools.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// ignore: implementation_imports
import 'package:flutter_cache_manager/src/compat/file_service_compat.dart';
import 'package:http/http.dart' as http;

class _FileService extends FileService {
  final Dio _dio;
  final String name;

  _FileService(this.name) : _dio = SentryHelp.add(Dio());

  @override
  Future<FileServiceResponse> get(String url, {Map<String, String>? headers = const {}}) {
    xlog(() => '$name -> $url', level: 0, type: LogType.IMG);

    final opt = Options(
      headers: headers,
      responseType: ResponseType.bytes,
    );

    return _dio
        .get(url, options: opt)
        .then((it) => http.Response.bytes(it.data, it.statusCode!))
        .then((it) => CompatFileServiceGetResponse(HttpFileFetcherResponse(it)));
  }
}

class ImgCacheManager extends CacheManager {
  static const _key = 'AppImgCache';

  ImgCacheManager._() : super(Config(_key, fileService: _FileService(_key)));

  static final obj = ImgCacheManager._();
}

class GiftCacheManager extends CacheManager {
  static const _key = 'AppGiftCache';

  GiftCacheManager._() : super(Config(_key, fileService: _FileService(_key)));

  static final obj = GiftCacheManager._();
}

class FileManager extends CacheManager {
  static const _key = 'AppFile';

  FileManager._() : super(Config(_key, fileService: _FileService(_key)));

  static final obj = FileManager._();
}
