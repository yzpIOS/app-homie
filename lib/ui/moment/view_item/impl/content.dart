import 'package:app/store/common/hero_provider.dart';
import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/ui/moment/view_item/content.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';

abstract class _ContentView<T extends IMomentDataAdapter> extends ViewAdapter<T>
    implements //
        ITopicView<T>,
        ITxtView<T>,
        IImageView<T>,
        IVideoView<T> {
  _ContentView(super.vm, {super.key});

  final _hero = HeroProvider();

  List<Widget> _media() {
    final video = vm.video;
    final images = vm.images;

    return [
      if (video != null) $video(),
      if (images != null) Provider.value(value: _hero, child: $img()),
    ];
  }

  Widget _txt() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 44),
      child: Builder(
        builder: (context) {
          final style = DefaultTextStyle.of(context).style.copyWith(fontSize: 14, color: Colors.black);

          return XRichText(
            TextSpan(children: [$topic(style), $txt()]),
            maxLines: maxLines,
            style: style,
          );
        },
      ),
    );
  }
}

abstract class MomentContentView$Item<T extends IMomentDataAdapter> extends _ContentView<T> {
  MomentContentView$Item(super.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _txt(),
        Spacing.h10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _media(),
        ),
      ].whereNotNull().toList(growable: false),
    );
  }
}

abstract class MomentContentView$Detail<T extends IMomentDataAdapter> extends _ContentView<T> {
  MomentContentView$Detail(super.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _txt(),
        Spacing.h10,
        ..._media(),
      ].whereNotNull().toList(growable: false),
    );
  }
}
