import 'package:intl/intl.dart';

String dateFormat(String str) =>
    DateFormat('d MMM y').format(DateTime.parse(str));
