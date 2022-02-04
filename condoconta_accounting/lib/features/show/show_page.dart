import 'package:condoconta_accounting/core/components/content_area/body/body_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/content_area_widget.dart';
import 'package:condoconta_accounting/core/components/form/button_rounded_widget.dart';
import 'package:condoconta_accounting/core/components/sidebar/sidebar_widget.dart';
import 'package:condoconta_accounting/core/components/template_builder.dart';
import 'package:condoconta_accounting/core/constrants/colors.dart';
import 'package:condoconta_accounting/core/constrants/currency.dart';
import 'package:condoconta_accounting/core/constrants/date.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_item_status.dart';
import 'package:condoconta_accounting/features/show/widget/button_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'show_controller.dart';

class ShowPage extends StatelessWidget {
  const ShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowController>(
      init: ShowController(),
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xff141625),
        body: LayoutBuilder(
          builder: (_, constraints) => TemplateBuilder(
            sidebarWidget: const SidebarWidget(),
            contentAreaWidget: ContentAreaWidget(
              bodyWidget: BodyWidget(
                children: [
                  const ButtonBack(),
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primary2Color,
                    ),
                    padding: const EdgeInsets.only(left: 43),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Status",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 30),
                        InvoiceItemStatus(status: controller.invoice?.status),
                        const SizedBox(width: 30),
                        const Spacer(),
                        Expanded(
                          child: ButtonRoundedWidget(
                            onTap: controller.onEditButtonClick,
                            text: "Edit",
                            color: const Color(0xFF252946),
                            textColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ButtonRoundedWidget(
                            onTap: controller.onDeleteButtonClick,
                            text: "Delete",
                            color: const Color(0xFFED5758),
                            textColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ButtonRoundedWidget(
                            onTap: controller.onMarkAsPaidButtonClick,
                            text: "Mark as Paid",
                            color: accentColor,
                            textColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff1f213a),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(40),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    //"#XM9141",
                                    "#${controller.invoice?.id}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.invoice?.description ?? '--',
                                    style: const TextStyle(
                                      color: Color(0xff777e98),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    controller.invoice?.senderAddress?.street ??
                                        '--',
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    controller.invoice?.senderAddress?.city ??
                                        '--',
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    controller
                                            .invoice?.senderAddress?.postCode ??
                                        '--',
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    controller
                                            .invoice?.senderAddress?.country ??
                                        '--',
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(40),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Invoice Date",
                                    style: TextStyle(
                                      color: Color(0xff777e98),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    controller.invoice?.createdAt != null
                                        ? dateFormat(controller
                                            .invoice!.createdAt
                                            .toString())
                                        : "--",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 35),
                                  const Text(
                                    "Payment Due",
                                    style: TextStyle(
                                      color: Color(0xff777e98),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.invoice?.paymentDue != null
                                        ? dateFormat(controller
                                            .invoice!.paymentDue
                                            .toString())
                                        : "--",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Bill To",
                                    style: TextStyle(
                                      color: Color(0xff777e98),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    controller.invoice?.clientName ?? '--',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    controller.invoice?.clientAddress?.street ??
                                        '--',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    controller.invoice?.clientAddress?.city ??
                                        '--',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    controller
                                            .invoice?.clientAddress?.postCode ??
                                        '--',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    controller
                                            .invoice?.clientAddress?.country ??
                                        '--',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Sent to",
                                    style: TextStyle(
                                      color: Color(0xff777e98),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    controller.invoice?.clientEmail ?? '--',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 714,
                          height: 177,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                            color: Color(0xff252946),
                          ),
                          padding: const EdgeInsets.only(
                            left: 39,
                            right: 29,
                            top: 27,
                            bottom: 23,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Item Name",
                                    style: TextStyle(
                                      color: Color(0xff777e98),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "QTY.",
                                    style: TextStyle(
                                      color: Color(0xff777e98),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                      color: Color(0xff777e98),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                      color: Color(0xff777e98),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 36.50),
                              controller.invoice?.items != null
                                  ? Column(
                                      children: controller.invoice!.items!
                                          .map((e) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 220,
                                                      child: Text(
                                                        e.name ?? '--',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontFamily: "Roboto",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Text(
                                                      "${e.quantity ?? 0}",
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontFamily: "Roboto",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      e.price != null
                                                          ? "£${currencyFormat.format(e.price)}"
                                                          : "0.00",
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontFamily: "Roboto",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      "£${currencyFormat.format(e.total)}",
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontFamily: "Roboto",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  : Container(),
                              //
                            ],
                          ),
                        ),
                        Container(
                          width: 714,
                          height: 85,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Colors.black,
                          ),
                          padding: const EdgeInsets.only(
                            left: 41,
                            right: 15,
                            top: 23,
                            bottom: 24,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Amount Due",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                controller.invoice?.total != null
                                    ? "£${currencyFormat.format(controller.invoice?.total)}"
                                    : "0.00",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
