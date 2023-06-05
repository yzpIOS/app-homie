import 'package:app/common/theme.dart';
import 'package:photo_manager/photo_manager.dart';

extension XAssetEntity on AssetEntity {
  //图片选择器缩略图默认为屏幕1/3
  static final thumbSize = ThumbnailSize.square((AppSize.width * AppSize.pixelRatio) ~/ 4);

  AssetEntityImageProvider toProvider([bool isAnime = false]) {
    return AssetEntityImageProvider(
      this,
      isOriginal: isAnime && mimeType == 'image/gif',
      thumbnailSize: thumbSize,
    );
  }

  Future<String> get filePath => file.then((val) => val!.path);

  Future<String> get originPath => originFile.then((val) => val!.path);
}
