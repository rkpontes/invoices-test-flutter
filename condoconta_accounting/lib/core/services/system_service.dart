import 'dart:async';

import 'package:condoconta_accounting/core/interfaces/service/isystem_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemService extends GetxService implements ISystemService {
  RxDouble? leftPosition = (-Get.width).obs;

  Rx<Widget?> modalChild = Container().obs;

  @override
  Future<void> openModal(Widget formNewInvoice) async {
    modalChild.value = formNewInvoice;
    leftPosition!.value = 0.0;
  }

  @override
  void closeModal() {
    leftPosition!.value = (-Get.width);
    Timer(const Duration(milliseconds: 600), () {
      modalChild.value = Container();
    });
  }
}
