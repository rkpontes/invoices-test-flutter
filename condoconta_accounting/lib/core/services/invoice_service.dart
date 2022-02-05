import 'dart:convert';

import 'package:condoconta_accounting/core/interfaces/iinvoice_service.dart';
import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'databa_service.dart';

class InvoiceService extends GetxService implements IInvoiceService {
  final DataBaseService _dataBaseService = DataBaseService();
  RxList<Invoice> list = <Invoice>[].obs;

  @override
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

  @override
  Future<List<Invoice>> loadData() async {
    List<Invoice> invoices = <Invoice>[];
    List data = await DataBaseService().get(key: 'invoices');
    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach((e) {
      invoices.add(Invoice.fromJson(e));
    });

    return invoices;
  }

  @override
  Invoice? get(String id) {
    for (var i = 0; i < list.length; i++) {
      if (list[i].id == id) {
        return list[i];
      }
    }

    return null;
  }

  @override
  void update(Invoice invoice) {
    var wasFound = false;
    for (var i = 0; i < list.length; i++) {
      if (list[i].id == invoice.id) {
        wasFound = true;
        list[i] = invoice;
        List<Invoice> saved = <Invoice>[];
        saved.assignAll(list);
        _dataBaseService.set(key: 'invoices', value: saved);
      }
    }

    if (!wasFound) {
      insert(invoice);
    }
  }

  @override
  void insert(Invoice invoice) {
    list.add(invoice);
    List<Invoice> saved = <Invoice>[];
    saved.assignAll(list);
    _dataBaseService.set(key: 'invoices', value: saved);
  }

  @override
  Future remove(Invoice invoice) async {
    for (var i = 0; i < list.length; i++) {
      if (list[i].id == invoice.id) {
        list.removeAt(i);
        List<Invoice> removed = <Invoice>[];
        removed.assignAll(list);
        _dataBaseService.set(key: 'invoices', value: removed);
      }
    }
  }
}
