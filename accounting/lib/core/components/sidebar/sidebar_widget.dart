import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.07,
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
      child: LayoutBuilder(
        builder: (_, size) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // logo
            Container(
              width: size.maxWidth,
              height: 110,
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
                      width: size.maxWidth,
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
                margin: const EdgeInsets.only(bottom: 30),
                child: SvgPicture.asset(
                  'requirements/assets/icon-sun.svg',
                  width: size.maxWidth * 0.2,
                  height: size.maxWidth * 0.2,
                ),
              ),
            ),

            // profile
            Container(
              padding: EdgeInsets.all(size.maxWidth * 0.3),
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
      ),
    );
  }
}
