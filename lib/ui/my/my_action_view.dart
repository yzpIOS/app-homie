// import 'package:app/common/theme.dart';
// import 'package:app/tools.dart';
// import 'package:app/ui/my/setting/setting_page.dart';
// import 'package:app/ui/my/wallet/wallet_page.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class MyActionView extends StatefulWidget {
//   const MyActionView({super.key});
//
//   @override
//   State<MyActionView> createState() => _MyActionViewState();
// }
//
// class _MyActionViewState extends State<MyActionView> {
//   final data = [
//     ['我的钱包'],
//     ['我的二维码', '观看历史'],
//     ['客服', '设置'],
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     const separator = TableGroupX(
//       child: Box(
//         height: 32,
//         padding: Pad(horizontal: 32),
//         alignment: Alignment.center,
//         child: Divider(),
//       ),
//     );
//
//     final items = data.map<ITableGroup>(
//       (it) {
//         return TableGroup(
//           [
//             for (final item in it)
//               TableItem$Action(
//                 title: item,
//                 icon: SVG.$('my/$item'),
//                 action: Spacing.blank,
//                 onTap: () => onItemClick(item),
//               ),
//           ],
//         );
//       },
//     );
//
//     return Drawer(
//       child: Provider.value(
//         value: const TableCfg(itemExtent: 62),
//         child: SingleChildScrollView(
//           padding: Pad(top: 56 + AppSize.safeTop),
//           child: TableView(
//             items.separator(separator).toList(growable: false),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onItemClick(String item) {
//     switch (item) {
//       case '我的钱包':
//         Get.to(() => const WalletPage());
//         break;
//       case '我的二维码':
//         break;
//       case '使用管理助手':
//         break;
//       case '创作者服务中心':
//         break;
//       case '观看历史':
//         break;
//       case '开放服务':
//         break;
//       case '客服':
//         break;
//       case '设置':
//         Get.to(() => const SettingPage());
//         break;
//     }
//
//     Scaffold.of(context).closeEndDrawer();
//   }
// }
