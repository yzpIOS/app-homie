import 'package:app/common/theme.dart';
import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/common/moment_action_mixin.dart';
import 'package:app/ui/moment/widgets/num_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentItemView extends StatefulWidget {
  final Map data;
  final bool isManager;
  final bool isDetail;

  CommentItemView({required this.data, required this.isManager, this.isDetail = false}) : super(key: ValueKey(data));

  @override
  State<CommentItemView> createState() => _CommentItemViewState();
}

class _CommentItemViewState extends State<CommentItemView> with MomentActionMixin {
  late final Map data = widget.data;
  late final Map comment = data['comment'];
  late final String author = comment['uid'];
  late final bool canManager = widget.isManager || OAuthCtrl.isSelf(author);

  @override
  Widget build(BuildContext context) {
    Widget child = DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 14, color: Colors.black),
      child: XText(
        comment['text'],
        specialTextSpanBuilder: context.watch<SpecialTextSpanBuilder?>(),
      ),
    );

    child = Padding(
      padding: const Pad(vertical: 4, right: 64),
      child: child,
    );

    if (!widget.isDetail) {
      final Iterable? replyList = data['reply_comment_list'];

      if (replyList != null && replyList.isNotEmpty) {
        child = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child,
            //TODO $ReplyView(specialBuilder, replyList),
            Spacing.h4,
          ],
        );
      }

      //TODO child = OpacityButton(onTap: onReply, child: child);
    }

    child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacing.h10,
        UserInfoCtrl.use(
          author,
          builder: (it) {
            return XText(
              it?.showName() ?? '',
              style: const TextStyle(fontSize: 12, color: AppPalette.c6),
            );
          },
        ),
        child,
        XText(
          TimeUtils.fromNow(data['created_at']), //TODO \t回复',
          style: const TextStyle(fontSize: 10, color: AppPalette.c9),
        ),
      ],
    );

    child = Stack(
      children: [
        child,
        Positioned(
          top: 0,
          right: 0,
          child: NumView(
            action: '赞${data['is_like'] == true ? '_1' : ''}',
            num: $NumFormat(comment['like_count']),
            onTap: (_) => doCommentLike(data),
          ),
        ),
      ],
    );

    child = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const Pad(top: 10, right: 10),
          child: AsyncAvatar(uid: author, size: 36),
        ),
        Expanded(child: child),
      ],
    );

    child = Padding(
      padding: const Pad(horizontal: 10, bottom: 10),
      child: child,
    );

    if (canManager) {
      child = DecorButton(
        onLongPress: onMoreAction,
        child: child,
      );
    }

    return child;
  }

  void onMoreAction() {
    Get.showSheet(['删除']).onNotNull((val) {
      switch (val) {
        case '删除':
          final dynamicId = comment['dynamic_id'];
          final commentId = comment['comment_id'];

          Get.alertSub(
            () => Api.Moment.deleteComment(dynamicId: dynamicId, commentId: commentId),
            alert: '确定删除',
            callback: () {
              DeleteMomentCommentEvent(dynamicId: dynamicId, commentId: commentId).fire();
            },
          );
          break;
      }
    });
  }

  // Widget $ReplyView(SpecialTextSpanBuilder? specialBuilder, Iterable replyList) {
  //   Widget _itemBuilder(it) {
  //     final String authorUid = it['author_id'];
  //     final String replyUid = it['reply_uid'];
  //
  //     final replyTxt = specialBuilder.build(text: it['text']);
  //
  //     final ids = <String>{
  //       authorUid,
  //       if (replyUid.isNotEmpty) replyUid,
  //     };
  //
  //     return UserInfoCtrl.useX(
  //       ids,
  //       builder: (it) {
  //         return AppText.rich(
  //           TextSpan(
  //             children: [
  //               TextSpan(
  //                 text: it[authorUid]?.nickName,
  //                 style: const TextStyle(color: AppPalette.primary),
  //               ),
  //               if (replyUid.isNotEmpty) ...[
  //                 const TextSpan(text: ' 回复 '),
  //                 TextSpan(
  //                   text: it[replyUid]?.nickName,
  //                   style: const TextStyle(color: AppPalette.primary),
  //                 ),
  //                 const TextSpan(text: ' '),
  //               ],
  //               const TextSpan(text: '：'),
  //               replyTxt,
  //             ],
  //           ),
  //         );
  //       },
  //     );
  //   }
  //
  //   return Container(
  //     padding: const Pad(horizontal: 10, vertical: 5),
  //     decoration: const ShapeDecoration(color: Color(0x80F5F5F5), borderRadius: AppRadius.r4),
  //     child: DefaultTextStyle(
  //       style: const TextStyle(fontSize: 12, color: Colors.black),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: [
  //           ...replyList.map(_itemBuilder),
  //           $ReplyTotalView(),
  //         ].separator(Spacing.h4).toList(growable: false),
  //       ),
  //     ),
  //   );
  // }

  Widget $ReplyTotalView() {
    return XRichText(
      TextSpan(
        text: '共${data['reply_comment_total']}条回复',
        children: const [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: RightArrowIcon(color: AppPalette.primary),
          ),
        ],
      ),
      style: const TextStyle(color: AppPalette.primary),
    );
  }

// void onReply() async {
//   await XBottomSheet.show(child: CommentDetailSheet(data: data));
//
//   if (mounted) setState(() {});
// }
}
