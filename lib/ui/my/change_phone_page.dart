import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ChangePhonePage extends StatefulWidget {
  const ChangePhonePage({super.key});

  @override
  State<ChangePhonePage> createState() => _ChangePhonePageState();
}

class _ChangePhonePageState extends State<ChangePhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '手机绑定'),
    );
  }
}
