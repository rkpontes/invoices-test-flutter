import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'header/body_header.dart';

class ContentAreaWidget extends StatelessWidget {
  const ContentAreaWidget({Key? key}) : super(key: key);

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
          const BodyHeaderWidget(),
          /* Container(
            padding: const EdgeInsets.only(top: 26),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xff1f213a),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 21,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "#",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff9277f7),
                          fontSize: 13,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.71,
                        ),
                      ),
                      Text(
                        "RT3080",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xfff8f8f8),
                          fontSize: 13,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 50),
                  const Text(
                    "Due 19 Aug 2021",
                    style: TextStyle(
                      color: Color(0xfff8f8f8),
                      fontSize: 13,
                      letterSpacing: 0.71,
                    ),
                  ),
                  const SizedBox(width: 50),
                  const Text(
                    "Jensen Huang",
                    style: TextStyle(
                      color: Color(0xfff8f8f8),
                      fontSize: 12,
                      letterSpacing: 0.66,
                    ),
                  ),
                  const SizedBox(width: 50),
                  const Text(
                    "£1,800.90",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xfff8f8f8),
                      fontSize: 20,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 50),
                  Container(
                    height: 39,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff1f2c3f),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 8.79,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff61d7a0),
                          ),
                        ),
                        const SizedBox(width: 16.18),
                        const Text(
                          "Paid",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff61d7a0),
                            fontSize: 13,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.71,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 50),
                  SvgPicture.asset('requirements/assets/icon-arrow-right.svg'),
                ],
              ),
            ),
          ), */
        ],
      ),
    );
  }
}
