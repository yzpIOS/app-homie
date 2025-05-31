
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter/material.dart';
import '../delegates/asset_picker_text_delegate.dart';
import '../constants/constants.dart';
import '../internal/singleton.dart';
import 'scale_text.dart';
import 'dart:typed_data' as typed_data;

class TestWidget extends StatefulWidget {
  int index;
  AssetEntity asset;

  ThemeData themeData;

  TestWidget(this.index, this.asset, this.themeData);

  @override
  _TestWidget createState() => _TestWidget();
}

class _TestWidget extends State<TestWidget> {

  typed_data.Uint8List? imageThumbData;
  @override
  void initState() {
    super.initState();
    widget.asset.thumbnailDataWithSize(ThumbnailSize(100, 100)).then((value) {
      imageThumbData = value;
      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {

    SpecialImageType? type;


    final AssetEntityImageProvider imageProvider = AssetEntityImageProvider(
      widget.asset,
      isOriginal: false,
      thumbnailSize: defaultAssetGridPreviewSize,
    );
    if (imageProvider.imageFileType == ImageFileType.gif) {
      type = SpecialImageType.gif;
    } else if (imageProvider.imageFileType == ImageFileType.heic) {
      type = SpecialImageType.heic;
    }

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: imageThumbData == null ? SizedBox() : Image.memory(imageThumbData!, fit: BoxFit.cover,),
        ),
        if (type == SpecialImageType.gif) // 如果为GIF则显示标识
          gifIndicator(context, widget.asset),
        if (widget.asset.type == AssetType.video) // 如果为视频则显示标识
          videoIndicator(context, widget.asset),
      ],
    );
  }


  /// GIF image type indicator.
  /// GIF 类型图片指示
  Widget gifIndicator(BuildContext context, AssetEntity asset) {
    return PositionedDirectional(
      start: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.bottomCenter,
            end: AlignmentDirectional.topCenter,
            colors: <Color>[widget.themeData.dividerColor, Colors.transparent],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),),
          child: ScaleText(
            Singleton.textDelegate.gifIndicator,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            semanticsLabel: Singleton.textDelegate.semanticsTextDelegate.gifIndicator,
            strutStyle: const StrutStyle(forceStrutHeight: true, height: 1),
          ),
        ),
      ),
    );
  }


  /// Videos often contains various of color in the cover,
  /// so in order to keep the content visible in most cases,
  /// the color of the indicator has been set to [Colors.white].
  ///
  /// 视频封面通常包含各种颜色，为了保证内容在一般情况下可见，此处
  /// 将指示器的图标和文字设置为 [Colors.white]。
  Widget videoIndicator(BuildContext context, AssetEntity asset) {
    return PositionedDirectional(
      start: 0,
      end: 0,
      bottom: 0,
      child: Container(
        width: double.maxFinite,
        height: 26,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.bottomCenter,
            end: AlignmentDirectional.topCenter,
            colors: <Color>[widget.themeData.dividerColor, Colors.transparent],
          ),
        ),
        child: Row(
          children: <Widget>[
            const Icon(Icons.videocam, size: 22, color: Colors.white),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: ScaleText(
                  Singleton.textDelegate.durationIndicatorBuilder(
                    Duration(seconds: asset.duration),
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  strutStyle: const StrutStyle(
                    forceStrutHeight: true,
                    height: 1.4,
                  ),
                  maxLines: 1,
                  maxScaleFactor: 1.2,
                  semanticsLabel:
                  Singleton.textDelegate.semanticsTextDelegate.durationIndicatorBuilder(
                    Duration(seconds: asset.duration),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}