import 'package:condoconta_accounting/core/models/invoice.dart';

abstract class IInvoiceService {
  Future setData();
  Future<List<Invoice>> loadData();
  Invoice? get(String id);
  void update(Invoice invoice);
  void insert(Invoice invoice);
  Future remove(Invoice invoice);
}
