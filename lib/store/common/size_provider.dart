import 'package:app/tools.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class SizeProvider<T> {
  final T _data;

  const SizeProvider._(this._data);

  factory SizeProvider.from(data) {
    if (data is Size) {
      return _SizeProvider._(data) as dynamic;
    } else if (data is Map) {
      return _MediaSizeProvider._(data) as dynamic;
    } else if (data is AssetEntity) {
      return _AssetSizeProvider._(data) as dynamic;
    } else {
      return const SizeProvider._(null) as dynamic;
    }
  }

  Size? sizeOrNull() => null;
}

class _SizeProvider extends SizeProvider<Size> {
  _SizeProvider._(super.data) : super._();

  @override
  Size? sizeOrNull() => _data;
}

class _MediaSizeProvider extends SizeProvider<Map> {
  _MediaSizeProvider._(super.data) : super._();

  @override
  Size? sizeOrNull() {
    final w = _data['width'];
    final h = _data['height'];

    if (w is num && h is num) {
      return Size(w.toDouble(), h.toDouble());
    }

    return null;
  }
}

class _AssetSizeProvider extends SizeProvider<AssetEntity> {
  _AssetSizeProvider._(super.data) : super._();

  @override
  Size? sizeOrNull() {
    try {
      return _data.orientatedSize;
    } catch (e, s) {
      errLog(e, s, message: 'Asset 大小获取失败');
    }

    return null;
  }
}
