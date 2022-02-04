import 'package:condoconta_accounting/core/components/toast.dart';
import 'package:condoconta_accounting/core/constrants/colors.dart';
import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:condoconta_accounting/core/services/invoice_service.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_form/invoice_form.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_form/invoice_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowController extends GetxController {
  Invoice? invoice;
  final system = Get.find<SystemService>();
  final invoiceService = Get.find<InvoiceService>();

  @override
  void onInit() {
    super.onInit();

    invoice = Get.arguments;
    print(invoice!.toJson());
  }

  void onEditButtonClick() async {
    Get.find<InvoiceFormController>().invoice = invoice;
    Get.find<InvoiceFormController>().items.assignAll(invoice!.items!);

    await system.openModal(
      // ignore: avoid_unnecessary_containers
      Container(
        child: InvoiceForm(),
      ),
    );
    update();
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
        ToastWidget(
          backgroundColor: Colors.green,
          textColor: Colors.black,
        ).show("Success", "The invoice '${invoice!.id}' has been removed");
      },
    );
  }

  void onMarkAsPaidButtonClick() {
    invoice!.status = 'paid';
    invoiceService.update(invoice!);
    update();
    Get.appUpdate();
    ToastWidget(
      backgroundColor: Colors.green,
      textColor: Colors.black,
    ).show("Success", "The invoice '${invoice!.id}' has been paid");
  }
}
