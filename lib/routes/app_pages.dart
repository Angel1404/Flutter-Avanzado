import 'package:flutter_avanzado/ui/pages/home_page.dart';
import 'package:flutter_avanzado/ui/pages/status_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.STATUSPAGE,
      page: () => const StatusPages(),
    ),
  ];
}
