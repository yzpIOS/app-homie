import 'dart:convert';

import 'package:app/common/theme.dart';
import 'package:app/store/common/size_provider.dart';
import 'package:app/tools.dart';
import 'package:app/ui/common/video_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app/ui/moment/view_item/content.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/ui/moment/view_item/single_attach_view.dart';

mixin MomentVideo<T extends IMomentDataAdapter> implements IVideoView<T> {
  abstract final VideoCreator videoCreator;

  final _ = Rxn();

  @override
  Widget $video() {
    final video = vm.video;

    if (video != null) {
      return Obx(
        () {
          _();

          return videoCreator.singleBuilder(video);
        },
      );
    }

    assert(false, '数据错误');

    return Spacing.blank;
  }
}

abstract class VideoCreator<T> {
  Widget _video(T item);

  Widget _videoBuilder(T item) {
    Widget child = _video(item);

    child = ClipRRect(
      borderRadius: AppBorderRadius.a6,
      child: child,
    );

    return child;
  }

  Widget singleBuilder(T item) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: Get.width * 0.6),
      child: MomentSingleAttachView(
        size: SizeProvider.from(item),
        child: _videoBuilder(item),
      ),
    );
  }
}

//<editor-fold desc="Net">
mixin _NetVideoMixin on VideoCreator<Map> {
  @override
  Widget _video(Map item) {
    final json = item['extra'];

    Map? extra;

    if (json is String && json.isNotEmpty) {
      try {
        extra = jsonDecode(json);
      } catch (e, s) {
        errLog(e, s);
      }
    }

    return OpacityButton(
      onTap: onItemClick(item),
      child: Stack(
        alignment: Alignment.center,
        children: [
          NetImage(item['cover'], fit: BoxFit.cover),
          const PlayIcon(size: 32),
          if (extra != null && extra['dur'] is int)
            Positioned(
              right: 5,
              bottom: 5,
              child: Container(
                height: 15,
                padding: const Pad(horizontal: 4),
                alignment: Alignment.center,
                decoration: const ShapeDecoration(color: Colors.black38, shape: XStadiumBorder()),
                child: XText(
                  Duration(seconds: extra['dur']).format(),
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  VoidCallback? onItemClick(Map item) => null;
}

class VideoCreator$Net extends VideoCreator<Map> with _NetVideoMixin {
  @override
  VoidCallback? onItemClick(item) {
    return () {
      Get.to(() => VideoPage.fromUrl(item['url']));
    };
  }
}

class VideoCreator$Detail extends VideoCreator<Map> with _NetVideoMixin {
  @override
  VoidCallback? onItemClick(item) {
    return () {
      Get.to(() => VideoPage.fromUrl(item['url']));
    };
  }
}
//</editor-fold>
