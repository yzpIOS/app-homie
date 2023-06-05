// import 'package:app/common/theme.dart';
// import 'package:app/tools.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
//
// class BillPage extends StatefulWidget {
//   const BillPage({super.key});
//
//   @override
//   State<BillPage> createState() => _BillPageState();
// }
//
// class _BillPageState extends State<BillPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: xAppBar(title: '账单'),
//       body: _DataView(),
//     );
//   }
// }
//
// class _DataView extends SimplePageView<Map> {
//   _DataView();
//
//   @override
//   Future fetchPage(PageNum page) {
//     return Future.delayed(
//       500.milliseconds,
//       () => List.generate(20, (index) => {}),
//     );
//   }
//
//   @override
//   BaseConfig get config {
//     return const ListConfig(
//       padding: Pad(horizontal: 10),
//       divider: Divider(indent: 45),
//     );
//   }
//
//   @override
//   Widget itemBuilder(BuildContext context, Map item, int index) {
//     return _ItemView(data: item);
//   }
// }
//
// class _ItemView extends StatelessWidget {
//   final Map data;
//
//   const _ItemView({required this.data});
//
//   @override
//   Widget build(BuildContext context) {
//     Widget child = const Row(
//       children: [
//         SizedBox(
//           width: 35,
//           height: 35,
//           child: Placeholder(),
//         ),
//         Spacing.w10,
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: XText('移动端官网充值 2500钻石'),
//                   ),
//                   Spacing.w10,
//                   XText('+330'),
//                 ],
//               ),
//               Spacing.h4,
//               XText(
//                 '09月20日 15:23',
//                 style: TextStyle(fontSize: 12, fontWeight: fw$Regular),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//
//     child = SizedBox(
//       height: 83,
//       child: DefaultTextStyle.merge(
//         style: const TextStyle(fontSize: 14, color: AppPalette.c3, fontWeight: fw$Bold),
//         child: child,
//       ),
//     );
//
//     return child;
//   }
// }
