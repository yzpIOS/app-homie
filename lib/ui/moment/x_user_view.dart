// import 'package:app/common/theme.dart';
// import 'package:app/mock.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
//
// class XUserView extends StatelessWidget {
//   final Map data;
//
//   const XUserView({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Widget child = AvatarView(
//       Mock.image,
//       size: 54,
//       side: const BorderSide(color: Color(0xFFC567FF), width: 2),
//     );
//
//     child = Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         child,
//         $LiveTag(),
//         const Positioned(
//           left: 4,
//           right: 4,
//           bottom: 0,
//           child: TextOneLine(
//             'Ava',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 12, color: Colors.black),
//           ),
//         ),
//       ],
//     );
//
//     return child;
//   }
//
//   Positioned $LiveTag() {
//     return Positioned(
//       top: 46,
//       width: 30,
//       height: 12,
//       child: Container(
//         alignment: Alignment.center,
//         decoration: const ShapeDecoration(
//           borderRadius: AppRadius.r2,
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFFAB00FF), Color(0xFFFE00C2)],
//           ),
//         ),
//         child: const TextOneLine(
//           '直播中',
//           style: TextStyle(fontSize: 8, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
