import 'package:app/common/theme.dart';
import 'package:app/widgets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

typedef BadgeStyle = badges.BadgeStyle;
typedef BadgePosition = badges.BadgePosition;
typedef BadgeAnimation = badges.BadgeAnimation;

class AppBadge extends StatelessWidget {
  final bool showBadge;
  final BadgeStyle badgeStyle;
  final BadgePosition position;
  final BadgeAnimation badgeAnimation;
  final Widget child;
  final Widget? badgeContent;

  const AppBadge._({
    required this.showBadge,
    required this.badgeStyle,
    required this.position,
    required this.badgeAnimation,
    required this.child,
    this.badgeContent,
  });

  factory AppBadge.count({
    required final int count,
    required final BadgePosition position,
    required final Widget child,
  }) {
    return AppBadge._(
      showBadge: count > 0,
      position: position,
      badgeContent: _BadgeContent(count: count),
      badgeAnimation: const badges.BadgeAnimation.fade(
        toAnimate: false,
      ),
      badgeStyle: const badges.BadgeStyle(
        elevation: 0,
        shape: badges.BadgeShape.square,
        padding: EdgeInsets.zero,
        badgeColor: Color(0xFFFF0049),
        borderRadius: AppBorderRadius.max,
      ),
      child: child,
    );
  }

  factory AppBadge.dot({
    required final bool show,
    required final BadgePosition position,
    required final Widget child,
  }) {
    return AppBadge._(
      showBadge: show,
      position: position,
      badgeAnimation: const badges.BadgeAnimation.fade(),
      badgeStyle: const badges.BadgeStyle(
        elevation: 0,
        shape: badges.BadgeShape.circle,
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        badgeColor: Color(0xFFFF0049),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      ignorePointer: true,
      showBadge: showBadge,
      position: position,
      badgeStyle: badgeStyle,
      badgeContent: badgeContent,
      badgeAnimation: badgeAnimation,
      child: child,
    );
  }
}

class _BadgeContent extends StatelessWidget {
  final int count;

  const _BadgeContent({required this.count});

  @override
  Widget build(BuildContext context) {
    const double height = 16;

    return Container(
      constraints: const BoxConstraints(minHeight: height, maxHeight: height, minWidth: height),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      alignment: Alignment.center,
      child: XText(
        count > 99 ? '99+' : '$count',
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: false,
          applyHeightToLastDescent: false,
        ),
        style: const TextStyle(fontSize: 12, color: Colors.white, height: 1),
      ),
    );
  }
}
