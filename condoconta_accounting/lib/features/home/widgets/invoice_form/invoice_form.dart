import 'package:condoconta_accounting/core/components/form/button_rounded_widget.dart';
import 'package:condoconta_accounting/core/components/form/dropdown_field.dart';
import 'package:condoconta_accounting/core/components/form/text_field.dart';
import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_list_widget.dart';
import 'package:condoconta_accounting/core/constrants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'invoice_form_controller.dart';

class InvoiceForm extends StatelessWidget {
  InvoiceForm({Key? key}) : super(key: key);

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
                ctrl.invoice?.id != null
                    ? "Edit #${ctrl.invoice?.id!.toUpperCase()}"
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
                validator: (str) => ctrl.validateModel(),
                label: 'Street Address',
                initialValue: ctrl.invoice?.senderAddress?.street,
                //controller: ctrl.billFromStreetController,
                onChange: (str) {
                  ctrl.invoice!.senderAddress?.street = str;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      validator: (str) => ctrl.validateModel(),
                      label: 'City',
                      initialValue: ctrl.invoice?.senderAddress?.city,
                      onChange: (str) {
                        ctrl.invoice!.senderAddress?.city = str;
                      },
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      validator: (str) => ctrl.validateModel(),
                      label: 'Postal Code',
                      initialValue: ctrl.invoice?.senderAddress?.postCode,
                      onChange: (str) {
                        ctrl.invoice!.senderAddress?.postCode = str;
                      },
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      validator: (str) => ctrl.validateModel(),
                      label: 'Country',
                      initialValue: ctrl.invoice?.senderAddress?.country,
                      onChange: (str) {
                        ctrl.invoice!.senderAddress?.country = str;
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
                validator: (str) => ctrl.validateModel(),
                label: "Client's Name",
                initialValue: ctrl.invoice?.clientName,
                onChange: (str) {
                  ctrl.invoice!.clientName = str;
                },
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                validator: (str) => ctrl.validateModel(),
                label: "Client's E-mail",
                initialValue: ctrl.invoice?.clientEmail,
                keyboardType: TextInputType.emailAddress,
                onChange: (str) {
                  ctrl.invoice!.clientEmail = str;
                },
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                validator: (str) => ctrl.validateModel(),
                label: "Street Address",
                initialValue: ctrl.invoice?.clientAddress?.street,
                onChange: (str) {
                  ctrl.invoice!.clientAddress?.street = str;
                },
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      validator: (str) => ctrl.validateModel(),
                      label: 'City',
                      initialValue: ctrl.invoice?.clientAddress?.city,
                      onChange: (str) {
                        ctrl.invoice!.clientAddress?.city = str;
                      },
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      validator: (str) => ctrl.validateModel(),
                      label: 'Postal Code',
                      initialValue: ctrl.invoice?.clientAddress?.postCode,
                      onChange: (str) {
                        ctrl.invoice!.clientAddress?.postCode = str;
                      },
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: TextFieldWidget(
                      validator: (str) => ctrl.validateModel(),
                      label: 'Country',
                      initialValue: ctrl.invoice?.clientAddress?.country,
                      onChange: (str) {
                        ctrl.invoice!.clientAddress?.country = str;
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
                      validator: (str) => ctrl.validateModel(),
                      label: 'Issue Date',
                      controller: ctrl.dateTextController,
                      initialValue: ctrl.invoice?.paymentDue,
                      onTap: () => ctrl.showCalendar(context),
                      onChange: (str) {
                        ctrl.invoice!.createdAt = str;
                      },
                      suffix: SvgPicture.asset(
                          'requirements/assets/icon-calendar.svg'),
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: DropdownField(
                      validator: (str) => ctrl.validateModel(),
                      label: "Payment Terms",
                      value: ctrl.changePaymentTermsText(),
                      list: const <String>[
                        'Net 1 day',
                        'Net 7 days',
                        'Net 30 days'
                      ],
                      onChange: (str) {
                        switch (str) {
                          case 'Net 1 day':
                            ctrl.invoice!.paymentTerms = 1;
                            break;
                          case 'Net 7 days':
                            ctrl.invoice!.paymentTerms = 7;
                            break;
                          case 'Net 30 days':
                            ctrl.invoice!.paymentTerms = 30;
                            break;
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              TextFieldWidget(
                validator: (str) => ctrl.validateModel(),
                label: "Project Description",
                initialValue: ctrl.invoice?.description,
                onChange: (str) {
                  ctrl.invoice!.description = str;
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
                      onTap: ctrl.onSaveAndSendButtonClick,
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
