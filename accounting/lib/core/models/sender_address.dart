class SenderAddress {
  String? street;
  String? city;
  String? postCode;
  String? country;

  SenderAddress({this.street, this.city, this.postCode, this.country});

  SenderAddress.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    postCode = json['postCode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['city'] = city;
    data['postCode'] = postCode;
    data['country'] = country;
    return data;
  }
}
