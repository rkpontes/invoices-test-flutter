import 'dart:convert';

import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/invoice_mock.dart';

void main() {
  group('Invoice Model test', () {
    test('Should generate the random id in the model', () async {
      final invoice = Invoice();
      invoice.idGenerator();
      expect(invoice.id, isNotNull);
    });

    test('Should receive a json and return a model', () async {
      final invoice = Invoice.fromJson(json.decode(invoiceJsonResult));
      expect(invoice.id, isNotNull);
    });

    test('Should receive a model and return to json', () async {
      final invoice = invoiceMock;
      expect(invoice.toJson(), isMap);
    });
  });
}
