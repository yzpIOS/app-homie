// import 'package:app/common/theme.dart';
// import 'package:app/store/shop_recommend_ctrl.dart';
// import 'package:app/tools.dart';
// import 'package:app/widgets.dart';
//
// import 'shop_view_grid.dart';
// import 'widgets/title_view.dart';
//
// class ShopViewCombo extends GetView<ShopRecommendCtrl> {
//   final ScrollController scroll;
//
//   const ShopViewCombo(this.scroll, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     const delegate = XGridDelegate(
//       crossAxisCount: 3,
//       childAspectRatio: 1,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//       fixedHeight: 22 + 24,
//     );
//
//     final _padding = SliverPadding(padding: Pad(top: AppSize.safeTop));
//
//     final child = Obx(
//       () {
//         final data = controller.autoGet();
//
//         return data.isEmpty
//             ? context.state<DataLoading>()
//             : CustomScrollView(
//                 controller: scroll,
//                 physics: const NeverScrollableScrollPhysics(),
//                 slivers: [
//                   _padding,
//                   ...data.expand((it) {
//                     final title = it['title'];
//                     final items = it['product_list'];
//
//                     return title == null || items == null
//                         ? const []
//                         : [
//                             SliverToBoxAdapter(
//                               child: GroupTitleView(title: title),
//                             ),
//                             ProductViewGrid(
//                               data: items,
//                               delegate: delegate,
//                               padding: const Pad(horizontal: 10, bottom: 20),
//                             ),
//                           ];
//                   }),
//                 ],
//               );
//       },
//     );
//
//     return child;
//   }
// }
