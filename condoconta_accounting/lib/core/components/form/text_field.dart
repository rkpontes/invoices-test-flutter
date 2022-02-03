import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.label,
    this.controller,
    this.autofocus,
    this.keyboardType,
    this.obscureText,
    Key? key,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 40,
            color: const Color(0xff1f213a),
            child: TextFormField(
              controller: controller,
              autofocus: autofocus ?? false,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.3),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.3),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    width: 0.3,
                    style: BorderStyle.solid,
                    color: Colors.grey,
                  ),
                ),
                //hintText: "Type in your text",
                hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
