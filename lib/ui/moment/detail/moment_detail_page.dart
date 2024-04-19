import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/moment/moment_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/comment/moment_comment_view.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/ui/moment/view_item/impl/export.dart';
import 'package:app/ui/moment/widgets/reply_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MomentDetailPage extends StatefulWidget {
  final MomentDtoAdapter data;

  const MomentDetailPage(this.data, {super.key});

  @override
  State<MomentDetailPage> createState() => _MomentDetailPageState();
}

class _MomentDetailPageState extends State<MomentDetailPage> {
  late final data = widget.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: xAppBar(title: '动态', actions: _actions()),
      body: $BodyView(),
      bottomNavigationBar: ReplyView(
        onTap: () => data.data.doComment(),
      ),
    );
  }

  Widget $BodyView() {
    return CustomScrollView(
      slivers: [
        _DetailView(data),
        const SliverToBoxAdapter(
          child: Divider(height: 10, thickness: 10, color: AppPalette.background2),
        ),
        SliverToBoxAdapter(
          child: $CommentTitleView(),
        ),
        SliverPadding(
          padding: const Pad(bottom: 64),
          sliver: ConfigList(
            config: SliverListConfig(
              divider: Divider(indent: 10, endIndent: 10),
            ),
            child: ConfigListState(
              buildEmptyView: ([arg]) => TipsView(tips: '还没有人给你评论哦~', doRefresh: arg),
              child: MomentCommentView(id: data.dynamicId, desc: true, isManager: OAuthCtrl.isSelf(data.author)),
            ),
          ),
        ),
      ],
    );
  }

  Widget $CommentTitleView() {
    Widget child = const XText(
      '全部评论',
      style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: fw$Medium),
    );

    child = Material(
      color: Colors.white,
      child: Padding(
        padding: const Pad(top: 10, horizontal: 10),
        child: child,
      ),
    );

    return child;
  }

  _actions() {
    if (OAuthCtrl.isSelf(data.author)) {
      return 'ic_menu_2'.toSvgAction(onPressed: () {
        Get.showSheet(['删除']).onNotNull((val) {
          switch (val) {
            case '删除':
              final dynamicId = data.dynamicId;

              Get.alertSub(
                () => Api.Moment.delete(id: dynamicId),
                alert: '确定删除',
                callback: () {
                  DeleteMomentEvent(dynamicId: dynamicId).fire();

                  Get.back();
                },
              );
              break;
          }
        });
      });
    }
  }
}

class _DetailView extends ViewAdapter<MomentDtoAdapter>
    with //
        MomentHeader,
        MomentBottomBar {
  _DetailView(super.vm);

  @override
  final bool isDetail = true;
  @override
  final double avatarSize = 46;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        $header().toSliver(),
        _ContentView(vm).toSliver(
          padding: const Pad(horizontal: 10, top: 10),
        ),
        $bottomBar(),
      ],
    );
  }
}

class _ContentView extends MomentContentView$Detail<MomentDtoAdapter>
    with //
        MomentTopic,
        MomentTxt,
        MomentImage<MomentDtoAdapter>,
        MomentVideo<MomentDtoAdapter> {
  _ContentView(super.vm);

  @override
  late final imageCreator = ImageCreator$Detail();

  @override
  late final videoCreator = VideoCreator$Detail();

  @override
  int? get maxLines => 100;
}
