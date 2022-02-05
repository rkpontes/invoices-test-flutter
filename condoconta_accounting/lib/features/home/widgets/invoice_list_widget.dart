import 'package:condoconta_accounting/core/components/form/text_field.dart';
import 'package:condoconta_accounting/core/models/item.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'invoice_form/invoice_form_controller.dart';

class InvoiceListWidget extends StatelessWidget {
  const InvoiceListWidget(
      {required this.controller, this.list = const <Item>[], Key? key})
      : super(key: key);
  final List<Item>? list;
  final InvoiceFormController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // ignore: sized_box_for_whitespace
      return Container(
        width: constraints.maxWidth,
        //color: Colors.green,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: constraints.maxWidth / 3.3,
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text(
                    "Item List",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                Container(
                  width: constraints.maxWidth / 7,
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text(
                    "Qtd.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                Container(
                  width: constraints.maxWidth / 4.4,
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text(
                    "Price",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                Container(
                  width: constraints.maxWidth / 4.4,
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text(
                    "Total",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            list != null
                ? Column(
                    children: list!
                        .asMap()
                        .entries
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: constraints.maxWidth / 3.3,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextFieldWidget(
                                    initialValue: e.value.name ?? '',
                                    fontSize: 10,
                                    onChange: (str) {
                                      controller.items[e.key].name = str;
                                    },
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth / 7,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextFieldWidget(
                                    initialValue: e.value.quantity != null
                                        ? e.value.quantity!.toString()
                                        : '',
                                    fontSize: 10,
                                    onChange: (str) {
                                      controller.items[e.key].quantity =
                                          int.parse(str);
                                      controller.calculatorTotalAsIndex(e.key);
                                    },
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth / 4.4,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextFieldWidget(
                                    initialValue: e.value.price != null
                                        ? e.value.price!.toString()
                                        : '',
                                    fontSize: 10,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      CurrencyTextInputFormatter(
                                        decimalDigits: 2,
                                        symbol: "£",
                                      ),
                                    ],
                                    onChange: (str) {
                                      controller.items[e.key].price =
                                          double.parse(str.replaceAll("£", ""));

                                      controller.calculatorTotalAsIndex(e.key);
                                    },
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth / 4.4,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Obx(
                                          () => Text(
                                            "£${e.value.total.value.toString()}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.items.removeAt(e.key);
                                          Get.appUpdate();
                                        },
                                        child: SvgPicture.asset(
                                          'requirements/assets/icon-delete.svg',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  )
                : Container(),
          ],
        ),
      );
    });
  }
}
