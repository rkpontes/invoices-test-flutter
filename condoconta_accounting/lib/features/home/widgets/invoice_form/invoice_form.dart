import 'package:condoconta_accounting/core/components/form/button_rounded_widget.dart';
import 'package:condoconta_accounting/core/components/form/text_field.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_list_widget.dart';
import 'package:condoconta_accounting/core/constrants/colors.dart';
import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'invoice_form_controller.dart';

class InvoiceForm extends StatelessWidget {
  InvoiceForm({required this.invoice, Key? key}) : super(key: key);

  final Invoice? invoice;
  final system = Get.find<SystemService>();

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return GetBuilder<InvoiceFormController>(
      init: InvoiceFormController(),
      builder: (ctrl) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                invoice != null
                    ? "Edit #${invoice!.id!.toUpperCase()}"
                    : "New Invoice",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.53,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Bill From",
                style: TextStyle(
                  color: Color(0xff7d5cf6),
                  fontSize: 12,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                label: 'Street Address',
                initialValue: invoice?.senderAddress?.street,
                //controller: ctrl.billFromStreetController,
                onChange: (str) {
                  ctrl.invoice.senderAddress?.street = str;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      label: 'City',
                      initialValue: invoice?.senderAddress?.city,
                      onChange: (str) {
                        ctrl.invoice.senderAddress?.city = str;
                      },
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      label: 'Postal Code',
                      initialValue: invoice?.senderAddress?.postCode,
                      onChange: (str) {
                        ctrl.invoice.senderAddress?.postCode = str;
                      },
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      label: 'Country',
                      initialValue: invoice?.senderAddress?.country,
                      onChange: (str) {
                        ctrl.invoice.senderAddress?.country = str;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                "Bill To",
                style: TextStyle(
                  color: Color(0xff7d5cf6),
                  fontSize: 12,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                label: "Client's Name",
                initialValue: invoice?.clientName,
                onChange: (str) {
                  ctrl.invoice.clientName = str;
                },
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                label: "Client's E-mail",
                initialValue: invoice?.clientEmail,
                keyboardType: TextInputType.emailAddress,
                onChange: (str) {
                  ctrl.invoice.clientEmail = str;
                },
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                label: "Street Address",
                initialValue: invoice?.clientAddress?.street,
                onChange: (str) {
                  ctrl.invoice.clientAddress?.street = str;
                },
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      label: 'City',
                      initialValue: invoice?.clientAddress?.city,
                      onChange: (str) {
                        ctrl.invoice.clientAddress?.city = str;
                      },
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      label: 'Postal Code',
                      initialValue: invoice?.clientAddress?.postCode,
                      onChange: (str) {
                        ctrl.invoice.clientAddress?.postCode = str;
                      },
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      label: 'Country',
                      initialValue: invoice?.clientAddress?.country,
                      onChange: (str) {
                        ctrl.invoice.clientAddress?.country = str;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      label: 'Issue Date',
                      initialValue: invoice?.paymentDue,
                      onChange: (str) {
                        ctrl.invoice.paymentDue = str;
                      },
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      label: 'Payment Terms',
                      initialValue: invoice?.paymentTerms.toString(),
                      onChange: (str) {
                        ctrl.invoice.paymentTerms = 1;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                label: "Project Description",
                initialValue: invoice?.description,
                onChange: (str) {
                  ctrl.invoice.description = str;
                },
              ),
              const SizedBox(height: 25),
              const Text(
                "Item List",
                style: TextStyle(
                  color: Color(0xff777e98),
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 25),
              Obx(
                () =>
                    InvoiceListWidget(controller: ctrl, list: ctrl.items.value),
              ),
              const SizedBox(height: 25),
              ButtonRoundedWidget(
                onTap: ctrl.onAddNewItemButtonClick,
                text: "+ Add New Item",
                color: primary2Color,
                textColor: Colors.white,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: ButtonRoundedWidget(
                      onTap: ctrl.onDiscardButtonClick,
                      text: "Discard",
                      color: Colors.white,
                      textColor: accentColor,
                    ),
                  ),
                  const SizedBox(width: 80),
                  Expanded(
                    child: ButtonRoundedWidget(
                      onTap: ctrl.onSaveDraftButtonClick,
                      text: "Save as Draft",
                      color: primary2Color,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ButtonRoundedWidget(
                      onTap: () {},
                      text: "Save & Send",
                      color: accentColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
