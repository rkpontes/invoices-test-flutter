import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:condoconta_accounting/core/models/item.dart';
import 'package:condoconta_accounting/core/services/invoice_service.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_form/invoice_form_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  setUp(() {
    Get.put(GetStorage());
    Get.put(InvoiceService());
    Get.put(SystemService());
  });

  group('InvoiceFormController Controller Test', () {
    test('Should load the controller based on the received Invoice', () async {
      final controller = InvoiceFormController();
      await controller.loadController(Invoice(items: [Item()]));

      expect(controller.invoice != null, isTrue);
      expect(controller.items, isNotEmpty);
    });

    test('Should clear the controller leaving as the initial configuration',
        () async {
      final controller = InvoiceFormController();
      controller.clearController();

      expect(controller.invoice != null, isTrue);
      expect(controller.invoice?.id == null, isTrue);
      expect(controller.id, isIn(""));
    });

    test('Should add an item to the controller list', () async {
      final controller = InvoiceFormController();
      controller.onAddNewItemButtonClick();

      expect(controller.items.toList(), isNotEmpty);
    });

    test('Should save the updated Invoice with the data provided in the form',
        () async {
      final controller = InvoiceFormController();
      controller.save(false, "draft");

      expect(controller.invoice?.status, isNotNull);
      expect(controller.invoice?.createdAt, isNotNull);
      expect(controller.invoice?.total, isNotNull);
    });

    test('Should return the payment terms string referring to the int',
        () async {
      final controller = InvoiceFormController();
      controller.invoice!.paymentTerms = 7;

      expect(controller.changePaymentTermsText(), isIn("Net 7 days"));
    });
  });
}
