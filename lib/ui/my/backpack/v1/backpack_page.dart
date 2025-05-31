import 'package:app/ui/my/backpack/v1/backpack_view_gift.dart';
import 'package:app/ui/my/backpack/v1/backpack_view_wardrobe.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class BackpackPage extends StatefulWidget {
  const BackpackPage({super.key});

  @override
  State<BackpackPage> createState() => _BackpackPageState();
}

class _BackpackPageState extends State<BackpackPage> {
  final tabs = const {
    '衣柜': BackpackView$Wardrobe(),
    '礼物': BackpackView$Gift(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackpackView$Gift(),
    );
  }
}
