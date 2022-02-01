import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'header/header.dart';

class ContentAreaWidget extends StatelessWidget {
  ContentAreaWidget({this.child, Key? key}) : super(key: key);

  Widget? child;

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
          const HeaderWidget(),
          child ?? Container(),
          //BodyWidget(),
        ],
      ),
    );
  }
}
