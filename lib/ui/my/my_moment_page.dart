import 'package:app/common/theme.dart';
import 'package:app/ui/moment/my/fav_moment_view.dart';
import 'package:app/ui/moment/my/like_moment_view.dart';
import 'package:app/ui/moment/my/secret_moment_view.dart';
import 'package:app/ui/moment/my/user_moment_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class MyMomentPage extends StatefulWidget {
  const MyMomentPage({super.key});

  @override
  State<MyMomentPage> createState() => _MyMomentPageState();
}

class _MyMomentPageState extends State<MyMomentPage> {
  final data = {
    '动态': UserMomentView(),
    '收藏': FavMomentView(),
    '私密': SecretMomentView(),
    '喜欢': LikeMomentView(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '动态'),
      body: DefaultTabController(
        length: data.length,
        child: Column(
          children: [
            TabBar(
              labelStyle: const TextStyle(fontSize: 16, fontWeight: fw$Medium),
              unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: fw$Regular),
              tabs: data.keys.map((it) => Tab(text: it)).toList(growable: false),
            ),
            Expanded(
              child: TabBarView(
                children: data.values.toList(growable: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
