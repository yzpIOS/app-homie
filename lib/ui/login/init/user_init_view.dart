import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class UserInitView extends StatelessWidget {
  final List<Positioned> children;

  const UserInitView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: UiOverlayRegion.light(
        child: Scaffold(
          body: DefaultTextStyle.merge(
            style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: fw$SemiBold),
            child: $BodyView(),
          ),
        ),
      ),
    );
  }

  Widget $BodyView() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        $Bg(),
        ...children,
      ],
    );
  }

  Positioned $Bg() {
    const double w = 656;
    const double h = 378;

    const _decor = ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.elliptical(w, h)),
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFBC7BE6),
          Color(0xFFFEB9E3),
        ],
      ),
    );

    return Positioned(
      top: -(AppSize.safeTop * 2),
      width: w,
      height: h,
      child: const DecoratedBox(decoration: _decor),
    );
  }
}
