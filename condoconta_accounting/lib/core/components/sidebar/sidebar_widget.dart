import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: Get.height,
      decoration: const BoxDecoration(
        color: Color(0xff1f213a),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // logo
          Container(
            width: 104,
            height: 99,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color(0xff7d5cf6),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 104,
                    height: 56,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Color(0xff9277f7),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'requirements/assets/logo.svg',
                    width: 45,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),

          // sun icon
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 60),
              child: SvgPicture.asset(
                'requirements/assets/icon-sun.svg',
                width: 19,
                height: 19,
              ),
            ),
          ),

          // profile
          Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'requirements/assets/image-avatar.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
