import 'package:flutter/material.dart';

class HeroProvider {
  Hero withHero({required String tag, required Widget child}) {
    return Hero(
      tag: withTag(tag),
      child: child,
      createRectTween: (begin, end) => RectTween(begin: begin, end: end),
    );
  }

  Object withTag(String tag) => (hashCode ^ tag.hashCode);
}
