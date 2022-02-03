import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemService extends GetxService {
  RxDouble? leftPosition = (-Get.width).obs;

  Rx<Widget?> modalChild = Container().obs;

  void openModal(Widget? Function() formNewInvoice) {
    modalChild.value = formNewInvoice.call();
    leftPosition!.value = 0.0;
  }

  void closeModal() {
    leftPosition!.value = (-Get.width);
    Timer(const Duration(milliseconds: 600), () {
      modalChild.value = Container();
    });
  }
}
