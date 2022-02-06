import 'package:condoconta_accounting/core/interfaces/iinvoice_service.dart';
import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _InvoiceService extends Mock implements IInvoiceService {}

void main() async {
  late _InvoiceService _service;

  setUp(() {
    _service = _InvoiceService();
  });

  test("should return a list of invoices when successful", () async {
    when(() => _service.loadData())
        .thenAnswer((_) async => [Invoice(id: 'AB1234')]);
    var res = await _service.loadData();
    expect(res.isNotEmpty, equals(true));
  });
}
