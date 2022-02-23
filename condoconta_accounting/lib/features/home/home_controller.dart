import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:condoconta_accounting/core/routes/pages.dart';
import 'package:condoconta_accounting/core/services/invoice_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final InvoiceService service = Get.find<InvoiceService>();

  @override
  void onInit() async {
    super.onInit();
    //await service.setData(); // TODO: uncomment to load base from json file
    service.list.assignAll(await service.loadData());
  }

  void openToShowPage(Invoice invoice) {
    var result = Get.toNamed("${Routes.show}?invoice=${invoice.id}");
    if (result != null) {
      service.loadData();
      Get.appUpdate();
    }
  }
}
