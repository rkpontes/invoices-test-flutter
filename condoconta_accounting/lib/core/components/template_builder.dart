import 'package:condoconta_accounting/core/services/system_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'content_area/content_area_widget.dart';
import 'sidebar/sidebar_widget.dart';

class TemplateBuilder extends StatelessWidget {
  TemplateBuilder(
      {required this.contentAreaWidget, required this.sidebarWidget, Key? key})
      : super(key: key);
  final ContentAreaWidget contentAreaWidget;
  final SidebarWidget sidebarWidget;

  final system = Get.find<SystemService>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(
        children: [
          // Body
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                contentAreaWidget,
              ],
            ),
          ),
          Obx(
            () => Stack(
              children: [
                AnimatedPositioned(
                  left: system.leftPosition!.value,
                  top: 0,
                  duration: const Duration(milliseconds: 0),
                  child: InkWell(
                    onTap: system.closeModal,
                    child: Container(
                      width: Get.width,
                      height: Get.height,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  left: system.leftPosition!.value,
                  top: 0,
                  duration: const Duration(milliseconds: 400),
                  child: Container(
                    width: Get.width * 0.6,
                    height: Get.height,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Color(0xff141625),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(130, 10, 30, 30),
                      child: Obx(() => system.modalChild.value ?? Container()),
                    ),
                  ),
                ),
              ],
            ),
          ),
          sidebarWidget,
        ],
      ),
    );
  }
}
