import 'package:animated_page_view/animated_page_view.dart';
import 'package:flutter/material.dart';

class CubicExamplePage extends StatelessWidget {
  const CubicExamplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemCount = 10;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedPageView.builder(
        transitionBuilder: CubicPageTransition(),
        controller: PageController(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final page = List.generate(itemCount, (index) => _Page(index: index));
          return page[index];
        },
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({Key key, this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(index.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[],
        ),
      ),
    );
  }
}
