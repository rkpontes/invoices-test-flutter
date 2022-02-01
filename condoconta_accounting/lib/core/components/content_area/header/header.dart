import 'package:condoconta_accounting/core/components/button_rounded_widget.dart';
import 'package:condoconta_accounting/core/components/filter_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/header/title_page_widget.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

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
          FilterWidget(),
          ButtonRoundedWidget(),
        ],
      ),
    );
  }
}
