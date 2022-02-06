import 'package:condoconta_accounting/core/components/toast.dart';
import 'package:condoconta_accounting/core/constrants/colors.dart';
import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:condoconta_accounting/core/models/item.dart';
import 'package:condoconta_accounting/core/models/sender_address.dart';
import 'package:condoconta_accounting/core/services/invoice_service.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:condoconta_accounting/features/show/show_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InvoiceFormController extends GetxController {
  final service = Get.find<InvoiceService>();
  final system = Get.find<SystemService>();
  final dateTextController = TextEditingController();

  Invoice? invoice = Invoice(
    clientAddress: SenderAddress(),
    senderAddress: SenderAddress(),
    items: <Item>[],
  );

  String id = "";
  String dateNow = "";
  RxList<Item> items = <Item>[
    Item(),
  ].obs;

  void loadController(Invoice inv) {
    invoice = inv;
    items.assignAll(inv.items!);
  }

  void clearController() {
    invoice = Invoice(
      clientAddress: SenderAddress(),
      senderAddress: SenderAddress(),
      items: <Item>[],
    );

    id = "";
    dateNow = "";
    items.assignAll(
      <Item>[
        Item(),
      ],
    );
  }

  void onAddNewItemButtonClick() {
    items.add(Item());
    Get.appUpdate();
  }

  void onSaveDraftButtonClick() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    dateNow = formatter.format(now);

    // Init
    if (invoice?.id == null) {
      invoice!.idGenerator();
    }

    invoice!.status = "draft";
    invoice!.createdAt = dateNow;
    invoice!.items = items.toList();

    // insert paymentDue
    if (invoice?.paymentTerms != null) {
      var payDate = now.add(Duration(days: invoice!.paymentTerms!));
      var payDateFormat = formatter.format(payDate);
      invoice!.paymentDue = payDateFormat;
    }

    // total update
    var total = 0.0;
    // ignore: avoid_function_literals_in_foreach_calls
    items.forEach((e) {
      total += e.total.value;
    });
    invoice!.total = total;

    service.update(invoice!);

    // if show instanced, update
    if (Get.isRegistered<ShowController>()) {
      Get.find<ShowController>().update();
    }
    Get.appUpdate();
    system.closeModal();

    ToastWidget(
      backgroundColor: Colors.green,
      textColor: Colors.white,
    ).show("Success", "The invoice ${invoice!.id} has been saved as a draft");

    clearController();
  }

  void onSaveAndSendButtonClick() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    dateNow = formatter.format(now);

    // Init
    if (invoice?.id == null) {
      invoice!.idGenerator();
    }
    invoice!.status = "pending";
    invoice!.createdAt = dateNow;
    invoice!.items = items.toList();

    if (validateModel() == null) {
      // insert paymentDue
      if (invoice?.paymentTerms != null) {
        var payDate = now.add(Duration(days: invoice!.paymentTerms!));
        var payDateFormat = formatter.format(payDate);
        invoice!.paymentDue = payDateFormat;
      }

      // total update
      var total = 0.0;
      // ignore: avoid_function_literals_in_foreach_calls
      items.forEach((e) {
        total += e.total.value;
      });
      invoice!.total = total;

      service.update(invoice!);

      // if show instanced, update
      if (Get.isRegistered<ShowController>()) {
        Get.find<ShowController>().update();
      }
      Get.appUpdate();
      system.closeModal();

      ToastWidget(
        backgroundColor: Colors.green,
        textColor: Colors.black,
      ).show("Success", "The invoice ${invoice!.id} has been saved and sent.");

      clearController();
    }
  }

  String? validateModel() {
    var message = "";
    if (invoice?.senderAddress?.street == null) {
      message = "The field 'Street Address' is required.";
    } else if (invoice?.senderAddress?.city == null) {
      message = "The field 'City' is required.";
    } else if (invoice?.senderAddress?.postCode == null) {
      message = "The field 'Postal Code' is required.";
    } else if (invoice?.senderAddress?.country == null) {
      message = "The field 'Country' is required.";
    } else if (invoice?.clientName == null) {
      message = "The field 'Client's Name' is required.";
    } else if (invoice?.clientEmail == null) {
      message = "The field 'Client's  E-mail' is required.";
    } else if (invoice?.clientAddress?.street == null) {
      message = "The field 'Street Address' is required.";
    } else if (invoice?.clientAddress?.city == null) {
      message = "The field 'City' is required.";
    } else if (invoice?.clientAddress?.postCode == null) {
      message = "The field 'Postal Code' is required.";
    } else if (invoice?.clientAddress?.country == null) {
      message = "The field 'Country' is required.";
    } else if (invoice?.createdAt == null) {
      message = "The field 'Issue Date' is required.";
    } else if (invoice?.paymentTerms == null) {
      message = "The field 'Payment Terms' is required.";
    } else if (invoice?.description == null) {
      message = "The field 'Project Description' is required.";
    } else if (items.isNotEmpty) {
      for (var e in items) {
        if (e.name == null) {
          message = "The item is missing name";
          break;
        }
        if (e.quantity == null) {
          message = "The item '${e.name ?? ''}' is missing quantity";
          break;
        }
        if (e.price == null) {
          message = "The item '${e.name ?? ''}' is missing price";
          break;
        }
      }
    }

    if (message != "") {
      ToastWidget(
        backgroundColor: Colors.red,
        textColor: Colors.white,
      ).show("Validation Error", message);
      return message;
    }

    return null;
  }

  void onDiscardButtonClick() {
    clearController();
    system.closeModal();
  }

  String? changePaymentTermsText() {
    switch (invoice?.paymentTerms) {
      case 1:
        return 'Net 1 day';
      case 7:
        return 'Net 7 days';
      case 30:
        return 'Net 30 days';
      default:
        return null;
    }
  }

  void calculatorTotalAsIndex(int index) {
    var price = items[index].price ?? 0.00;
    var quantity = items[index].quantity ?? 0;

    items[index].total.value = price * quantity;

    Get.appUpdate();
  }

  void showCalendar(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2040, 12),
        builder: (context, picker) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.white,
                onPrimary: Colors.black,
                surface: primary1Color,
                onSurface: Colors.white,
              ),
              dialogBackgroundColor: primary2Color,
            ),
            child: picker!,
          );
        }).then((selectedDate) {
      if (selectedDate != null) {
        invoice?.paymentDue = selectedDate.toString().split(" ")[0];
        dateTextController.text = selectedDate.toString().split(" ")[0];
      }
    });
  }
}
