import 'dart:convert';

import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InvoiceService extends GetxService {
  Future<List<Invoice>> loadData() async {
    final String response =
        await rootBundle.loadString('../requirements/assets/data.json');
    final data = await json.decode(response);
    //print(data);
    List<Invoice> invoices = <Invoice>[];
    data.forEach((e) {
      invoices.add(Invoice.fromJson(e));
    });

    return invoices;
  }
}
