// import 'dart:developer';
library nine_image;

// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_pixels/image_pixels.dart';

///九图处理工具
///
///通过传入.9.png的图，然后通过计算ImagePixels方法获取到所有图片的像素信息，
///通过遍历四周像素坐标系获得拉伸区域和填充区域，即得到自带伸缩的图形展示区域根据child大小拉伸。
///
///[hideLines] defulte = true 表示默认裁切.9的黑边像素.
///
///[imageProvider] 原始.9图片对象， AssetImage("assets/xxx.9.png") 这里最好是一倍图
///                 并且.9图最好设置最小两个像素点，否则会出现识别失败情况
///
///[child] 内容填充区域用于展.9图内容，比如文本，图片等。
///
///参考坐标系
/// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/rect_from_ltrb.png#gh-light-mode-only)
/// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/rect_from_ltwh.png#gh-light-mode-only)
///
/// 注意，这里使用centerSlice之后，显示图片的大小大于原图的情况下才可以使用这个属性，要不然会报错.理由是下面这个源码：
/// assert(sourceSize == inputSize,
/// 'centerSlice was used with a BoxFit that does not guarantee that the image is fully visible.');
class NineImage extends StatelessWidget {
  ///hide lines  in 9 patch image
  final bool hideLines;

  ///image provider  for  example  use AssetImage("assets/orange.9.png")
  final ImageProvider imageProvider;

  /// child widget for example  Text("Hi welcome  ")
  final Widget child;
  const NineImage({
    Key? key,
    required this.imageProvider,
    required this.child,
    this.hideLines = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImagePixels(
        imageProvider: imageProvider,
        builder: (context, img) {
          var leftTop = -1;
          var leftBottom = -1;

          var topLeft = -1;
          var topRight = -1;

          var paddBottomLeft = -1;
          var paddBottomRight = -1;

          var paddRightTop = -1;
          var paddRightBottom = -1;

          if (img.height != null && img.width != null) {
            //遍历全部坐标系，判断是黑色的就显示坐标点
            // for (var y = 0; y < img.height!; y++) {
            //   for (var x = 0; x < img.width!; x++) {
            //     var color = img.pixelColorAt!(x, y);
            //     if (color == Colors.black) {
            //       log("---x$x, y$y-------->");
            //     }
            //   }
            // }

            for (var i = 0; i < img.height!; i++) {
              var color = img.pixelColorAt!(0, i);
              if (color == Colors.black) {
                if (leftTop == -1) {
                  leftTop = i;
                  continue;
                }
                if (leftTop != -1) {
                  leftBottom = i;
                }
              }

              var color2 = img.pixelColorAt!(img.width! - 1, i);
              if (color2 == Colors.black) {
                if (paddRightTop == -1) {
                  paddRightTop = i;
                  continue;
                }
                if (paddRightTop != -1) {
                  paddRightBottom = i;
                }
              }
            }

            for (var i = 0; i < img.width!; i++) {
              var color = img.pixelColorAt!(i, 0);
              if (color == Colors.black) {
                if (topLeft == -1) {
                  topLeft = i;
                  continue;
                }
                if (topLeft != -1) {
                  topRight = i;
                }
              }
              var color2 = img.pixelColorAt!(i, img.height! - 1);
              if (color2 == Colors.black) {
                if (paddBottomLeft == -1) {
                  paddBottomLeft = i;
                  continue;
                }
                if (paddBottomLeft != -1) {
                  paddBottomRight = i;
                }
              }
            }
          } else {
            leftTop = 0;
            leftBottom = 0;
            topLeft = 0;
            topRight = 0;
            paddRightTop = 0;
            paddRightBottom = 0;
            paddBottomLeft = 0;
            paddBottomRight = 0;
          }
          // log("打印坐标系：X($topLeft,$topRight),Y($leftTop,$leftBottom)");
          // log("打印填充坐标系：X($paddBottomLeft,$paddBottomRight),Y($paddRightTop,$paddRightBottom)");
          return ClipPath(
            //裁切黑边
            clipper: BlackLineClipper(hideLines: hideLines),
            child: Container(
              //这里填充默认宽（31+17=48）高（8+7=15）
              padding: getDefulteSize(
                  paddBottomLeft.toDouble(),
                  paddBottomRight.toDouble(),
                  paddRightTop.toDouble(),
                  paddRightBottom.toDouble(),
                  img.width ?? 0.toDouble(),
                  img.height ?? 0.toDouble()),
              // padding: EdgeInsets.fromLTRB(
              //     topLeft.toDouble(),
              //     leftTop.toDouble(),
              //     (img.width ?? 0) - topRight.toDouble(),
              //     (img.height ?? 0) - leftBottom.toDouble()),
              //9图填充背景,背景扩展区域，
              decoration: BoxDecoration(
                  image: DecorationImage(
                    //图片源
                    image: imageProvider,
                    centerSlice: Rect.fromLTRB(
                      topLeft.toDouble() > 0
                          ? topLeft.toDouble()
                          : topRight.toDouble() + 1, //31
                      leftTop.toDouble() > 0
                          ? leftTop.toDouble()
                          : leftBottom.toDouble() + 1, //17
                      topRight.toDouble() > 0
                          ? topRight.toDouble()
                          : topLeft.toDouble() + 1, //32
                      leftBottom.toDouble() > 0
                          ? leftBottom.toDouble()
                          : leftTop.toDouble() + 1,
                    ), //18
                  )),
              child: child,
            ),
          );
        });
  }

  ///判断图片内容填充区域最小范围
  EdgeInsets getDefulteSize(paddBottomLeft, paddBottomRight, paddRightTop,
      paddRightBottom, width, heiget) {
    var left = paddBottomLeft > 0 ? paddBottomLeft : width / 2;
    var top = paddRightTop > 0 ? paddRightTop : heiget / 2;
    var right = ((width ?? 0) - paddBottomRight) > 0
        ? (width ?? 0) - paddBottomRight
        : width / 2;
    var bottom = ((heiget ?? 0) - paddRightBottom) > 0
        ? (heiget ?? 0) - paddRightBottom
        : heiget / 2;

    // log("---宽高情况 P$pWidth,$pHeigth- image-w $width,$heiget------->");
    // log("---left$left-top$top-right$right-bottom$bottom-->");

    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }
}

///操切黑色边框，留下正常显示区域
class BlackLineClipper extends CustomClipper<Path> {
  final bool hideLines;

  BlackLineClipper({required this.hideLines});
  @override
  Path getClip(Size size) {
    final path = Path();
    double x = hideLines ? 2 : 0;
    path.moveTo(x, x);
    path.lineTo(x, size.height - x);
    path.lineTo(size.width - x, size.height - x);
    path.lineTo(size.width - x, x);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BlackLineClipper oldClipper) => true;
}
