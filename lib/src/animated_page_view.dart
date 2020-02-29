import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef AnimatedPageBuilder = Widget Function(
    int pageIndex, double pageValue, Widget child);
typedef PageViewTransitionBuilder = Widget Function(
    int pageIndex, double pageValue, Widget child);

class AnimatedPageView extends StatefulWidget {
  AnimatedPageView({
    PageController controller,
    List<Widget> children,
    @required this.transitionBuilder,
    Key key,
    this.pageBuilder = _defaultAnimatedLayoutPageBuilder,
    this.scrollDirection,
    this.reverse,
    this.physics,
    this.pageSnapping,
    this.onPageChanged,
    this.dragStartBehavior,
  })  : assert(children != null),
        assert(transitionBuilder != null),
        itemCount = children.length,
        itemBuilder = ((context, index) => children[index]),
        controller = controller ?? PageController(),
        super(key: key);

  AnimatedPageView.builder({
    Key key,
    @required this.itemBuilder,
    @required this.transitionBuilder,
    PageController controller,
    this.pageBuilder = _defaultAnimatedLayoutPageBuilder,
    this.itemCount,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    this.physics,
    this.pageSnapping = true,
    this.onPageChanged,
    this.dragStartBehavior = DragStartBehavior.start,
  })  : assert(transitionBuilder != null),
        controller = controller ?? PageController(),
        super(key: key);

  final PageController controller;

  final IndexedWidgetBuilder itemBuilder;

  final int itemCount;

  final PageViewTransitionBuilder transitionBuilder;

  final Axis scrollDirection;

  final bool reverse;

  final ScrollPhysics physics;

  final bool pageSnapping;

  final ValueChanged<int> onPageChanged;

  final DragStartBehavior dragStartBehavior;

  final AnimatedPageBuilder pageBuilder;

  static Widget _defaultAnimatedLayoutPageBuilder(
          int pageIndex, double pageValue, Widget child) =>
      child;

  @override
  _AnimatedPageViewState createState() => _AnimatedPageViewState();
}

class _AnimatedPageViewState extends State<AnimatedPageView> {
  PageController _pageController;
  var _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = widget.controller
      ..addListener(() {
        setState(() {
          _currentPageValue = _pageController.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      physics: widget.physics,
      pageSnapping: widget.pageSnapping,
      onPageChanged: widget.onPageChanged,
      dragStartBehavior: widget.dragStartBehavior,
      controller: _pageController,
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        return widget.transitionBuilder(
          index,
          _currentPageValue,
          widget.pageBuilder(
            index,
            _currentPageValue,
            widget.itemBuilder(context, index),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
