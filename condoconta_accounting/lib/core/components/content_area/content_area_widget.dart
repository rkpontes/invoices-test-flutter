import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'body/body_widget.dart';
import 'header/header.dart';

class ContentAreaWidget extends StatelessWidget {
  const ContentAreaWidget({this.bodyWidget, this.headerWidget, Key? key})
      : super(key: key);

  final HeaderWidget? headerWidget;
  final BodyWidget? bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: Get.height,
      padding: const EdgeInsets.only(top: 53),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          headerWidget ?? Container(),
          bodyWidget ?? Container(),
          //BodyWidget(),
        ],
      ),
    );
  }
}
