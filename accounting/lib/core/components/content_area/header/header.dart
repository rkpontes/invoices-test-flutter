import 'package:condoconta_accounting/core/components/form/button_icon_rounded_widget.dart';
import 'package:condoconta_accounting/core/components/filter_widget.dart';
import 'package:condoconta_accounting/core/components/content_area/header/title_page_widget.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {required this.title,
      required this.subtitle,
      this.actionButton,
      Key? key})
      : super(key: key);
  final String title, subtitle;
  final ButtonIconRoundedWidget? actionButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitlePageWidget(
            title: title,
            subtitle: subtitle,
          ),
          const Spacer(),
          FilterWidget(),
          actionButton ?? Container(),
        ],
      ),
    );
  }
}
