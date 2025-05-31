import 'dart:async';

import 'package:app/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PicItem extends StatelessWidget {
  final double width;
  final double height;
  final String url;
  final Widget? placeholder;
  final ImageWidgetBuilder? imageBuilder;
  final bool autoSize;
  final double scale;

  PicItem(
    this.url, {super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.placeholder,
    this.imageBuilder,
    this.autoSize = false,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    if (autoSize == true) {
      Completer<Size> comp = Completer();
      Image image = Image(image: CachedNetworkImageProvider(url));
      image.image.resolve(ImageConfiguration()).addListener(
        ImageStreamListener(
          (ImageInfo image, bool synchronousCall) {
            var myImage = image.image;
            Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
            comp.complete(size);
          },
        ),
      );
      return FutureBuilder<Size>(
        future: comp.future,
        builder: (context, snapshot) {
          return _imageWidget(
              snapshot.data?.width ?? width, snapshot.data?.height ?? height);
        },
      );
    } else {
      return _imageWidget(width, height);
    }
  }

  Widget _imageWidget(double imageWidth, double imageHeight) {
    return CachedNetworkImage(
      imageBuilder: imageBuilder,
      placeholder: (context, url) => placeholder ?? Container(color: AppPalette.background2,),
      imageUrl: url,
      width: imageWidth / scale,
      height: imageHeight / scale,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return Container(
          color: AppPalette.background2,
          alignment: Alignment.center,
          width: width / scale,
          height: height / scale,
        );
      },
    );
  }
}
