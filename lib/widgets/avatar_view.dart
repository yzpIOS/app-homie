import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/user_home_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

class AsyncAvatar extends StatelessWidget {
  final UID uid;
  final double size;
  final BorderSide side;
  final Option<VoidCallback>? onTap;

  const AsyncAvatar({super.key, required this.uid, this.size = 82, this.side = BorderSide.none, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (uid.isEmpty) return AvatarView(null, size: size, side: side);

    return UserHomeWrap(
      uid: uid,
      onTap: onTap,
      child: UserInfoCtrl.use(
        uid,
        builder: (it) => AvatarView(it?.avatar, blur: it?.avatarEx, size: size, side: side),
      ),
    );
  }
}

class AvatarView extends StatelessWidget {
  final String? url;
  final String? blur;
  final double size;
  final BorderSide side;

  const AvatarView(this.url, {super.key, this.blur, this.size = 82, this.side = BorderSide.none});

  @override
  Widget build(BuildContext context) {
    Widget child = _Avatar(
      url: url,
      blur: blur,
      size: size,
      shape: CircleBorder(side: side),
    );

    return child;
  }
}

class _Avatar extends StatelessWidget {
  final String? url;
  final String? blur;
  final double size;
  final ShapeBorder shape;

  const _Avatar({this.url, this.blur, required this.size, required this.shape});

  @override
  Widget build(BuildContext context) {
    Widget child = NetImage(url, blur: blur, width: size, height: size, fit: BoxFit.cover);

    child = ClipPath(
      clipper: ShapeBorderClipper(shape: shape),
      clipBehavior: Clip.antiAlias,
      child: child,
    );

    child = DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: ShapeDecoration(shape: shape),
      child: child,
    );

    return child;
  }
}

class UserHomeWrap extends StatelessWidget {
  final UID uid;
  final Widget child;
  final Option<VoidCallback>? onTap;

  const UserHomeWrap({super.key, required this.uid, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: (onTap ?? Some(toUserPage(uid))).toNullable(),
      child: child,
    );
  }
}

VoidCallback toUserPage(UID uid) {
  return () {
    // if (OAuthCtrl.uid == uid) {
    //   Get.to(() => const MyPage());
    // } else {
    Get.to(() => UserHomePage(uid: uid));
    // }
  };
}
