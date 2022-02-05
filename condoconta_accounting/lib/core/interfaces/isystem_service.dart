import 'package:flutter/material.dart';

abstract class ISystemService {
  Future<void> openModal(Widget formNewInvoice);
  void closeModal();
}
