import 'package:flutter/material.dart';

class TitlePageWidget extends StatelessWidget {
  const TitlePageWidget({required this.title, required this.subtitle, Key? key})
      : super(key: key);
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              letterSpacing: 1.76,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w300,
              letterSpacing: 0.66,
            ),
          ),
        ],
      ),
    );
  }
}
