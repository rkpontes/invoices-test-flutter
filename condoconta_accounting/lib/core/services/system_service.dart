import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemService extends GetxService {
  RxDouble? leftPosition = (-Get.width).obs;

  Rx<Widget?> modalChild = Container().obs;

  Future<void> openModal(Widget formNewInvoice) async {
    modalChild.value = formNewInvoice;
    leftPosition!.value = 0.0;
  }

  void closeModal() {
    leftPosition!.value = (-Get.width);
    Timer(const Duration(milliseconds: 600), () {
      modalChild.value = Container();
    });
  }
}
