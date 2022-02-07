import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropdownField extends StatelessWidget {
  const DropdownField({
    required this.list,
    this.label,
    this.onChange,
    this.validator,
    this.value,
    this.hintText,
    this.decoration,
    this.backgroundColor,
    this.formKey,
    Key? key,
  }) : super(key: key);

  final List<String> list;
  final String? label, value, hintText;
  final String? Function(String?)? validator;
  final void Function(String? str)? onChange;
  final InputDecoration? decoration;
  final Color? backgroundColor;
  final GlobalKey? formKey;

  @override
  Widget build(BuildContext context) {
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
            height: 45,
            color: backgroundColor ?? const Color(0xff1f213a),
            child: DropdownButtonFormField<String>(
              key: formKey,
              isDense: true,
              icon: SvgPicture.asset('requirements/assets/icon-arrow-down.svg'),
              dropdownColor: const Color(0xff1f213a),
              validator: validator,
              value: value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
              decoration: decoration ??
                  InputDecoration(
                    hintText: hintText ?? "...",
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
              items: list.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChange,
            ),
          ),
        ],
      ),
    );
  }
}
