import 'dart:math';

import 'package:flutter/material.dart';

import '../animated_page_view_transition.dart';

const _defaultPerspective = 1 / 500;
const _defaultTotalAngle = pi / 2;

class CubicPageTransition extends AnimatedPageViewTransition {
  CubicPageTransition({
    this.perspective = _defaultPerspective,
    this.totalAngle = _defaultTotalAngle,
  })  : assert(perspective != null),
        assert(totalAngle != null);

  final double perspective;
  final double totalAngle;

  @override
  Widget call(int pageIndex, double pageValue, Widget child) {
    if (pageIndex == pageValue.floor()) {
      return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, perspective)
          ..rotateY(totalAngle * (pageValue - pageIndex)),
        alignment: FractionalOffset.centerRight,
        child: child,
      );
    } else if (pageIndex == pageValue.floor() + 1) {
      return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, perspective)
          ..rotateY(totalAngle * (pageValue - pageIndex)),
        alignment: FractionalOffset.centerLeft,
        child: child,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
