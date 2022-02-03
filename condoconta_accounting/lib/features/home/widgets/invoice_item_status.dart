import 'package:condoconta_accounting/core/constrants/text.dart';
import 'package:flutter/material.dart';

class InvoiceItemStatus extends StatelessWidget {
  const InvoiceItemStatus({this.status, Key? key}) : super(key: key);

  final String? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 39,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: status == 'paid'
            ? const Color(0xff1f2c3f)
            : status == 'pending'
                ? const Color(0xff2b2735)
                : const Color(0xff2a2c43),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: status == 'paid'
                  ? const Color(0xff61d7a0)
                  : status == 'pending'
                      ? const Color(0xffce7732)
                      : const Color(0xffadb1c7),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            capitalize(status!),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: status == 'paid'
                  ? const Color(0xff61d7a0)
                  : status == 'pending'
                      ? const Color(0xffce7732)
                      : const Color(0xffadb1c7),
              fontSize: 13,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              letterSpacing: 0.71,
            ),
          ),
        ],
      ),
    );
  }
}
