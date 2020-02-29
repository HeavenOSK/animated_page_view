import 'package:flutter/material.dart';

final pages = [
  _Page(
    number: 121,
    color: Colors.greenAccent,
  ),
  _Page(
    number: 232,
    color: Colors.deepPurpleAccent,
  ),
  _Page(
    number: 343,
    color: Colors.indigoAccent,
  ),
  _Page(
    number: 454,
    color: Colors.redAccent,
  ),
];

class _Page extends StatelessWidget {
  const _Page({
    this.number,
    this.color,
    Key key,
  }) : super(key: key);

  final int number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
