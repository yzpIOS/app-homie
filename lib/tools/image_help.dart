import 'dart:io';
import 'dart:ui';

import 'package:app/exception.dart';
import 'package:app/tools.dart' hide Option;
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart';
import 'package:image_editor/image_editor.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart' as isg;

class ImageHelp {
  ImageHelp._();

  static Future<({int width, int height})?> getSize(File file, {Size? orElse}) async {
    try {
      final info = isg.ImageSizeGetter.getSize(FileInput(file));

      return (width: info._width, height: info._height);
    } catch (e, s) {
      errLog(e, s);
    }

    Future<({int width, int height})?> encoded() async {
      final buffer = await ImmutableBuffer.fromFilePath(file.path);

      try {
        final descriptor = await ImageDescriptor.encoded(buffer);

        return (width: descriptor.width, height: descriptor.height);
      } catch (e, s) {
        errLog(e, s);
      } finally {
        buffer.dispose();
      }

      return null;
    }

    return orElse == null || orElse.isEmpty
        ? await asyncTrack('获取图片大小', action: encoded)
        : (width: orElse.width.toInt(), height: orElse.width.toInt());
  }

  static Future<File> edit(File file, {required List<Option> options}) async {
    if (options.isEmpty) return file;

    final option = //
        ImageEditorOption() //
          ..addOptions(options);

    return (await ImageEditor.editFileImageAndGetFile(file: file, imageEditorOption: option))!;
  }

  static Future<File> clip(File file, {Size? size, int minSize = 256, int maxSize = 1080}) async {
    final info = await ImageHelp.getSize(file, orElse: size);

    if (info == null) {
      assert(false, '未处理的业务 -> [图片未压缩]');

      return file;
    }

    final (:width, :height) = info;

    final int _min;
    final bool? isPortrait;

    if (width == height) {
      _min = height;
      isPortrait = null;
    } else if (width > height) {
      _min = height;
      isPortrait = false;
    } else {
      _min = width;
      isPortrait = true;
    }

    if (_min < minSize) throw const LogicException(-1, '图片过小');

    return await ImageHelp.edit(
      file,
      options: [
        if (isPortrait == true)
          ClipOption(x: 0, y: (height - _min) / 2, width: _min, height: _min)
        else if (isPortrait == false)
          ClipOption(x: (width - _min) / 2, y: 0, width: _min, height: _min),
        if (_min > maxSize) ScaleOption(maxSize, maxSize),
      ],
    );
  }

  static Future<String?> blurHash(File file) {
    return execTask1(arg1: file, fun1: _blurHash);
  }

  static String? _blurHash(File file, _) {
    Image? image = decodeImage(file.readAsBytesSync(), frame: 0);

    if (image != null) {
      image = _resized(image, 256);

      return BlurHash.encode(image, numCompX: 2, numCompY: 2).hash;
    }

    return null;
  }

  static Image _resized(Image image, int limit) {
    final width = image.width, height = image.height;

    final int _w, _h;

    if (width > height) {
      if (width <= limit) return image;

      _w = limit;
      _h = (limit * (height / width)).ceil();
    } else {
      if (height <= limit) return image;

      _w = (limit * (width / height)).ceil();
      _h = limit;
    }

    return copyResize(image, width: _w, height: _h);
  }
}

extension on isg.Size {
  int get _width {
    return needRotate ? height : width;
  }

  int get _height {
    return needRotate ? width : height;
  }
}
