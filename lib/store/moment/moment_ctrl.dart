import 'package:app/event/event.dart';
import 'package:app/model/api/moment_dto.dart';
import 'package:app/net/api.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/gift/gift_send_logic.dart';
import 'package:app/ui/gift/gift_sheet.dart';
import 'package:app/ui/moment/widgets/reply_view.dart';
import 'package:flutter/widgets.dart';

class MomentCtrl extends GetxController with BusGetLifeMixin {
  final Rx<MomentDto> data;

  MomentCtrl(this.data);

  @override
  void onInit() {
    super.onInit();

    final dynamicId = data().content.id;

    on<DeleteMomentCommentEvent>(
      test: (event) => event.dynamicId == dynamicId,
      (_) {
        data.rebuild(
          (val) => val.copyWith.count(commentCount: val.count.commentCount - 1),
        );
      },
    );
  }
}

extension XRxMomentDto on Rx<MomentDto> {
  int get _id => value.content.id;

  String get _owner => value.content.author;

  MomentMore get _more => value.more;

  void doFollow() {
    simpleSub(
      Api.UserInfo.follow(uid: _owner, doFollow: true),
      callback: () {
        rebuild(
          (val) => val.copyWith.more(isFollow: true),
        );
      },
    );
  }

  void doComment() {
    void doSub(String txt) async {
      if(!(await OAuthCtrl.checkValid())) {
        return;
      }
      simpleSub(
        Api.Moment.comment(id: _id, text: txt),
        callback1: (resp) {
          rebuild(
            (val) => val.copyWith.count(commentCount: val.count.commentCount + 1),
          );

          NewMomentCommentEvent(dynamicId: _id, data: resp).fire();
        },
      );
    }

    ReplySheet.show(TextEditingController(), maxLength: ChatTextInputFormatter.chatTextMaxLength,).onType(doSub);
  }

  void sendGift() {
    final logic = GiftSend2Moment(_id, (it) {
      rebuild(
        (val) {
          var value = val.copyWith.count(giftCount: val.count.giftCount + it);
          return value;
        },
      );
    });

    GiftSheet.show(logic);
  }

  void doLike() {
    final isLike = !_more.isLike;

    simpleTry(
      () async {
        await Api.Moment.like(id: _id, doLike: isLike);

        rebuild((val) {
          final count = val.count.likeCount;

          return val //
              .copyWith
              .more(isLike: isLike)
              .copyWith
              .count(likeCount: isLike ? count + 1 : count - 1);
        });
      },
    );
  }

  void doFav() {
    final isFav = !_more.isCollect;

    simpleTry(
      () async {
        await Api.Moment.fav(id: _id, doFav: isFav);

        rebuild((val) {
          final count = val.count.collectCount;

          return val //
              .copyWith
              .more(isCollect: isFav)
              .copyWith
              .count(collectCount: isFav ? count + 1 : count - 1);
        });
      },
    );
  }
}
