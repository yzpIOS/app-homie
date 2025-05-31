import 'package:app/ui/login/login_by_third_view.dart';
import 'package:app/widgets.dart';

class LoginBaseView extends StatelessWidget {
  final Widget child;

  const LoginBaseView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: child,
        ),
        const LoginByThirdView(),
        Spacing.h32,
      ],
    );
  }
}
