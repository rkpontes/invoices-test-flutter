import 'package:condoconta_accounting/core/constrants/colors.dart';
import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:condoconta_accounting/core/routes/pages.dart';
import 'package:condoconta_accounting/core/services/invoice_service.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_form/invoice_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowController extends GetxController {
  Invoice? invoice;
  final system = Get.find<SystemService>();
  final invoiceService = Get.find<InvoiceService>();

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters['invoice'] != null) {
      invoice = invoiceService.get(Get.parameters['invoice']!);
    } else {
      invoice = Get.arguments;
    }
  }

  void onEditButtonClick() {
    system.openModal(
      // ignore: avoid_unnecessary_containers
      Container(
        child: InvoiceForm(invoice: invoice),
      ),
    );
    //invoiceService.save()
  }

  void onDeleteButtonClick() async {
    await Get.defaultDialog(
      title: "Do you want to remove?",
      content: Container(),
      buttonColor: primary2Color,
      onCancel: Get.back,
      onConfirm: () async {
        Get.close(1);
        await invoiceService.remove(invoice!);
        Get.back(result: true);
      },
    );
  }

  void onMarkAsPaidButtonClick() {
    //
  }
}
