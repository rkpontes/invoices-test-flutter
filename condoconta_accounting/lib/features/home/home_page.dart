import 'package:condoconta_accounting/core/components/form/button_rounded_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/body/body_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/content_area_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/header/header.dart';
import 'package:condoconta_accounting/core/components/form/text_field.dart';
import 'package:condoconta_accounting/core/components/sidebar/sidebar_widget.dart';
import 'package:condoconta_accounting/core/components/template_builder.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final system = Get.find<SystemService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141625),
      body: TemplateBuilder(
        sidebarWidget: const SidebarWidget(),
        contentAreaWidget: ContentAreaWidget(
          headerWidget: HeaderWidget(
            title: "Invoices",
            subtitle: "There are 7 total invoices",
            actionButton: ButtonRoundedWidget(
              icon: SvgPicture.asset(
                'requirements/assets/icon-plus.svg',
              ),
              text: "New Invoice",
              onTap: () => system.openModal(_formNewInvoice),
            ),
          ),
          bodyWidget: BodyWidget(
            children: const [
              InvoiceItemList(),
              InvoiceItemList(),
              InvoiceItemList(),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: avoid_unnecessary_containers
  Widget? _formNewInvoice() => Container(
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                "New Invoice",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.53,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Bill From",
                style: TextStyle(
                  color: Color(0xff7d5cf6),
                  fontSize: 12,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 25),
              const TextFieldWidget(label: 'Street Address'),
              Row(
                children: const [
                  Expanded(child: TextFieldWidget(label: 'City')),
                  SizedBox(width: 22),
                  Expanded(child: TextFieldWidget(label: 'Postal Code')),
                  SizedBox(width: 22),
                  Expanded(child: TextFieldWidget(label: 'Country')),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                "Bill To",
                style: TextStyle(
                  color: Color(0xff7d5cf6),
                  fontSize: 12,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 25),
              const TextFieldWidget(label: "Client's Name"),
              const SizedBox(height: 25),
              const TextFieldWidget(label: "Client's E-mail"),
              const SizedBox(height: 25),
              const TextFieldWidget(label: "Street Address"),
              const SizedBox(height: 25),
              Row(
                children: const [
                  Expanded(child: TextFieldWidget(label: 'City')),
                  SizedBox(width: 22),
                  Expanded(child: TextFieldWidget(label: 'Postal Code')),
                  SizedBox(width: 22),
                  Expanded(child: TextFieldWidget(label: 'Country')),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: const [
                  Expanded(child: TextFieldWidget(label: 'Issue Date')),
                  SizedBox(width: 22),
                  Expanded(child: TextFieldWidget(label: 'Payment Terms')),
                ],
              ),
              const SizedBox(height: 25),
              const TextFieldWidget(label: "Project Description"),
              const SizedBox(height: 25),
              const Text(
                "Item List",
                style: TextStyle(
                  color: Color(0xff777e98),
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 25),
              //

              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
            ],
          ),
        ),
      );
}
