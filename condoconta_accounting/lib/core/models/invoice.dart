import 'item.dart';
import 'sender_address.dart';

class Invoice {
  String? id;
  String? createdAt;
  String? paymentDue;
  String? description;
  int? paymentTerms;
  String? clientName;
  String? clientEmail;
  String? status;
  SenderAddress? senderAddress;
  SenderAddress? clientAddress;
  List<Item>? items;
  double? total;

  Invoice(
      {this.id,
      this.createdAt,
      this.paymentDue,
      this.description,
      this.paymentTerms,
      this.clientName,
      this.clientEmail,
      this.status,
      this.senderAddress,
      this.clientAddress,
      this.items,
      this.total});

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    paymentDue = json['paymentDue'];
    description = json['description'];
    paymentTerms = json['paymentTerms'];
    clientName = json['clientName'];
    clientEmail = json['clientEmail'];
    status = json['status'];
    senderAddress = json['senderAddress'] != null
        ? SenderAddress.fromJson(json['senderAddress'])
        : null;
    clientAddress = json['clientAddress'] != null
        ? SenderAddress.fromJson(json['clientAddress'])
        : null;
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['paymentDue'] = paymentDue;
    data['description'] = description;
    data['paymentTerms'] = paymentTerms;
    data['clientName'] = clientName;
    data['clientEmail'] = clientEmail;
    data['status'] = status;
    if (senderAddress != null) {
      data['senderAddress'] = senderAddress!.toJson();
    }
    if (clientAddress != null) {
      data['clientAddress'] = clientAddress!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}
