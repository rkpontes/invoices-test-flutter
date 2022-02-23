import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class BodyWidget extends StatelessWidget {
  BodyWidget({this.children = const <Widget>[], Key? key}) : super(key: key);

  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: children.isNotEmpty
          ? Column(
              children: children,
            )
          : Container(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'requirements/assets/illustration-empty.svg',
                  ),
                  const SizedBox(height: 46),
                  const Text(
                    "There is nothing here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.43,
                    ),
                  ),
                  const SizedBox(height: 26),
                  const Text(
                    "Create an invoice by clicking the\nNew Invoice button and get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 0.88,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
