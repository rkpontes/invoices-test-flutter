import 'package:condoconta_accounting/core/components/form/dropdown_field.dart';
import 'package:condoconta_accounting/core/services/invoice_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterWidget extends StatelessWidget {
  FilterWidget({Key? key}) : super(key: key);

  final service = Get.find<InvoiceService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 30),
      width: 200,
      child: DropdownField(
        key: service.formKey,
        list: const [
          "All",
          "Pending",
          "Paid",
          "Draft",
        ],
        value: service.filter.value == "All" || service.filter.value == ""
            ? null
            : service.filter.value,
        onChange: (str) {
          service.onFilter(str!.toLowerCase());
        },
        backgroundColor: Colors.transparent,
        decoration: const InputDecoration(
          hintText: "Filter by status",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
