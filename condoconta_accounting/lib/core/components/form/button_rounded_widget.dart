import 'package:flutter/material.dart';

class ButtonRoundedWidget extends StatelessWidget {
  const ButtonRoundedWidget({this.text, this.icon, this.onTap, Key? key})
      : super(key: key);

  final String? text;
  final Widget? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
              child: icon,
            ),
            const SizedBox(width: 4),
            Text(
              text ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
                letterSpacing: 1.02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
