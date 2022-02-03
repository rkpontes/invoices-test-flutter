import 'package:condoconta_accounting/core/constrants/currency.dart';
import 'package:condoconta_accounting/core/constrants/date.dart';
import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:condoconta_accounting/core/constrants/text.dart';

class InvoiceItemList extends StatelessWidget {
  const InvoiceItemList({required this.item, this.onTap, Key? key})
      : super(key: key);
  final Invoice item;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff1f213a),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 21,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
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
                  "${item.id}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xfff8f8f8),
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "Due ${dateFormat(item.paymentDue!)}",
              style: const TextStyle(
                color: Color(0xfff8f8f8),
                fontSize: 13,
                letterSpacing: 0.71,
              ),
            ),
            const Spacer(),
            Text(
              "${item.clientName}",
              style: const TextStyle(
                color: Color(0xfff8f8f8),
                fontSize: 12,
                letterSpacing: 0.66,
              ),
            ),
            const Spacer(),
            Text(
              //"£1,800.90",
              "£${currencyFormat.format(item.total)}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xfff8f8f8),
                fontSize: 20,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Container(
              width: 140,
              height: 39,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: item.status == 'paid'
                    ? const Color(0xff1f2c3f)
                    : item.status == 'pending'
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
                      color: item.status == 'paid'
                          ? const Color(0xff61d7a0)
                          : item.status == 'pending'
                              ? const Color(0xffce7732)
                              : const Color(0xffadb1c7),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    capitalize(item.status!),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: item.status == 'paid'
                          ? const Color(0xff61d7a0)
                          : item.status == 'pending'
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
            ),
            const SizedBox(width: 20),
            SvgPicture.asset(
              'requirements/assets/icon-arrow-right.svg',
            ),
          ],
        ),
      ),
    );
  }
}
