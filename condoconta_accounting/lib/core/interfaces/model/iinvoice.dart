abstract class IInvoice {
  IInvoice.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
  String idGenerator();
}
