import 'package:condoconta_accounting/core/components/content_area/header/button_rounded_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/header/filter_page_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/header/title_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyHeaderWidget extends StatelessWidget {
  const BodyHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          TitlePageWidget(
            title: "Invoices",
            subtitle: "There are 7 total invoices",
          ),
          Spacer(),
          FilterPageWidget(),
          ButtonRoundedWidget(),
        ],
      ),
    );
  }
}
