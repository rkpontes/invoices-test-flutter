import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:condoconta_accounting/core/models/item.dart';
import 'package:condoconta_accounting/core/models/sender_address.dart';
import 'package:condoconta_accounting/core/services/invoice_service.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class InvoiceFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final service = Get.find<InvoiceService>();
  final system = Get.find<SystemService>();

  Invoice invoice = Invoice(
    clientAddress: SenderAddress(),
    senderAddress: SenderAddress(),
  );

  String id = "";
  String dateNow = "";
  RxList<Item> items = <Item>[
    Item(),
  ].obs;

  void onAddNewItemButtonClick() {
    items.add(Item());
    Get.appUpdate();
  }

  void onSaveDraftButtonClick() {
    print("onSaveDraftButtonClick");

    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    dateNow = dateFormat.format(DateTime.now());

    // Init
    invoice.id = idGenerator();
    invoice.status = "draft";
    invoice.createdAt = dateNow;
    invoice.paymentDue = dateNow; // TODO: analisar

    // Atualizando total
    var total = 0.0;
    // ignore: avoid_function_literals_in_foreach_calls
    items.forEach((e) {
      total += e.total.value;
    });
    invoice.total = total;

    print(invoice.toJson());

    service.update(invoice);
    Get.appUpdate();
    system.closeModal();
  }

  void onSaveAndSendButtonClick() {
    //
  }

  void onDiscardButtonClick() {
    system.closeModal();
  }

  String idGenerator() {
    const _validChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const _validNumbers = '0123456789';
    Random _rnd = Random();

    var step1 = String.fromCharCodes(Iterable.generate(
        2, (_) => _validChars.codeUnitAt(_rnd.nextInt(_validChars.length))));
    var step2 = String.fromCharCodes(Iterable.generate(4,
        (_) => _validNumbers.codeUnitAt(_rnd.nextInt(_validNumbers.length))));

    return '$step1$step2';
  }

  void calculatorTotalAsIndex(int index) {
    var price = items[index].price ?? 0.00;
    var quantity = items[index].quantity ?? 0;

    items[index].total.value = price * quantity;

    Get.appUpdate();
  }
}
