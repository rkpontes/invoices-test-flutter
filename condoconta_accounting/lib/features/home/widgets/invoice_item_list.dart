import 'package:condoconta_accounting/core/constrants/currency.dart';
import 'package:condoconta_accounting/core/constrants/date.dart';
import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_item_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InvoiceItemList extends StatelessWidget {
  const InvoiceItemList({required this.item, this.onTap, Key? key})
      : super(key: key);
  final Invoice? item;
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
                  "${item!.id}",
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
              "Due ${item?.paymentDue != null ? dateFormat(item!.paymentDue!) : ''}",
              style: const TextStyle(
                color: Color(0xfff8f8f8),
                fontSize: 13,
                letterSpacing: 0.71,
              ),
            ),
            const Spacer(),
            Text(
              item?.clientName ?? '',
              style: const TextStyle(
                color: Color(0xfff8f8f8),
                fontSize: 12,
                letterSpacing: 0.66,
              ),
            ),
            const Spacer(),
            Text(
              "£${item?.total != null ? currencyFormat.format(item!.total) : ''}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xfff8f8f8),
                fontSize: 20,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            InvoiceItemStatus(status: item?.status),
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
