// import 'package:app/common/theme.dart';
// import 'package:app/net/api.dart';
// import 'package:app/store/room/room_ctrl.dart';
// import 'package:app/store/user/user_info_ctrl.dart';
// import 'package:app/tools.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
//
// import '../widgets/room_get_widget.dart';
//
// class ApplyUserView extends SimplePageView<Map> {
//   final int roomId;
//
//   ApplyUserView(this.roomId);
//
//   @override
//   Future fetchPage(PageNum page) => Api.Room.micReqList(page: page, roomId: roomId);
//
//   @override
//   BaseConfig get config {
//     return const ListConfig(
//       padding: Pad(horizontal: 10, vertical: 5),
//       itemExtent: 60,
//     );
//   }
//
//   @override
//   Widget itemBuilder(BuildContext context, Map item, int index) {
//     return _ItemView(
//       data: item,
//       onItemClick: (it) => onItemClick(it, item),
//     );
//   }
//
//   void onItemClick(String action, Map item) {
//     void doRemove() => controller.removeItem(item);
//
//     switch (action) {
//       case '允许':
//       case '拒绝':
//         simpleSub(
//           Api.Room.micConfirm(mikeId: item['mike_id'], type: 1, isAgree: action == '允许'),
//           callback: doRemove,
//         );
//         break;
//     }
//   }
// }
//
// class _ItemView extends RoomGetView<RoomCtrl> {
//   final Map data;
//   final ValueChanged<String> onItemClick;
//
//   const _ItemView({required this.data, required this.onItemClick});
//
//   @override
//   Widget build(BuildContext context) {
//     final uid = data['uid'];
//
//     Widget child = Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         UserInfoCtrl.use(
//           uid,
//           builder: (it) => XText(it?.nickName ?? ''),
//         ),
//         XText(
//           '申请${data['mike_no']}号麦',
//           style: const TextStyle(fontSize: 12, color: AppPalette.c9),
//         ),
//       ],
//     );
//
//     child = Row(
//       children: [
//         AsyncAvatar(uid: uid, size: 40),
//         Spacing.w10,
//         Expanded(child: child),
//         Spacing.w6,
//         XTextBtn(
//           label: '允许',
//           width: 56,
//           height: AppSize.btnTiny,
//           color: AppPalette.primary,
//           textStyle: const TextStyle(fontSize: 14, color: Colors.white),
//           onTap: () => onItemClick('允许'),
//         ),
//         Spacing.w6,
//         XOutlinedBtn(
//           label: '拒绝',
//           width: 56,
//           height: AppSize.btnTiny,
//           side: const BorderSide(color: AppPalette.cc),
//           textStyle: const TextStyle(fontSize: 14, color: Colors.black),
//           onTap: () => onItemClick('拒绝'),
//         ),
//       ],
//     );
//
//     child = DefaultTextStyle.merge(
//       style: const TextStyle(fontSize: 14, color: Colors.black),
//       child: child,
//     );
//
//     return child;
//   }
// }
