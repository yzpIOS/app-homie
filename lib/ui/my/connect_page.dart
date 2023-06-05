import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '联系客服'),
      body: Align(
        alignment: const Alignment(0.0, -0.5),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Box(
            width: 375,
            alignment: Alignment.center,
            child: SizedBox(
              width: 314,
              height: 347,
              child: Material(
                elevation: 6,
                color: Colors.white,
                borderRadius: AppBorderRadius.a10,
                shadowColor: const Color(0x7F000000),
                textStyle: const TextStyle(fontSize: 14, color: Colors.black),
                child: $CardView(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget $CardView() {
    return Column(
      children: [
        const Spacing(flex: 54),
        Image.asset(IMG.$('my/公众号'), width: 174, height: 174, scale: 2, fit: BoxFit.contain),
        const Spacing(flex: 20),
        const XText('请扫码关注Homie公众号'),
        const Spacing(flex: 5),
        const XText('联系客服'),
        const Spacing(flex: 54),
      ],
    );
  }
}
