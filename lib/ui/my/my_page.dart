// import 'package:app/common/theme.dart';
// import 'package:app/model/api/my_info_dto.dart';
// import 'package:app/store/user/my_info_ctrl.dart';
// import 'package:app/tools.dart';
// import 'package:app/ui/my/friend/friend_page.dart';
// import 'package:app/ui/my/personal_page.dart';
// import 'package:app/widgets.dart';
// import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
// import 'package:flutter/material.dart';
//
// import '../moment/my/fav_moment_view.dart';
// import '../moment/my/like_moment_view.dart';
// import '../moment/my/secret_moment_view.dart';
// import '../moment/my/user_moment_view.dart';
//
// class MyPage extends StatefulWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   @override
//   State<MyPage> createState() => _MyPageState();
// }
//
// class _MyPageState extends State<MyPage> {
//   static const double _tabHeight = 32;
//   static const double _expHeight = _tabHeight + 350;
//
//   late final collapsedRx = RxBool(false);
//   late final canPop = Navigator.of(context).canPop();
//
//   final data = {
//     '动态': UserMomentView(),
//     '收藏': FavMomentView(),
//     '私密': SecretMomentView(),
//     '喜欢': LikeMomentView(),
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DefaultTabController(
//         length: data.length,
//         child: ExtendedNestedScrollView(
//           pinnedHeaderSliverHeightBuilder: () => _tabHeight + AppSize.appBar + AppSize.safeTop,
//           headerSliverBuilder: (_, __) => [$AppBar()],
//           body: TabBarView(
//             children: data.values.toList(growable: false),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget $AppBar() {
//     final tabBar = $TabBar();
//
//     final height = AppSize.appBar + AppSize.safeTop + tabBar.preferredSize.height;
//
//     return SliverAppBar(
//       backgroundColor: Colors.white,
//       toolbarHeight: AppSize.appBar,
//       expandedHeight: _expHeight,
//       pinned: true,
//       bottom: tabBar,
//       actions: _actions(),
//       leading: Obx(
//         () => collapsedRx()
//             ? Padding(
//                 padding: const Pad(left: 16),
//                 child: MyInfoCtrl.use(
//                   builder: (it) => AvatarView(it.avatar, size: 32),
//                 ),
//               )
//             : Spacing.blank,
//       ),
//       flexibleSpace: LayoutBuilder(
//         builder: (_, constraints) {
//           final collapsed = constraints.maxHeight <= height;
//
//           post(() => collapsedRx(collapsed));
//
//           return const FlexibleSpaceBar(
//             background: Padding(
//               padding: Pad(bottom: _tabHeight),
//               child: _InfoView(),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   PreferredSizeWidget $TabBar() {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(_tabHeight),
//       child: Material(
//         color: Colors.white,
//         child: TabBar(
//           tabs: data.keys //
//               .map((it) => Tab(text: it, height: _tabHeight))
//               .toList(growable: false),
//         ),
//       ),
//     );
//   }
//
//   _actions() {
//     return [
//       Obx(
//         () => 'ic_my'.toSvgAction(
//           color: collapsedRx() ? Colors.black : Colors.white,
//           onPressed: () {
//             //TODO
//           },
//         ),
//       ),
//       Obx(
//         () => 'ic_search_2'.toSvgAction(
//           color: collapsedRx() ? Colors.black : Colors.white,
//           onPressed: () {
//             //TODO
//           },
//         ),
//       ),
//       if (!canPop)
//         Obx(
//           () => 'ic_menu'.toSvgAction(
//             color: collapsedRx() ? Colors.black : Colors.white,
//             onPressed: () => Scaffold.maybeOf(context)?.openEndDrawer(),
//           ),
//         ),
//       Spacing.w10,
//     ];
//   }
// }
//
// class _InfoView extends StatelessWidget {
//   const _InfoView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         $BgView(),
//         Positioned(
//           top: AppSize.safeTop + AppSize.appBar + 20,
//           left: 0,
//           right: 0,
//           child: $UserView(),
//         ),
//         Positioned(
//           top: AppSize.safeTop + AppSize.appBar + 110,
//           left: 0,
//           right: 0,
//           bottom: 0,
//           child: $InfoView(),
//         ),
//       ],
//     );
//   }
//
//   Widget $UserView() {
//     Widget builder(UserInfoModel data) {
//       return Row(
//         children: [
//           AvatarView(
//             data.avatar,
//             size: 70,
//             side: const BorderSide(color: Colors.white, width: 1),
//           ),
//           Spacing.w10,
//           Flexible(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextOneLine(
//                   data.nickName ?? '',
//                   style: const TextStyle(fontSize: 16, fontWeight: fw$Bold),
//                 ),
//                 SelectableText('ID ${data.account}'),
//               ],
//             ),
//           ),
//         ],
//       );
//     }
//
//     Widget child = MyInfoCtrl.use(builder: builder);
//
//     child = OpacityButton(
//       onTap: () => Get.to(() => const PersonalPage()),
//       child: child,
//     );
//
//     child = Padding(
//       padding: const Pad(horizontal: 10),
//       child: child,
//     );
//
//     child = DefaultTextStyle(
//       style: const TextStyle(fontSize: 12, color: Colors.white),
//       child: child,
//     );
//
//     return child;
//   }
//
//   Widget $InfoView() {
//     Widget $Btn(String label, VoidCallback onTap) {
//       return Expanded(
//         child: XTextBtn(
//           label: label,
//           width: double.infinity,
//           height: 30,
//           color: const Color(0xFFF5F5F5),
//           textStyle: const TextStyle(fontSize: 14, color: Colors.black),
//           onTap: onTap,
//         ),
//       );
//     }
//
//     final btn1 = Row(
//       children: [
//         SvgView(SVG.$('my/我的装扮')),
//         Spacing.w10,
//         const TextOneLine(
//           '我的装扮',
//           style: TextStyle(fontSize: 14, color: Colors.black),
//         ),
//       ],
//     );
//
//     final btn2 = Row(
//       children: [
//         $Btn(
//           '编辑资料',
//           () {
//             //TODO
//           },
//         ),
//         Spacing.w10,
//         $Btn(
//           '添加好友',
//           () {
//             //TODO
//           },
//         ),
//       ],
//     );
//
//     const _decor = BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//     );
//
//     Widget child = Padding(
//       padding: const Pad(top: 2, horizontal: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const TextOneLine(
//             '点击添加介绍，让大家认识你',
//             style: TextStyle(fontSize: 14, color: Colors.black),
//           ),
//           $TagView(),
//           Spacing.exp,
//           btn1,
//           Spacing.exp,
//           btn2,
//           Spacing.h8,
//         ],
//       ),
//     );
//
//     child = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         $NumView(),
//         Expanded(child: child),
//       ],
//     );
//
//     child = DecoratedBox(decoration: _decor, child: child);
//
//     return child;
//   }
//
//   Widget $NumView() {
//     final data = {
//       '关注': $NumFormat(123),
//       '粉丝': $NumFormat(123),
//       '动态': $NumFormat(123),
//     };
//
//     return DefaultTextStyle(
//       style: const TextStyle(fontSize: 12, color: Colors.black),
//       child: SizedBox(
//         height: 48,
//         child: Row(
//           children: data.entries.map((it) {
//             return Expanded(
//               child: OpacityButton(
//                 onTap: () => onItemClick(it.key),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextOneLine(
//                       it.value,
//                       style: const TextStyle(fontSize: 16, fontWeight: fw$Bold),
//                     ),
//                     TextOneLine(it.key),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(growable: false),
//         ),
//       ),
//     );
//   }
//
//   Widget $BgView() {
//     return Container(
//       height: AppSize.safeTop + 202,
//       decoration: const ShapeDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0xFFBE7DE6), Colors.white],
//         ),
//       ),
//     );
//   }
//
//   Widget $TagView() {
//     return Row(
//       children: const [],
//     );
//   }
//
//   void onItemClick(String action) {
//     switch (action) {
//       case '关注':
//         Get.to(() => const MyFriendPage(initIndex: 1));
//         break;
//       case '粉丝':
//         Get.to(() => const MyFriendPage(initIndex: 2));
//         break;
//       case '动态':
//         break;
//     }
//   }
// }
