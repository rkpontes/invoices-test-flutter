import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Filter by status",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              letterSpacing: 0.71,
            ),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset('requirements/assets/icon-arrow-down.svg'),
        ],
      ),
    );
  }
}
