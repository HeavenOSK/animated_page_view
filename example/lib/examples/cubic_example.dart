import 'package:animated_page_view/animated_page_view.dart';
import 'package:example/pages.dart';
import 'package:flutter/material.dart';

class CubicExamplePage extends StatelessWidget {
  const CubicExamplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.8,
          child: AnimatedPageView.builder(
            transitionBuilder: CubicPageTransition(),
            controller: PageController(),
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
        ),
      ),
    );
  }
}
