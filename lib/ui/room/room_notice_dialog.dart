// import 'package:app/common/theme.dart';
// import 'package:app/tools.dart';
// import 'package:app/ui/room/widgets/room_get_widget.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
//
// class RoomNoticeDialog extends RoomGetView {
//   RoomNoticeDialog({super.key});
//
//   late final noticeRx = controller.noticeRx;
//
//   @override
//   Widget build(BuildContext context) {
//     Widget child = Obx(
//       () {
//         final notice = noticeRx();
//
//         return XText(
//           notice.isEmpty ? '目前暂无公告。' : notice,
//           style: const TextStyle(fontSize: 14, color: Colors.black),
//         );
//       },
//     );
//
//     child = Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: Pad(all: 10),
//           child: XText(
//             '公告',
//             style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: fw$Bold),
//           ),
//         ),
//         Expanded(
//           child: SingleChildScrollView(
//             padding: const Pad(horizontal: 10, bottom: 10),
//             child: child,
//           ),
//         ),
//         // if (isManager) //
//         //   Align(
//         //     alignment: Alignment.bottomRight,
//         //     child: $ChangeNoticeView(),
//         //   ),
//       ],
//     );
//
//     child = Material(
//       color: Colors.white,
//       borderRadius: AppBorderRadius.a12,
//       child: ConstrainedBox(
//         constraints: const BoxConstraints.tightFor(width: 280, height: 400),
//         child: child,
//       ),
//     );
//
//     child = Align(
//       alignment: const FractionalOffset(0.5, 0.4),
//       child: child,
//     );
//
//     return child;
//   }
//
// // Widget $ChangeNoticeView() {
// //   return InkResponse(
// //     child: Padding(
// //       padding: const Pad(horizontal: 10, bottom: 10),
// //       child: SvgView(SVG.$('room/修改公告'), width: 24, height: 24),
// //     ),
// //     onTap: () {
// //       final cfg = InputCfg(
// //         title: '公告',
// //         maxLines: null,
// //         maxLength: 200,
// //         initial: noticeRx(),
// //         inputType: TextInputType.multiline,
// //       );
// //
// //       XInputPage.go(cfg).onNotNull((val) {
// //         simpleSub(
// //           Api.Room.setNotice(roomId: controller.roomId, notice: val),
// //           callback: () {
// //             noticeRx(val);
// //           },
// //         );
// //       });
// //     },
// //   );
// // }
// }
