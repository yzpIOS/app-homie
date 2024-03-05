import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/widgets/reply_view.dart';
import 'package:flutter/material.dart';

mixin MomentActionMixin<T extends StatefulWidget> on State<T> {
  void doCommentReply(int commentId, {String? replyId}) {
    void doSub(String txt) async {
      if(!(await OAuthCtrl.checkValid())) {
        return;
      }
      simpleSub(
        Api.Moment.commentReply(id: commentId, replyId: replyId, text: txt),
      );
    }

    ReplySheet.show(TextEditingController(), maxLength: ChatTextInputFormatter.chatTextMaxLength,).onType(doSub);
  }

  void doCommentLike(Map data) {
    final comment = data['comment'];
    final commentId = comment['comment_id'];

    final isLike = !data['is_like'];

    simpleSub(
      Api.Moment.commentLike(id: commentId, doLike: isLike),
      callback: () {
        if (mounted) {
          setState(() {
            data['is_like'] = isLike;

            if (isLike) {
              comment['like_count'] += 1;
            } else {
              comment['like_count'] -= 1;
            }
          });
        }
      },
    );
  }

  void doReplyLike(Map data) {
    final commentId = data['reply_comment_id'];

    final isLike = !data['is_like'];

    simpleSub(
      Api.Moment.replyLike(id: commentId, doLike: isLike),
      callback: () {
        if (mounted) {
          setState(() {
            data['is_like'] = isLike;

            if (isLike) {
              data['like_count'] += 1;
            } else {
              data['like_count'] -= 1;
            }
          });
        }
      },
    );
  }
}
