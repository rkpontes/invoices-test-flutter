import 'package:flutter/material.dart';

class ButtonRoundedWidget extends StatelessWidget {
  const ButtonRoundedWidget(
      {this.text, this.textColor, this.color, this.onTap, Key? key})
      : super(key: key);

  final String? text;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color ?? const Color(0xff7d5cf6),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Center(
          child: Text(
            text ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 12,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              letterSpacing: 1.02,
            ),
          ),
        ),
      ),
    );
  }
}
