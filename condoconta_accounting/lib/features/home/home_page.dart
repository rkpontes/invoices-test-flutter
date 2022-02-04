import 'package:condoconta_accounting/core/components/form/button_icon_rounded_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/body/body_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/content_area_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/header/header.dart';
import 'package:condoconta_accounting/core/components/sidebar/sidebar_widget.dart';
import 'package:condoconta_accounting/core/components/template_builder.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_form/invoice_form.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'widgets/invoice_item_list.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final system = Get.find<SystemService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141625),
      body: Obx(() => TemplateBuilder(
            sidebarWidget: const SidebarWidget(),
            contentAreaWidget: ContentAreaWidget(
              headerWidget: HeaderWidget(
                title: "Invoices",
                subtitle: controller.service.list.isNotEmpty
                    ? "There are ${controller.service.list.length} total invoices"
                    : "No invoices",
                actionButton: ButtonIconRoundedWidget(
                  icon: SvgPicture.asset(
                    'requirements/assets/icon-plus.svg',
                  ),
                  text: "New Invoice",
                  onTap: () => system
                      // ignore: avoid_unnecessary_containers
                      .openModal(
                          // ignore: avoid_unnecessary_containers
                          Container(child: InvoiceForm(invoice: null))),
                ),
              ),
              bodyWidget: controller.service.list.isNotEmpty
                  ? BodyWidget(
                      children: controller.service.list
                          .map(
                            (e) => InvoiceItemList(
                              item: e,
                              onTap: () => controller.openToShowPage(e),
                              /* onTap: () => system.openModal(
                          Container(
                            child: InvoiceForm(invoice: e),
                          ),
                        ), */
                            ),
                          )
                          .toList(),
                    )
                  : BodyWidget(),
            ),
          )),
    );
  }
}
