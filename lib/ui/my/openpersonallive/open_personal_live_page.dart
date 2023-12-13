import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class OpenPersonalLivePage extends StatefulWidget {
  const OpenPersonalLivePage({super.key});

  @override
  State<OpenPersonalLivePage> createState() => _OpenPersonalLivePageState();
}

class _OpenPersonalLivePageState extends State<OpenPersonalLivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '开直播',),
      body: CustomScrollView(
        slivers: [],
      ),
    );
  }
}
