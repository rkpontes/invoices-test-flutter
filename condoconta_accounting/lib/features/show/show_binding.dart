import 'package:get/get.dart';

import 'show_controller.dart';

class ShowBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ShowController>(ShowController());
  }
}
