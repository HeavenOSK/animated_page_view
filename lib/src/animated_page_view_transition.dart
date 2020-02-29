import 'package:flutter/material.dart';

// ignore: one_member_abstracts
abstract class AnimatedPageViewTransition {
  Widget call(int pageIndex, double pageValue, Widget child);
}
