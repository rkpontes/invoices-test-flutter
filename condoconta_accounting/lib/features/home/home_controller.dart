import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:condoconta_accounting/core/routes/pages.dart';
import 'package:condoconta_accounting/core/services/invoice_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final InvoiceService service = InvoiceService();
  RxList<Invoice> list = <Invoice>[].obs;

  @override
  void onInit() async {
    super.onInit();
    //await service.setData(); // TODO: chamar para carregar os dados do json
    list.assignAll(await service.loadData());
  }

  void openToShowPage(Invoice invoice) {
    Get.toNamed("${Routes.show}?invoice=${invoice.id}", arguments: invoice);
  }
}
