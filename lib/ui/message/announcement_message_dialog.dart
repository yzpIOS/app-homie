import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class AnnouncementMessageDialog extends StatelessWidget {
  final int? bulletinId;
  final String? message;

  const AnnouncementMessageDialog({super.key, this.bulletinId, this.message});

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(
      padding: const Pad(horizontal: 8, top: 0, bottom: 12),
      child: Stack(
        alignment: Alignment.center,
        children: $Body(),
      ),
    );

    child = DefaultTextStyle(
      style: const TextStyle(fontSize: 12, color: Colors.black),
      child: child,
    );

    child = Container(
      width: 307,
      height: 386,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(IMG.format('msg/公告板')), scale: 3),
      ),
      margin: const Pad(horizontal: 34),
      child: child,
    );

    child = FittedBox(
      fit: BoxFit.contain,
      // alignment: const FractionalOffset(0.5, (224 + 327 / 2) / 812),
      child: child,
    );

    return child;
  }

  List<Positioned> $Body() {
    return [
      Positioned(
        top: 87,
        left: 20,
        right: 20,
        bottom: 52,
        child: SingleChildScrollView(
          child: Text(
            message ?? '',
            style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Regular),
          ),
        ),
      ),
      const Positioned(
        bottom: 20,
        right: 20,
        child: Text(
          'Homie团队',
          style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Regular),
        ),
      ),
    ];
  }
}
