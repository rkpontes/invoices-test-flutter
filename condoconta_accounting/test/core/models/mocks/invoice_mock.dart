import 'package:condoconta_accounting/core/models/invoice.dart';
import 'package:condoconta_accounting/core/models/item.dart';
import 'package:condoconta_accounting/core/models/sender_address.dart';

const invoiceJsonResult =
    '{"id": "RT3080","createdAt": "2021-08-18","paymentDue": "2021-08-19","description": "Re-branding","paymentTerms": 1,"clientName": "Jensen Huang","clientEmail": "jensenh@mail.com","status": "paid","senderAddress": {"street": "19 Union Terrace","city": "London","postCode": "E1 3EZ","country": "United Kingdom"},"clientAddress": {"street": "106 Kendell Street","city": "Sharrington","postCode": "NR24 5WQ","country": "United Kingdom"},"items": [{"name": "Brand Guidelines","quantity": 1,"price": 1800.90,"total": 1800.90}],"total": 1800.90}';

final invoiceMock = Invoice(
  id: 'AB1234',
  createdAt: "2022-01-01",
  paymentDue: "2022-01-01",
  description: "aaaa",
  paymentTerms: 7,
  clientName: "aaa",
  clientEmail: "aaaa",
  status: "pending",
  senderAddress: SenderAddress(
    street: "aaaaa",
    city: "aaaa",
    postCode: "aaaa",
    country: "aaaa",
  ),
  clientAddress: SenderAddress(
    street: "aaaaa",
    city: "aaaa",
    postCode: "aaaa",
    country: "aaaa",
  ),
  items: [
    Item(name: "aaaa", quantity: 1, price: 99, total: 99),
  ],
  total: 99,
);
