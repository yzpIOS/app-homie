// import 'package:app/3rd/tencent/rtc.dart';
// import 'package:app/common/theme.dart';
// import 'package:app/model/enum/room_role_type.dart';
// import 'package:app/store/oauth_ctrl.dart';
// import 'package:app/store/room/room_ctrl.dart';
// import 'package:app/store/room/room_mic_ctrl.dart';
// import 'package:app/store/user/user_info_ctrl.dart';
// import 'package:app/tools.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
//
// import '../widgets/role_view.dart';
// import 'select_user_page.dart';
//
// class MicUserView extends GetView<RoomMicCtrl> {
//   final RoomRoleType? myRole;
//
//   MicUserView(this.myRole);
//
//   late final roomCtrl = sceneCtrl<RoomCtrl>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () {
//         final data = controller.dataRx().let((it) {
//           return List.generate(controller.maxMic, (i) => it['${i + 1}'], growable: false);
//         });
//
//         return SimpleListView<MicInfo?>(
//           data,
//           padding: const Pad(bottom: 64),
//           itemExtent: 50,
//           itemBuilder: itemBuilder,
//         );
//       },
//     );
//   }
//
//   Widget itemBuilder(BuildContext context, MicInfo? item, int index) {
//     final no = '${index + 1}';
//
//     return item == null ? emptyView(no) : userView(no, item);
//   }
//
//   Widget emptyView(String no) {
//     void onTap() {
//       if (myRole.isManager) {
//         Get.showActionSheet(['移到此座位', '抱Ta上麦']).onNotNull((val) {
//           switch (val) {
//             case '移到此座位':
//               controller.micUp(no: no);
//               break;
//             case '抱Ta上麦':
//               Get.to(() => SelectUserPage(roomId: controller.roomId, title: '抱Ta上麦')) //
//                   ?.onType<Map>((val) => controller.inviteMicUp(no: no, uid: val['uid']));
//               break;
//           }
//         });
//       } else {
//         controller.micUp(no: no);
//       }
//     }
//
//     return InkWell(
//       onTap: onTap,
//       child: _MicView(
//         no,
//         title: '点击上麦',
//         avatar: Image.asset(IMG.$('room/mic/麦位_0'), scale: 3, fit: BoxFit.contain),
//       ),
//     );
//   }
//
//   Widget userView(String no, MicInfo item) {
//     final uid = item.uid;
//     final isSelf = OAuthCtrl.isSelf(uid);
//
//     Widget builder(UserInfoDto? info) {
//       final action = //
//           isSelf
//               ? $SelfAction(no)
//               : myRole.isManager
//                   ? $ManagerAction(no, uid)
//                   : null;
//
//       return Obx(
//         () => _MicView(
//           no,
//           role: roomCtrl.getRole(uid),
//           action: action,
//           title: info?.nickName ?? '',
//           avatar: AvatarView(info?.avatar, blur: info?.avatarEx),
//         ),
//       );
//     }
//
//     return UserInfoCtrl.use(uid, builder: builder);
//   }
//
//   List<Widget> $SelfAction(String no) {
//     return [
//       $ActionBtn(
//         icon: '下麦',
//         onTap: () => controller.micDow(alert: '确定下麦', no: no),
//       ),
//       Obx(
//         () {
//           final state = Rtc.micRx().intVal;
//
//           return $ActionBtn(icon: '麦_$state', onTap: Rtc.micSwitch);
//         },
//       ),
//     ];
//   }
//
//   List<Widget> $ManagerAction(String no, uid) {
//     return [
//       $ActionBtn(
//         icon: '下麦',
//         onTap: () => controller.micDow(alert: '确定抱Ta下麦', no: no),
//       ),
//       Obx(
//         () {
//           final isMute = controller.dataRx[no]?.isMute != false;
//
//           return $ActionBtn(
//             icon: '麦_${(!isMute).intVal}',
//             onTap: () => controller.userMicSwitch(no: no, uid: uid),
//           );
//         },
//       ),
//     ];
//   }
//
//   Widget $ActionBtn({required String icon, VoidCallback? onTap}) {
//     return InkResponse(
//       onTap: onTap,
//       child: Box(
//         width: 34,
//         height: 34,
//         alignment: Alignment.center,
//         child: Image.asset(IMG.$('room/mic/$icon'), scale: 3),
//       ),
//     );
//   }
// }
//
// class _MicView extends StatelessWidget {
//   final String no;
//   final Widget avatar;
//   final String title;
//   final RoomRoleType? role;
//   final List<Widget>? action;
//
//   const _MicView(this.no, {required this.avatar, required this.title, this.action, this.role});
//
//   @override
//   Widget build(BuildContext context) {
//     return Box(
//       padding: const Pad(vertical: 5),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 80,
//             child: action == null ? null : $ActionView(action!),
//           ),
//           ConstrainedBox(
//             constraints: BoxConstraints.tight(const Size.square(40)),
//             child: avatar,
//           ),
//           Spacing.w10,
//           Expanded(
//             child: XText(
//               title,
//               style: const TextStyle(fontSize: 14, color: Colors.black),
//             ),
//           ),
//           Spacing.w10,
//           XText(
//             '$no号麦',
//             style: const TextStyle(fontSize: 12, color: AppPalette.c6),
//           ),
//           Spacing.w6,
//           RoleView(role: role),
//           Spacing.w10,
//         ],
//       ),
//     );
//   }
//
//   Widget $ActionView(List<Widget> action) {
//     return Row(
//       children: [
//         Spacing.w6,
//         ...action.take(2),
//         Spacing.w6,
//       ],
//     );
//   }
// }
