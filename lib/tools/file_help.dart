import 'dart:io';

import 'package:app/tools.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as PATH; // ignore: library_prefixes
import 'package:path_provider/path_provider.dart';

class FileHelp {
  FileHelp._();

  static const join = PATH.join;

  static const extension = PATH.extension;

  static const setExtension = PATH.setExtension;

  static const basename = PATH.basename;

  static const basenameWithoutExtension = PATH.basenameWithoutExtension;

  static Future<String> temporary = getTemporaryDirectory().then((val) => val.path);
}

extension FileExtension on File {
  Future<String?> lookupMime() async {
    RandomAccessFile? file;

    try {
      file = await open(mode: FileMode.read);

      final header = await file.read(defaultMagicNumbersMaxLength);

      return lookupMimeType(path, headerBytes: header);
    } catch (e, s) {
      errLog(e, s);
    } finally {
      await file?.close();
    }

    return null;
  }
}
