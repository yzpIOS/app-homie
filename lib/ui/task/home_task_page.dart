import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class HomeTaskPage extends StatefulWidget {
  const HomeTaskPage({super.key});

  @override
  State<HomeTaskPage> createState() => _HomeTaskPageState();
}

class _HomeTaskPageState extends State<HomeTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '任务'),
    );
  }
}
