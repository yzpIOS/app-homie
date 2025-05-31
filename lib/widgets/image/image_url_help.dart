import 'dart:typed_data';

import 'package:app/common/cache_manager.dart';
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

abstract class ImageUrlToProvider {
  const ImageUrlToProvider();

  static final _err = MemoryImage(Uint8List(0));

  ImageProvider toProvider(Either<String, Uri> data) {
    final uri = data.uri;

    if (uri == null) {
      xlog('错误的图片地址 -> [$data]');

      return ImageUrlToProvider._err;
    }

    assert(uri.isScheme('http') || uri.isScheme('https'), '非法图片URL -> [$uri]');

    return _toProvider(uri);
  }

  ImageProvider _toProvider(Uri uri);
}

class ImageToNormal extends ImageUrlToProvider {
  const ImageToNormal();

  @override
  ImageProvider _toProvider(Uri uri) {
    final url = uri.removeFragment().toString();

    return CachedNetworkImageProvider(
      url,
      scale: AppSize.pixelRatio,
      cacheManager: ImgCacheManager.obj,
    );
  }
}

class ImageToWebp extends ImageToNormal {
  const ImageToWebp();

  @override
  ImageProvider _toProvider(Uri uri) {
    return super._toProvider(
      uri.cantOpt ? uri : uri.replace(query: 'imageMogr2/format/webp'),
    );
  }
}

class ImageToThumb extends ImageToNormal {
  const ImageToThumb();

  static final _resize = () {
    final px = (AppSize.pixelRatio * 150).ceil();

    return 'format/webp/rquality/80/thumbnail/${px}x${px}x>';
  }();

  @override
  ImageProvider _toProvider(Uri uri) {
    return super._toProvider(
      uri.cantOpt ? uri : uri.replace(query: 'imageMogr2/$_resize'),
    );
  }
}

extension on Uri {
  bool get cantOpt => !host.endsWith('.homieyy.com') || query.contains('imageMogr2');
}

extension on Either<String, Uri> {
  Uri? get uri {
    return fold((l) => Uri.tryParse(l), (r) => r);
  }
}
