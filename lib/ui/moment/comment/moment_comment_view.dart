import 'package:app/event/event.dart';
import 'package:app/net/api.dart';
import 'package:app/tools.dart';
import 'package:app/ui/moment/comment/comment_item_view.dart';
import 'package:app/widgets.dart';

class MomentCommentView extends StatefulWidget {
  final int id;
  final bool isManager;
  final bool? desc;

  MomentCommentView({required this.id, required this.isManager, this.desc}) : super(key: ValueKey(Tuple2(id, desc)));

  @override
  State<MomentCommentView> createState() => _MomentCommentViewState();
}

class _MomentCommentViewState extends SimplePageState<Map, MomentCommentView> with BusStateMixin {
  late final dynamicId = widget.id;
  late final isManager = widget.isManager;

  @override
  void initState() {
    super.initState();

    on<NewMomentCommentEvent>(
      test: (event) => event.dynamicId == dynamicId,
      (event) {
        controller.insertItem(
          0,
          {
            'comment': event.data,
            'is_like': false,
            'created_at': TimeUtils.now(),
          },
        );
      },
    );

    on<DeleteMomentCommentEvent>(
      test: (event) => event.dynamicId == dynamicId,
      (event) {
        final commentId = event.commentId;

        controller.removeOne(
          (data) {
            if (data case {'comment': {'comment_id': var id}}) return id == commentId;

            return false;
          },
        );
      },
    );
  }

  @override
  Future fetchPage(PageNum page) {
    return Api.Moment.commentList(page: page, id: dynamicId, desc: widget.desc);
  }

  @override
  Widget itemBuilder(BuildContext context, Map item, int index) {
    return CommentItemView(data: item, isManager: isManager);
  }
}
