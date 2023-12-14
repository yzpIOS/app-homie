import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/room_card_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class ScenePage extends StatefulWidget {
  const ScenePage({super.key});

  @override
  State<ScenePage> createState() => _ScenePageState();
}

class _ScenePageState extends State<ScenePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '选择世界'),
      body: _DataView(onSelect: onSelect),
    );
  }

  void onSelect(Map data) => Get.back(result: data);
}

class _DataView extends SimplePageView<Map> {
  final ValueChanged<Map> onSelect;

  _DataView({required this.onSelect});

  @override
  BaseConfig get config {
    return const GridConfig(
      padding: Pad(horizontal: 10, top: 10, bottom: 30),
      gridDelegate: XGridDelegate(
        childAspectRatio: RoomCardView.ratio,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 12,
        fixedHeight: 25,
      ),
    );
  }

  @override
  Future fetchPage(PageNum page) => Api.Scene.list(page: page);

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return OpacityButton(
      onTap: () => onSelect(item),
      child: _ItemView(data: item),
    );
  }
}

class _ItemView extends StatelessWidget {
  final Map data;

  const _ItemView({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoomCardView(image: data['image']),
        XText(
          data['name'],
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
