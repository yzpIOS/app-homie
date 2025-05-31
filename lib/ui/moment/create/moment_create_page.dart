import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/model/local_attach.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/topic/topic_select_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MomentCreatePage extends StatefulWidget {
  final Map? topic;

  const MomentCreatePage({super.key, this.topic});

  @override
  State<MomentCreatePage> createState() => _MomentCreatePageState();
}

class _MomentCreatePageState extends State<MomentCreatePage> {
  final controller = TextEditingController();

  late final imageRx = RxList<MediaAttach>();
  late final videoRx = Rxn<MediaAttach>();
  late final scopeRx = Rx(SCOPE[0]);
  late final topicRx = Rxn<Map>(widget.topic);

  // ignore: constant_identifier_names
  static const SCOPE = [
    Tuple2(0, '公开·所有人可见'),
    // Tuple2(2, '公开·对朋友可见'),
    // Tuple2(3, '公开·对粉丝可见'),
    Tuple2(1, '私密·仅自己可见'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '发布动态'),
      body: $BodyView(),
      bottomNavigationBar: $Bnb(),
    );
  }

  Widget $BodyView() {
    return SingleChildScrollView(
      padding: const Pad(horizontal: 10, top: 10, bottom: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            minLines: 2,
            maxLines: 10,
            controller: controller,
            decoration: const InputDecoration(
              hintText: '输入文字...',
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          Padding(
            padding: const Pad(top: 60),
            child: _MediaView(imageRx: imageRx, videoRx: videoRx, max: 9),
          ),
          Box(
            height: 44,
            child: Row(
              children: [
                $TopicView(),
              ],
            ),
          ),
          const Divider(),
          Obx(
            () {
              final scope = scopeRx().value2;

              return $SettingItem(
                icon: 'moment/可见状态_${scope.split('·')[0]}',
                title: scope,
                onTap: () {
                  Get.showSheet(SCOPE, toTitle: (it) => Tuple2(it.value2, null)) //
                      .onNotNull(scopeRx);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget $TopicView() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48),
      child: Obx(() {
        final topic = topicRx();

        return XTextBtn(
          label: '#${topic?['name'] ?? '话题'}',
          height: AppSize.btnTiny,
          padding: const Pad(horizontal: 6),
          color: const Color(0xFFF5F5F5),
          textStyle: const TextStyle(fontSize: 12, color: AppPalette.c6),
          onTap: () => Get.to(() => const TopicSelectPage())!.onType<Map>(topicRx),
        );
      }),
    );
  }

  Widget $Bnb() {
    return SafeArea(
      minimum: AppSize.safeAreaMini,
      child: Box(
        padding: const Pad(horizontal: 36, top: 10, bottom: 30),
        child: XTextBtn(
          label: '发布',
          shape: AppShape.a4,
          textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: fw$Medium),
          onTap: doSub,
        ),
      ),
    );
  }

  Widget $SettingItem({required String icon, required String title, VoidCallback? onTap}) {
    Widget child = Row(
      children: [
        SvgView(SVG.$(icon), width: 24, height: 24),
        Spacing.w4,
        Expanded(child: XText(title)),
        const RightArrowIcon(),
      ],
    );

    child = SizedBox(height: 50, child: child);

    child = InkWell(onTap: onTap, child: child);

    child = Material(
      type: MaterialType.transparency,
      textStyle: const TextStyle(fontSize: 14, color: Colors.black),
      child: child,
    );

    return child;
  }

  void doSub() {
    final text = controller.text.trim();

    if (text.isEmpty) {
      showToast('请输入动态内容');

      return;
    }

    if (imageRx.isEmpty && videoRx.isNull()) {
      showToast('请至少选择一张图片或者视频');

      return;
    }

    Future<List<int>> upAttach() {
      Future<int> doUpload(UploadMediaAttach item) async {
        final data = await Api.Common.addMedia(attach: item);

        return data.value1;
      }

      final image = imageRx();
      final video = videoRx();

      if (image.isNotEmpty) {
        return Future.wait(image.map(doUpload));
      } else if (video != null) {
        return Future.wait([doUpload(video)]);
      } else {
        assert(false);

        return Future.value([]);
      }
    }

    Future api() async {
      final ids = await upAttach();

      await Api.Moment.create(text: text, scope: scopeRx().value1, medias: ids, topicId: topicRx()?['id']);
    }

    simpleSub(
      api,
      msg: '发布成功',
      callback: () {
        const MomentRefreshEvent().fire();

        Get.back();
      },
    );
  }
}

class _MediaView extends StatelessWidget {
  final RxList<MediaAttach> imageRx;
  final Rxn<MediaAttach> videoRx;

  final int max;

  const _MediaView({required this.imageRx, required this.videoRx, required this.max});

  @override
  Widget build(BuildContext context) {
    return Box(
      width: Get.width * ((375 - 115) / 375),
      alignment: Alignment.centerLeft,
      child: Obx(() {
        final image = imageRx();
        final video = videoRx();

        if (video == null) {
          return $ImageGallery(image);
        } else {
          return $VideoView(video);
        }
      }),
    );
  }

  Widget $VideoView(MediaAttach it) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final size = (constraints.maxWidth / 3) - 8;

        return SizedBox(
          width: size,
          height: size,
          child: ImageSelectView.$ItemWrap(
            child: Image(image: it.thumb, width: size, height: size, fit: BoxFit.cover),
            icon: PlayIcon(size: size * 0.4),
            onDel: videoRx.nil,
          ),
        );
      },
    );
  }

  Widget $ImageGallery(List<MediaAttach> items) {
    Widget _itemBuilder(MediaAttach data) {
      return LayoutBuilder(
        key: ValueKey(data),
        builder: (BuildContext context, BoxConstraints constraints) {
          final maxW = constraints.maxWidth;

          return ImageSelectView.$ItemWrap(
            child: Image(image: data.thumb, width: maxW, height: maxW, fit: BoxFit.cover),
            onDel: () => imageRx.remove(data),
          );
        },
      );
    }

    return GridLayout(
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: [
        ...items.map(_itemBuilder),
        if (items.length < max) ImageSelectView.$AddView(_mediaAdd(items)),
      ],
    );
  }

  VoidCallback _mediaAdd(List<MediaAttach> items) {
    final onlyImage = items.isNotEmpty;

    return () {
      final selected = //
          onlyImage //
              ? items.map((it) => it.asset).whereType<AssetEntity>().toList(growable: false)
              : null;

      final type = onlyImage ? RequestType.image : RequestType.common;

      assetPicker(
        max: max,
        type: type,
        selected: selected,
        okCall: (it) {
          if (onlyImage) {
            imageRx.assignAll(it.map((it) => AssetImageAttach(asset: it)));
          } else {
            final group = it.groupListsBy((it) => it.type);

            final images = group[AssetType.image];
            final videos = group[AssetType.video];

            if (images != null) {
              imageRx.assignAll(images.map((it) => AssetImageAttach(asset: it)));

              if (videos != null) {
                showToast('忽略视频 ${videos.length} 个');
              }
            } else if (videos != null) {
              videoRx(AssetVideoAttach(asset: videos.first));

              if (videos.length > 1) {
                showToast('忽略视频 ${videos.length - 1} 个');
              }
            }
          }
        },
      );
    };
  }
}
