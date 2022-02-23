import 'dart:convert';
import 'package:condoconta_accounting/core/models/sender_address.dart';
import 'package:flutter_test/flutter_test.dart';
import 'mocks/sender_address_mock.dart';

void main() {
  group('SenderAddress Model test', () {
    test('Should receive a json and return a model', () async {
      final senderAddress =
          SenderAddress.fromJson(json.decode(senderAddressJsonResult));
      expect(senderAddress.street, isNotNull);
    });

    test('Should receive a model and return to json', () async {
      final senderAddress = senderAddressMock;
      expect(senderAddress.toJson(), isMap);
    });
  });
}
