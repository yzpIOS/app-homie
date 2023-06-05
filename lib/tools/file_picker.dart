// ignore_for_file: library_private_types_in_public_api

import 'package:app/exception.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

final _imagePicker = ImagePicker();
final _filePicker = FilePicker.platform;

typedef _File = PlatformFile;
typedef _Asset = AssetEntity;

typedef OnResult<T> = ValueChanged<List<T>>;

Future<List<_File>?> _basePicker({OnResult<_File>? okCall, required FileType type, bool? multiple}) async {
  final result = await _filePicker.pickFiles(allowCompression: false, type: type, allowMultiple: multiple ?? true);

  if (result != null && isNotEmpty(result.files)) {
    okCall?.call(result.files);
  }

  return result?.files;
}

Future<List<_Asset>?> assetPicker({
  OnResult<_Asset>? okCall,
  required RequestType type,
  required int max,
  List<_Asset>? selected,
}) async {
  switch (await PhotoManager.requestPermissionExtend()) {
    case PermissionState.limited:
    case PermissionState.authorized:
      final result = await AssetPicker.pickAssets(
        Get.context!,
        pickerConfig: AssetPickerConfig(
          maxAssets: max,
          requestType: type,
          selectedAssets: selected,
          gridThumbnailSize: XAssetEntity.thumbSize,
        ),
      );

      if (result != null) okCall?.call(result);

      return result;
    default:
      showToast('授权失败');

      throw const CanceledException();
  }
}

Future<List<_Asset>?> imagePicker({OnResult<_Asset>? okCall, required int max, List<_Asset>? selected}) {
  return assetPicker(okCall: okCall, type: RequestType.image, max: max, selected: selected);
}

Future<List<_Asset>?> videoPicker({OnResult<_Asset>? okCall, required int max, List<_Asset>? selected}) {
  return assetPicker(okCall: okCall, type: RequestType.video, max: max, selected: selected);
}

Future<List<_Asset>?> audioPicker({OnResult<_Asset>? okCall, required int max, List<_Asset>? selected}) {
  return assetPicker(okCall: okCall, type: RequestType.audio, max: max, selected: selected);
}

Future<List<_Asset>?> mediaPicker({OnResult<_Asset>? okCall, required int max, List<_Asset>? selected}) {
  return assetPicker(okCall: okCall, type: RequestType.common, max: max, selected: selected);
}

Future<List<_File>?> filePicker({OnResult<_File>? okCall, bool? multiple}) {
  return _basePicker(okCall: okCall, multiple: multiple, type: FileType.any);
}

Future<XFile?> cameraPicker({ValueChanged<XFile>? okCall, double? max = 1080}) async {
  final result = await _imagePicker.pickImage(
    maxWidth: max,
    maxHeight: max,
    imageQuality: 90,
    source: ImageSource.camera,
  );

  if (result != null) {
    okCall?.call(result);

    return result;
  }

  return result;
}
