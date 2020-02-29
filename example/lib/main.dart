import 'package:example/pages/cubic_example.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'animated_layout_page_view demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated_layout_page_view Demo'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('CubicPage'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CubicExamplePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
