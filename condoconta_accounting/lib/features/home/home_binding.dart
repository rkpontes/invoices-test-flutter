import 'package:condoconta_accounting/features/home/widgets/invoice_form/invoice_form_controller.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<InvoiceFormController>(InvoiceFormController());
  }
}
