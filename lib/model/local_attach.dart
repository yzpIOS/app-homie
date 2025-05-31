import 'dart:convert';
import 'dart:io';

import 'package:app/3rd/sentry/sentry.dart';
import 'package:app/net/api.dart';
import 'package:app/net/pretty_dio_logger.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:dio/dio.dart';
import 'package:photo_manager/photo_manager.dart';

mixin FileAttachMixin on MediaAttach<File> {
  @override
  late final String? title = FileHelp.basename(asset.path);
  @override
  late final ImageProvider thumb = FileImage(asset);

  @override
  FutureOr<Tuple2<File, String?>> _upFile(Map extras) {
    return Tuple2(asset, null);
  }
}

mixin AssetAttachMixin on MediaAttach<AssetEntity> {
  @override
  late final String? title = asset.title;
  @override
  late final ImageProvider thumb = asset.toProvider();

  @override
  FutureOr<Tuple2<File, String?>> _upFile(Map extras) {
    return asset.file.then((val) => Tuple2(val!, null));
  }
}

mixin UploadMediaAttach<T> {
  static final _dio = SentryHelp.add(Dio())
    ..interceptors.add(
      PrettyDioLogger(
        log: (msg, {required bool isError}) => xlog(msg, level: isError ? 3 : 0, type: LogType.HTTP),
      ),
    );

  Tuple2<String, String?>? _out;

  abstract final int upType;

  FutureOr<Tuple2<File, String?>> _upFile(Map extras);

  Future<Tuple2<String, String?>> upLoad([Map? extras]) async {
    if (_out != null) return _out!;

    final upFile = await _upFile(extras ?? const {});

    final info = await Api.Common.upToken(type: upType);

    final String url = info['url'];
    final String name = info['media_file_name'];

    await _dio.put(
      url,
      data: upFile.value1.openRead(),
      options: Options(contentType: 'application/octet-stream'),
      onSendProgress: (int count, int total) {
        xlog('文件上传[$name] -> ${(count / total * 100).toStringAsFixed(1)}%', level: 0);
      },
    );

    return _out = Tuple2(name, upFile.value2);
  }
}

abstract class LocalAttach<T> {
  final T asset;

  LocalAttach({required this.asset});
}

abstract class MediaAttach<T> extends LocalAttach<T> with UploadMediaAttach<T> {
  MediaAttach({required super.asset});

  String? get title;

  ImageProvider get thumb;
}

abstract class ImageAttach<T> extends MediaAttach<T> {
  ImageAttach({required super.asset});

  @override
  int get upType => 0;
}

class FileImageAttach extends ImageAttach<File> with FileAttachMixin {
  FileImageAttach({required super.asset});

  @override
  FutureOr<Tuple2<File, String?>> _upFile(Map extras) async {
    return Tuple2(asset, extras['blurHash'] == true ? await ImageHelp.blurHash(asset) : null);
  }
}

class AssetImageAttach extends ImageAttach<AssetEntity> with AssetAttachMixin {
  AssetImageAttach({required super.asset});

  @override
  FutureOr<Tuple2<File, String?>> _upFile(Map extras) async {
    final file = (await asset.file)!;

    return Tuple2(file, extras['blurHash'] == true ? await ImageHelp.blurHash(file) : null);
  }
}

class AssetVideoAttach extends MediaAttach<AssetEntity> with AssetAttachMixin {
  AssetVideoAttach({required super.asset});

  @override
  final int upType = 1;

  @override
  FutureOr<Tuple2<File, String?>> _upFile(Map extras) async {
    final file = (await asset.file)!;

    return Tuple2(file, jsonEncode({'dur': asset.duration}));
  }
}
