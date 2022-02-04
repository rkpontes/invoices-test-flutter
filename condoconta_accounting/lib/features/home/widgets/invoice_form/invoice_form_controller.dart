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

  String id = "";
  final billFromStreetController = TextEditingController();
  final billFromCityController = TextEditingController();
  final billFromPostalCodeController = TextEditingController();
  final billFromCountryController = TextEditingController();
  final billToClientNameController = TextEditingController();
  final billToClientEmailController = TextEditingController();
  final billToStreetController = TextEditingController();
  final billToCityController = TextEditingController();
  final billToPostalCodeController = TextEditingController();
  final billToCountryController = TextEditingController();
  final issueDateController = TextEditingController();
  final paymentTermsController = TextEditingController();
  final projectDescriptionController = TextEditingController();
  String dateNow = "";
  RxList<Item>? items = <Item>[].obs;

  void onSaveDraftButtonClick() {
    print("onSaveDraftButtonClick");

    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    dateNow = dateFormat.format(DateTime.now());

    var invoice = Invoice(
      id: idGenerator(),
      createdAt: dateNow,
      paymentDue: dateNow, // TODO: analisar
      description: projectDescriptionController.text,
      paymentTerms:
          int.tryParse(paymentTermsController.text) ?? 0, // TODO: analisar
      clientName: billToClientNameController.text,
      clientEmail: billToClientEmailController.text,
      status: "draft",
      senderAddress: SenderAddress(
        street: billFromStreetController.text,
        city: billFromCityController.text,
        postCode: billFromPostalCodeController.text,
        country: billFromCountryController.text,
      ),
      clientAddress: SenderAddress(
        street: billToStreetController.text,
        city: billToCityController.text,
        postCode: billToPostalCodeController.text,
        country: billToCountryController.text,
      ),
    );

    // Atualizando total
    var total = 0.0;
    items?.forEach((e) {
      total += e.total!;
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
}
