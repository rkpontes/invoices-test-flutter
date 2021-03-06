import 'package:condoconta_accounting/core/services/invoice_service.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:get/get.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SystemService(), permanent: true);
    Get.put(InvoiceService(), permanent: true);
  }
}
