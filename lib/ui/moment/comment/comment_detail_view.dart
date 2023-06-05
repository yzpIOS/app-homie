// import 'package:app/common/theme.dart';
// import 'package:app/net/api.dart';
// import 'package:app/tools.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
//
// import '../common/moment_action_mixin.dart';
// import '../widgets/reply_view.dart';
// import 'comment_item_view.dart';
// import 'reply_item_view.dart';
//
// class CommentDetailSheet extends ISheetWidget {
//   final Map data;
//
//   CommentDetailSheet({required this.data});
//
//   late final comment = data['comment'];
//
//   final keyRx = Rx(UniqueKey());
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: RefreshIndicator(
//             onRefresh: () => Future(() => keyRx(UniqueKey())),
//             child: CustomScrollView(
//               slivers: [
//                 SliverToBoxAdapter(
//                   child: CommentItemView(data: data, isDetail: true),
//                 ),
//                 const SliverToBoxAdapter(
//                   child: Divider(height: 10, thickness: 10, color: AppPalette.background2),
//                 ),
//                 Obx(
//                   () => _DataView(key: keyRx(), id: comment['comment_id']),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         _ReplyView(data: data),
//       ],
//     );
//   }
//
//   @override
//   Widget get title => const XText('全部回复');
//
//   @override
//   Tuple2<Widget, VoidCallback>? get leading => null;
// }
//
// class _DataView extends SimplePageView<Map> {
//   final int id;
//
//   _DataView({super.key, required this.id});
//
//   @override
//   BaseConfig get config {
//     return const SliverListConfig();
//   }
//
//   @override
//   Future fetchPage(PageNum page) {
//     return Api.Moment.commentReplyList(page: page, id: id);
//   }
//
//   @override
//   Widget itemBuilder(BuildContext context, Map item, int index) {
//     return ReplyItemView(data: item, id: id);
//   }
// }
//
// class _ReplyView extends StatefulWidget {
//   final Map data;
//
//   const _ReplyView({Key? key, required this.data}) : super(key: key);
//
//   @override
//   State<_ReplyView> createState() => _ReplyViewState();
// }
//
// class _ReplyViewState extends State<_ReplyView> with MomentActionMixin {
//   @override
//   Widget build(BuildContext context) {
//     return ReplyView(
//       onTap: () => doCommentReply(widget.data['comment']['comment_id']),
//     );
//   }
// }
