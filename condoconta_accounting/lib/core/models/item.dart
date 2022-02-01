class Item {
  String? name;
  int? quantity;
  double? price;
  double? total;

  Item({this.name, this.quantity, this.price, this.total});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['total'] = total;
    return data;
  }
}
