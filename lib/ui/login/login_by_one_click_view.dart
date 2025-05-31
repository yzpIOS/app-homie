// import 'package:app/common/theme.dart';
// import 'package:app/store/oauth_ctrl.dart';
// import 'package:app/tools.dart';
// import 'package:app/ui/login/login_sms_page.dart';
// import 'package:app/ui/login/widgets/pact_view.dart';
// import 'package:app/widgets.dart';
// import 'package:flutter/material.dart';
//
// import '../common/app_dialog.dart';
//
// class LoginByOneClickView extends StatefulWidget {
//   const LoginByOneClickView({Key? key}) : super(key: key);
//
//   @override
//   State<LoginByOneClickView> createState() => _LoginByOneClickViewState();
// }
//
// class _LoginByOneClickViewState extends State<LoginByOneClickView> {
//   final pactRx = RxBool(false);
//
//   @override
//   void initState() {
//     super.initState();
//
//     pactRx(KvBox.contains(PrefKey.AgreementConfirm));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final child = Column(
//       children: [
//         const Placeholder(
//           child: Box(width: 80, height: 80),
//         ),
//         Spacing.h8,
//         const TextOneLine('永远相信美好的事情即将发生'),
//         Spacing.h20,
//         const TextOneLine(
//           '188*****8888',
//           style: TextStyle(fontSize: 18, fontWeight: fw$Bold),
//         ),
//         Spacing.h4,
//         const TextOneLine(
//           '中国移动提供认证服务',
//           style: TextStyle(fontSize: 10, color: AppPalette.c9),
//         ),
//         Spacing.h20,
//         Pact.oneKey.$PactView(pactRx),
//         Spacing.h54,
//         XTextBtn(
//           width: double.infinity,
//           height: AppSize.btnLarge,
//           label: '一键安全登录',
//           textStyle: const TextStyle(fontSize: 14, color: Colors.white),
//           onTap: doLogin,
//         ),
//         XTextBtn(
//           width: 88,
//           height: AppSize.btnLarge,
//           label: '手机验证登录',
//           color: Colors.transparent,
//           textStyle: const TextStyle(fontSize: 12, color: AppPalette.c3),
//           onTap: () => Get.to(() => const LoginSmsPage()),
//         ),
//       ],
//     );
//
//     return DefaultTextStyle(
//       style: const TextStyle(fontSize: 14, color: Colors.black),
//       child: Padding(
//         padding: const Pad(horizontal: 36, top: 30),
//         child: child,
//       ),
//     );
//   }
//
//   void doLogin() {
//     void doSub() => Get.find<OAuthCtrl>().doOneClickLogin('');
//
//     if (pactRx.isTrue) {
//       doSub();
//     } else {
//       final dialog = AppDialog(
//         title: null,
//         content: Pact.oneKey.$PactTxt(),
//         actions: [
//           CancelDialogAction(),
//           OkDialogAction(
//             title: '同意',
//             onTap: () => Get.back(result: true),
//           ),
//         ],
//       );
//
//       Get.dialog(dialog, useSafeArea: false).then((val) {
//         if (val == true) {
//           pactRx(true);
//           KvBox.write(PrefKey.AgreementConfirm, true);
//
//           doSub();
//         }
//       });
//     }
//   }
// }
