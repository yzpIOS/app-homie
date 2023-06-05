// import 'package:app/net/api.dart';
// import 'package:app/widgets.dart';
//
// import 'moment_view.dart';
//
// class FollowMomentView extends StatelessWidget {
//   const FollowMomentView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Widget header = _FriendView();
//
//     // header = Material(
//     //   color: Colors.white,
//     //   child: SizedBox(height: 94, child: header),
//     // );
//
//     return CustomScrollView(
//       slivers: [
//         // SliverPadding(
//         //   padding: const Pad(bottom: 10),
//         //   sliver: SliverToBoxAdapter(child: header),
//         // ),
//         ConfigList(
//           config: const SliverListConfig(
//             divider: Spacing.h10,
//             padding: Pad(bottom: 64),
//           ),
//           child: MomentView(api: (page) => Api.Moment.followList(page: page)),
//         ),
//       ],
//     );
//   }
// }
//
// // class _FriendView extends SimpleDataView<Map> {
// //   @override
// //   Future fetch() {
// //     return Future.value(List.generate(8, (index) => {}));
// //   }
// //
// //   @override
// //   BaseConfig get config {
// //     return const ListConfig(
// //       padding: Pad(horizontal: 10, top: 10, bottom: 8),
// //       divider: Spacing.w10,
// //       scrollDirection: Axis.horizontal,
// //     );
// //   }
// //
// //   @override
// //   Widget itemBuilder(BuildContext context, Map item, int index) {
// //     return XUserView(data: item);
// //   }
// // }
