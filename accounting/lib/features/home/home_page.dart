import 'package:condoconta_accounting/core/components/form/button_icon_rounded_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/body/body_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/content_area_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/header/header.dart';
import 'package:condoconta_accounting/core/components/sidebar/sidebar_widget.dart';
import 'package:condoconta_accounting/core/components/template_builder.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_form/invoice_form.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_form/invoice_form_controller.dart';
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
                  onTap: () {
                    Get.find<InvoiceFormController>().clearController();
                    system
                        // ignore: avoid_unnecessary_containers
                        .openModal(
                            // ignore: avoid_unnecessary_containers
                            Container(child: InvoiceForm()));
                  },
                ),
              ),
              bodyWidget: controller.service.list.isNotEmpty
                  ? Obx(() {
                      return BodyWidget(
                        children: controller.service.list.map((e) {
                          return Visibility(
                            visible: (controller.service.filter.value == "") ||
                                (controller.service.filter.value != "" &&
                                    controller.service.filter.value ==
                                        e.status),
                            child: InvoiceItemList(
                              item: e,
                              onTap: () => controller.openToShowPage(e),
                            ),
                          );
                        }).toList(),
                      );
                    })
                  : BodyWidget(),
            ),
          )),
    );
  }
}
