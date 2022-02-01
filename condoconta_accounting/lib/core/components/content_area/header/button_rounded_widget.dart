import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonRoundedWidget extends StatelessWidget {
  const ButtonRoundedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xff7d5cf6),
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: SvgPicture.asset(
              'requirements/assets/icon-plus.svg',
            ),
          ),
          const SizedBox(width: 4),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff7c5dfa),
            ),
            child: SvgPicture.asset('requirements/assets/icon-plus.svg'),
          ),
          const SizedBox(width: 4),
          const Text(
            "New Invoice",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              letterSpacing: 1.02,
            ),
          ),
        ],
      ),
    );
  }
}
