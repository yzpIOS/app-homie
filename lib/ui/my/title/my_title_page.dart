import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 我的称号
class MyTitlePage extends StatefulWidget {
  const MyTitlePage({super.key});

  @override
  State<MyTitlePage> createState() => _MyTitlePageState();
}

class _MyTitlePageState extends State<MyTitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.colorEB,
      extendBodyBehindAppBar: true,
      appBar: xAppBar(
        title: '我的称号',
        bgColor: AppPalette.appBarForegroundColorDark.withAlpha(0),
      ),
      body: $Body(),
    );
  }

  Widget $Body() {
    return Column(
      children: [
        Box(
          color: AppPalette.transparent,
          height: AppSize.appBar + AppSize.safeTop + 110,
        ),
        Expanded(
          child: Material(
            borderRadius: AppBorderRadius.t10,
            color: Colors.white,
            child: Container(

            ),
          ),
        ),
      ],
    );
  }
}
