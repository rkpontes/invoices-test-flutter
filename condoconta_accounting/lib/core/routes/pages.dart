import 'package:condoconta_accounting/features/home/home_binding.dart';
import 'package:condoconta_accounting/features/home/home_page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    )
  ];
}
