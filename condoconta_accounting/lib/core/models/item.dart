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
    this.total.value = total ?? 0.0;
  }

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    total.value = json['total'];
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
