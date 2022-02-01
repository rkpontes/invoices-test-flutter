import 'package:condoconta_accounting/core/components/content_area/body/body_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/content_area_widget.dart';
import 'package:condoconta_accounting/core/components/sidebar/sidebar_widget.dart';
import 'package:condoconta_accounting/features/home/widgets/invoice_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: const Color(0xff141625),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SidebarWidget(),
            const Spacer(),
            ContentAreaWidget(
              child: BodyWidget(
                children: const [
                  InvoiceItemList(),
                  InvoiceItemList(),
                  InvoiceItemList(),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
