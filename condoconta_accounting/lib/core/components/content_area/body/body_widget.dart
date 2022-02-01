import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BodyWidget extends StatelessWidget {
  BodyWidget({this.children = const <Widget>[], Key? key}) : super(key: key);

  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: children,
      ),
    );
  }
}
