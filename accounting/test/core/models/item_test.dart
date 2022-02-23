import 'dart:convert';
import 'package:condoconta_accounting/core/models/item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'mocks/item_mock.dart';

void main() {
  group('Item Model test', () {
    test('Should receive a json and return a model', () async {
      final item = Item.fromJson(json.decode(itemJsonResult));
      expect(item.name, isNotNull);
    });

    test('Should receive a model and return to json', () async {
      final item = itemMock;
      expect(item.toJson(), isMap);
    });
  });
}
