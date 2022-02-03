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
                controller: ctrl.billFromStreetController,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      label: 'City',
                      initialValue: invoice?.senderAddress?.city,
                      controller: ctrl.billFromCityController,
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      label: 'Postal Code',
                      initialValue: invoice?.senderAddress?.postCode,
                      controller: ctrl.billFromPostalCodeController,
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      label: 'Country',
                      initialValue: invoice?.senderAddress?.country,
                      controller: ctrl.billFromCountryController,
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
                controller: ctrl.billToClientNameController,
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                label: "Client's E-mail",
                initialValue: invoice?.clientEmail,
                controller: ctrl.billToClientEmailController,
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                label: "Street Address",
                initialValue: invoice?.clientAddress?.street,
                controller: ctrl.billToStreetController,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      label: 'City',
                      initialValue: invoice?.clientAddress?.city,
                      controller: ctrl.billToCityController,
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      label: 'Postal Code',
                      initialValue: invoice?.clientAddress?.postCode,
                      controller: ctrl.billToPostalCodeController,
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      label: 'Country',
                      initialValue: invoice?.clientAddress?.country,
                      controller: ctrl.billToCountryController,
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
                      controller: ctrl.issueDateController,
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                        label: 'Payment Terms',
                        initialValue: invoice?.paymentTerms.toString(),
                        controller: ctrl.paymentTermsController),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                label: "Project Description",
                initialValue: invoice?.description,
                controller: ctrl.projectDescriptionController,
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
              InvoiceListWidget(list: invoice?.items),
              const SizedBox(height: 25),
              ButtonRoundedWidget(
                onTap: () {},
                text: "+ Add New Item",
                color: primary2Color,
                textColor: Colors.white,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: ButtonRoundedWidget(
                      onTap: () => system.closeModal(),
                      text: "Discard",
                      color: Colors.white,
                      textColor: accentColor,
                    ),
                  ),
                  const SizedBox(width: 80),
                  Expanded(
                    child: ButtonRoundedWidget(
                      onTap: () {},
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
