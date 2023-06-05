// import 'package:app/common/theme.dart';
// import 'package:app/store/wallet_ctrl.dart';
// import 'package:app/tools.dart';
// import 'package:app/ui/common/money_icon.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
//
// class MoneyView extends StatelessWidget {
//   final AlignmentGeometry alignment;
//
//   const MoneyView({super.key, this.alignment = Alignment.bottomLeft});
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: alignment,
//       child: Box(
//         height: AppSize.appBar,
//         child: DefaultTextStyle.merge(
//           style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: fw$Bold),
//           child: WalletCtrl.use(
//             builder: (data) {
//               return Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Spacing.w10,
//                   ...MoneyType.values.map((it) => $MoneyView(data, it)).separator(Spacing.w10),
//                   Spacing.w10,
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget $MoneyView(Map<MoneyType, num?> data, MoneyType type) {
//     return Row(
//       children: [
//         MoneyIcon(type: type, size: 24),
//         XText($NumFormat(data[type])),
//       ],
//     );
//   }
// }
