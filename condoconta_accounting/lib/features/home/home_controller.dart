import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:condoconta_accounting/core/services/invoice_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final InvoiceService service = InvoiceService();
  RxList<Invoice> list = <Invoice>[].obs;

  @override
  void onInit() async {
    super.onInit();
    list.assignAll(await service.loadData());
    print(list.length);
  }
}
