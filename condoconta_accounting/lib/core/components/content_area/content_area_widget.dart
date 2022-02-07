import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'header/header.dart';

class ContentAreaWidget extends StatelessWidget {
  const ContentAreaWidget({this.bodyWidget, this.headerWidget, Key? key})
      : super(key: key);

  final HeaderWidget? headerWidget;
  final Widget? bodyWidget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // ignore: sized_box_for_whitespace
      child: Container(
        width: 800,
        height: Get.height,
        //padding: const EdgeInsets.only(top: 53),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 53),
              headerWidget ?? Container(),
              bodyWidget ?? Container(),
              //BodyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
