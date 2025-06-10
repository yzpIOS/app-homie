import 'package:app/common/theme.dart';
import 'package:app/store/oauth_ctrl.dart';
import 'package:app/store/user/user_info_ctrl.dart';
import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/my/user_home_page.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';

/// 异步头像组件
/// 用于加载和显示用户头像，支持头像框和在线状态显示
class AsyncAvatar extends StatelessWidget {
  /// 用户ID
  final UID uid;
  /// 头像大小
  final double size;
  /// 头像边框样式
  final BorderSide side;
  /// 点击回调函数
  final Option<VoidCallback>? onTap;
  /// 是否显示在线状态
  final bool isShowOnline;
  /// 头像框大小
  final int avatarFrameSize;
  /// 是否使用用户头像框
  final bool userFrame;

  const AsyncAvatar({
    super.key,
    required this.uid,
    this.size = 82,
    this.side = BorderSide.none,
    this.onTap,
    this.avatarFrameSize = 8,
    this.isShowOnline = false,
    this.userFrame = true,
  });

  @override
  Widget build(BuildContext context) {
    // 如果用户ID为空，显示默认头像
    if (uid.isEmpty) return AvatarView(null, size: size, side: side);

    // 使用UserHomeWrap包装，支持点击跳转到用户主页
    return UserHomeWrap(
      uid: uid,
      onTap: onTap,
      child: UserInfoCtrl.use(
        uid,
        forceUseNet: true,
        builder: (it) => AvatarView(
          it?.avatarUrl,
          blur: it?.avatarExtra,
          size: size,
          side: side,
          isShowOnline: isShowOnline,
          avatarFrameUrl: userFrame ? it?.avatarFrame : "",
          avatarFrameSize: avatarFrameSize,
          userFrame: userFrame,
        ),
      ),
    );
  }
}

/// 头像视图组件
/// 用于显示头像图片，支持头像框和在线状态显示
class AvatarView extends StatelessWidget {
  /// 头像URL
  final String? url;
  /// 头像框URL
  final String? avatarFrameUrl;
  /// 模糊效果参数
  final String? blur;
  /// 头像大小
  final double size;
  /// 头像边框样式
  final BorderSide side;
  /// 是否显示在线状态
  final bool isShowOnline;
  /// 头像框大小
  final int avatarFrameSize;
  /// 是否使用用户头像框
  final bool userFrame;

  const AvatarView(this.url, {
    super.key,
    this.blur,
    this.size = 82,
    this.side = BorderSide.none, 
    this.isShowOnline = false,
    this.avatarFrameSize = 8,
    this.avatarFrameUrl = null,
    this.userFrame = true,
  });

  @override
  Widget build(BuildContext context) {
    // 构建基础头像组件
    Widget child = _Avatar(
      url: url,
      avatarFrameUrl: avatarFrameUrl,
      avatarFrameSize: avatarFrameSize,
      blur: blur,
      size: size,
      shape: CircleBorder(side: side),
      userFrame: userFrame,
    );

    // 如果需要显示在线状态，添加在线状态指示器
    if (isShowOnline) {
      return Container(
        clipBehavior: Clip.none,
        width: size + 6,
        height: size + 6,
        padding: const Pad(all: 3.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Color(0xFFB77DE5), width: 1.5,),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            Positioned.fill(child: child,),
            // 添加"直播中"标签
            Positioned(
              bottom: -13,
              child: Image.asset(IMG.format('直播中'), width: 46.5, height: 19.5, scale: 3, fit: BoxFit.contain),
            ),
          ],
        ),
      );
    } else {
      return child;
    }
  }
}

/// 基础头像组件
/// 用于处理头像图片的加载、裁剪和装饰
class _Avatar extends StatelessWidget {
  /// 头像URL
  final String? url;
  /// 头像框URL
  final String? avatarFrameUrl;
  /// 模糊效果参数
  final String? blur;
  /// 头像大小
  final double size;
  /// 头像形状
  final ShapeBorder shape;
  /// 头像框大小
  final int avatarFrameSize;
  /// 是否使用用户头像框
  final bool userFrame;

  const _Avatar({
    this.url,
    this.blur,
    required this.size,
    required this.shape,
    this.avatarFrameSize = 8,
    this.avatarFrameUrl = null,
    this.userFrame = true,
  });

  @override
  Widget build(BuildContext context) {
    // 加载网络图片
    Widget child = NetImage(url, blur: blur, width: size, height: size, fit: BoxFit.cover);

    // 裁剪图片为指定形状
    child = ClipPath(
      clipper: ShapeBorderClipper(shape: shape),
      clipBehavior: Clip.antiAlias,
      child: child,
    );

    // 添加边框装饰
    child = DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: ShapeDecoration(shape: shape),
      child: child,
    );

    // 如果需要显示头像框，添加头像框
    if(userFrame) {
      Widget avatarFrame = avatarFrameUrl?.isNotEmpty == true ?
        NetImage(avatarFrameUrl, blur: blur, width: size, height: size, fit: BoxFit.cover) : SizedBox();
      child = Stack(
        alignment: Alignment.center,
        children: [
          child,
          SizedBox(
            width: size + avatarFrameSize,
            height: size + avatarFrameSize,
            child: OverflowBox(
              maxHeight: size + avatarFrameSize,
              maxWidth: size + avatarFrameSize,
              child: avatarFrame,
            ),
          )
        ],
      );
    }

    return child;
  }
}

/// 用户主页包装组件
/// 用于处理头像点击跳转到用户主页的功能
class UserHomeWrap extends StatelessWidget {
  /// 用户ID
  final UID uid;
  /// 子组件
  final Widget child;
  /// 点击回调函数
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

/// 跳转到用户主页的回调函数
/// @param uid 用户ID
VoidCallback toUserPage(UID uid) {
  return () {
    Get.to(() => UserHomePage(uid: uid));
  };
}
