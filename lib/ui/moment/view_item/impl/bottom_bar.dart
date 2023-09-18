import 'package:app/store/moment/moment_ctrl.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/view_item/bottom_bar.dart';
import 'package:app/ui/moment/view_item/data_adapter.dart';
import 'package:app/ui/moment/widgets/num_view.dart';
import 'package:app/widgets.dart';

mixin MomentBottomBar implements IBottomBar<MomentDtoAdapter> {
  bool get isDetail => false;

  @override
  Widget $bottomBar() {
    return Box(
      height: 44,
      padding: const Pad(horizontal: 20),
      child: Obx(
        () {
          final more = vm.more;
          final count = vm.count;
          final isSelf = OAuthCtrl.isSelf(vm.author);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isSelf)
                NumView(
                  action: '礼物',
                  num: $NumFormat(count.giftCount),
                  onTap: onItemClick,
                ),
              ...<Widget>[
                NumView(
                  action: '收藏${more.isCollect == true ? '_1' : ''}',
                  num: $NumFormat(count.collectCount),
                  onTap: onItemClick,
                ),
                NumView(
                  action: '赞${more.isLike == true ? '_1' : ''}',
                  num: $NumFormat(count.likeCount),
                  onTap: onItemClick,
                ),
                IgnorePointer(
                  ignoring: !isDetail,
                  child: NumView(
                    action: '评论',
                    num: $NumFormat(count.commentCount),
                    onTap: onItemClick,
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  void onItemClick(String action) {
    switch (action) {
      case '礼物':
        vm.data.sendGift();
        break;
      case '评论':
        vm.data.doComment();
        break;
      case '收藏':
      case '收藏_1':
        vm.data.doFav();
        break;
      case '赞':
      case '赞_1':
        vm.data.doLike();
        break;
    }
  }
}
