import 'package:app/common/theme.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/tools/special_text.dart';
import 'package:app/ui/moment/common/moment_action_mixin.dart';
import 'package:app/ui/moment/widgets/num_view.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReplyItemView extends StatefulWidget {
  final Map data;
  final int id;

  const ReplyItemView({super.key, required this.data, required this.id});

  @override
  State<ReplyItemView> createState() => _ReplyItemViewState();
}

class _ReplyItemViewState extends State<ReplyItemView> with MomentActionMixin {
  late final Map data = widget.data;
  late final String authorUid = data['author_id'];
  late final String replyUid = data['reply_uid'];

  @override
  Widget build(BuildContext context) {
    final replyTxt = context.watch<SpecialTextSpanBuilder?>().build(text: data['text']);

    final ids = {
      authorUid,
      if (replyUid.isNotEmpty) replyUid,
    };

    return Padding(
      padding: const Pad(horizontal: 10, bottom: 10),
      child: UserInfoCtrl.useX(
        ids,
        builder: (it) {
          Widget child = XRichText(
            TextSpan(
              children: [
                if (replyUid.isNotEmpty) ...[
                  const TextSpan(text: '回复 '),
                  TextSpan(
                    text: it[replyUid]?.showName,
                    style: const TextStyle(color: AppPalette.primary),
                  ),
                  const TextSpan(text: ' '),
                ],
                replyTxt,
              ],
            ),
            style: const TextStyle(fontSize: 14, color: Colors.black),
          );

          child = OpacityButton(
            onTap: () => doCommentReply(widget.id, replyId: data['reply_comment_id']),
            child: child,
          );

          child = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.h10,
              XText(
                it[authorUid]?.showName ?? '',
                style: const TextStyle(fontSize: 12, color: AppPalette.c6),
              ),
              Spacing.h4,
              Padding(
                padding: const Pad(right: 64),
                child: child,
              ),
              Spacing.h4,
              XText(
                '${TimeUtils.fromNow(data['created_at'])}\t回复',
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
                  num: $NumFormat(data['like_count']),
                  onTap: (_) => doReplyLike(data),
                ),
              ),
            ],
          );

          child = Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const Pad(top: 10, right: 10),
                child: AsyncAvatar(uid: authorUid, size: 36),
              ),
              Expanded(child: child),
            ],
          );

          return child;
        },
      ),
    );
  }
}
