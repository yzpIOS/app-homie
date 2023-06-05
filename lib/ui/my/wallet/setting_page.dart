// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
//
// class SettingPage extends StatefulWidget {
//   const SettingPage({Key? key}) : super(key: key);
//
//   @override
//   State<SettingPage> createState() => _SettingPageState();
// }
//
// class _SettingPageState extends State<SettingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: xAppBar(title: '钱包管理'),
//       body: $BodyView(),
//     );
//   }
//
//   Widget $BodyView() {
//     final data = {
//       '支付宝管理': '绑定/解绑支付宝账号，用于收入提现',
//       '免密支付管理': '管理HOMIE支付和支付宝的小额免密支付',
//       '支付设置': '支付相关问题设置',
//       '优先付款设置': '付款时，可优先使用HOMIE支付',
//     };
//
//     return Column(
//       children: [
//         const Divider(thickness: 10, height: 10),
//         TableView(
//           [
//             TableGroup(
//               data.entries.map((it) {
//                 return TableItem(
//                   title: it.key,
//                   tips: it.value,
//                   onTap: () => onItemClick(it.key),
//                 );
//               }).toList(growable: false),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   void onItemClick(String action) {
//     //TODO
//   }
// }
