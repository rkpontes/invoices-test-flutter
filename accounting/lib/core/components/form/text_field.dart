import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    this.label,
    this.initialValue,
    this.controller,
    this.autofocus,
    this.keyboardType,
    this.obscureText,
    this.fontSize,
    this.readOnly,
    this.onChange,
    this.inputFormatters,
    this.onTap,
    this.suffix,
    this.prefix,
    this.validator,
    Key? key,
  }) : super(key: key);

  final String? label, initialValue;
  final TextEditingController? controller;
  final bool? autofocus, obscureText, readOnly;
  final TextInputType? keyboardType;
  final double? fontSize;
  final void Function(String str)? onChange;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix, prefix;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    if (controller != null) {
      controller!.text = initialValue ?? '';
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? FittedBox(
                  child: Text(
                    label!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
              : Container(),
          const SizedBox(height: 8),
          Container(
            height: 40,
            color: const Color(0xff1f213a),
            child: TextFormField(
              controller: controller,
              autofocus: autofocus ?? false,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              initialValue: controller == null ? initialValue : null,
              readOnly: readOnly ?? false,
              onChanged: onChange,
              onTap: onTap,
              inputFormatters: inputFormatters,
              validator: validator,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 14,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                suffix: suffix,
                prefix: prefix,
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
