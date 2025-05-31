// import 'package:app/common/theme.dart';
// import 'package:app/event/event.dart';
// import 'package:app/model/enum/room_role_type.dart';
// import 'package:app/store/oauth_ctrl.dart';
// import 'package:app/store/room/room_ctrl.dart';
// import 'package:app/store/room/room_mic_ctrl.dart';
// import 'package:app/tools.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
//
// import 'apply_user_view.dart';
// import 'mic_user_view.dart';
// import 'online_user_view.dart';
//
// class UserSheet extends ISheetWidget {
//   final ctrl = PageController();
//
//   @override
//   Tuple2<Widget, VoidCallback?>? get leading => $OnlineView();
//
//   // @override
//   // Widget get title {
//   //   return XTextBtn(
//   //     height: 24,
//   //     label: '贡献榜',
//   //     color: const Color(0x4DDCD2FE),
//   //     textStyle: const TextStyle(fontSize: 12, color: AppPalette.c6),
//   //     onTap: () => ctrl.animateToPage(1, duration: kTabScrollDuration, curve: Curves.easeOutCubic),
//   //   );
//   // }
//
//   @override
//   Tuple2<Widget, VoidCallback> get trailing => closeBtn;
//
//   late final _ctrl = sceneCtrl<RoomCtrl>();
//
//   Tuple2<Widget, VoidCallback?> $OnlineView() {
//     const _decor = ShapeDecoration(shape: XStadiumBorder(), color: AppPalette.primary);
//
//     final child = Container(
//       decoration: _decor,
//       alignment: Alignment.center,
//       padding: const Pad(horizontal: 5),
//       constraints: const BoxConstraints(minWidth: 40),
//       child: Obx(
//         () {
//           final maxUser = _ctrl.maxUser;
//           final userCount = _ctrl.userCountRx();
//
//           return XTextRich(
//             TextSpan(
//               children: [
//                 TextSpan(text: '$userCount'),
//                 if (maxUser > 0) TextSpan(text: '/$maxUser'),
//               ],
//             ),
//             style: const TextStyle(fontSize: 12, color: Colors.white),
//           );
//         },
//       ),
//     );
//
//     return Tuple2(
//       child, null,
//       // () => ctrl.animateToPage(0, duration: kTabScrollDuration, curve: Curves.easeOutCubic),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) => _BodyView(ctrl: ctrl);
// }
//
// class _BodyView extends StatefulWidget {
//   final PageController ctrl;
//
//   const _BodyView({Key? key, required this.ctrl}) : super(key: key);
//
//   @override
//   State<_BodyView> createState() => _BodyViewState();
// }
//
// class _BodyViewState extends State<_BodyView> with BusStateMixin {
//   final _ctrl = sceneCtrl<RoomCtrl>();
//
//   @override
//   void initState() {
//     super.initState();
//
//     final myUid = OAuthCtrl.uid;
//     final isOwner = _ctrl.isOwner(myUid);
//
//     on<MicApplyEvent>(
//       test: (_) => isOwner || _ctrl.managerRx.contains(myUid),
//       (_) => showToast('有新的上麦申请'),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: widget.ctrl,
//       physics: const NeverScrollableScrollPhysics(),
//       children: [
//         Padding(
//           padding: const Pad(top: 16),
//           child: Obx(() => $UserView(_ctrl.roomId, _ctrl.getRole(OAuthCtrl.uid))),
//         ),
//         // RankingView(),
//       ],
//     );
//   }
//
//   Widget $UserView(int roomId, RoomRoleType? myRole) {
//     final micTitle = GetX<RoomMicCtrl>(
//       builder: (it) => XText('上麦 ${it.dataRx.length}/${it.maxMic}'),
//     );
//
//     final data = {
//       const XText('在线'): OnlineUserView(roomId, myRole: myRole),
//       micTitle: MicUserView(myRole),
//       if (myRole.isManager && _ctrl.examineMicRx()) const XText('申请列表'): ApplyUserView(roomId),
//     };
//
//     return DefaultTabController(
//       length: data.length,
//       child: Column(
//         children: [
//           $TabBar(data),
//           Expanded(
//             child: TabBarView(
//               children: data.values.toList(growable: false),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget $TabBar(Map<Widget, Widget> data) {
//     return TabBar(
//       tabs: data.keys.map((it) {
//         return Tab(height: 32, child: it);
//       }).toList(growable: false),
//     );
//   }
// }
