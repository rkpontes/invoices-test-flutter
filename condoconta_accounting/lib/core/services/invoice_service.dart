import 'dart:convert';

import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'databa_service.dart';

class InvoiceService extends GetxService {
  Future setData() async {
    //DataBaseService().erase();
    final String response =
        await rootBundle.loadString('../requirements/assets/data.json');
    final data = await json.decode(response);
    List<Map> invoices = <Map>[];
    data.forEach((e) {
      Invoice data = Invoice.fromJson(e);
      invoices.add(data.toJson());
    });

    DataBaseService().set(key: 'invoices', value: invoices);
  }

  Future<List<Invoice>> loadData() async {
    List<Invoice> invoices = <Invoice>[];
    List data = await DataBaseService().get(key: 'invoices');

    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach((e) {
      //print(e);
      invoices.add(Invoice.fromJson(e));
    });

    return invoices;
  }
}
