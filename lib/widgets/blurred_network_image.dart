import 'dart:ui';
import 'package:app/widgets/image/network_cache_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BlurredNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double blurSigma;
  final double width;
  final double height;
  const BlurredNetworkImage( {required this.imageUrl,required this.width,required this.height, super.key, this.blurSigma = 5.0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child:NetImage(imageUrl, width: width, height: height, fit: BoxFit.cover),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
          ),
        ),
      ],
    );
  }
}