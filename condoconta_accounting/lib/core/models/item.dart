import 'package:get/get.dart';

class Item {
  String? name;
  int? quantity;
  double? price;
  RxDouble total = 0.0.obs;

  Item({name, quantity, price, total}) {
    name = name;
    quantity = quantity;
    price = price;
    this.total.value = total?.toDouble() ?? 0.0;
  }

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = int.parse(json['quantity'].toString());
    price = double.parse(json['price'].toString());
    total.value = double.parse(json['total'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['total'] = total.value;
    return data;
  }
}
