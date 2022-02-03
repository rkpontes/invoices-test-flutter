import 'package:condoconta_accounting/core/components/form/text_field.dart';
import 'package:condoconta_accounting/core/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvoiceListWidget extends StatelessWidget {
  const InvoiceListWidget({this.list = const <Item>[], Key? key})
      : super(key: key);
  final List<Item>? list;

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
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: constraints.maxWidth / 3.3,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextFieldWidget(
                                    initialValue: e.name,
                                    fontSize: 10,
                                    readOnly: true,
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth / 7,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextFieldWidget(
                                    initialValue: e.quantity!.toString(),
                                    fontSize: 10,
                                    readOnly: true,
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth / 4.4,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: TextFieldWidget(
                                    initialValue: e.price!.toString(),
                                    fontSize: 10,
                                    readOnly: true,
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth / 4.4,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          e.total.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
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
