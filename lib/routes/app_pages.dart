import 'package:flutter_avanzado/binding/home_binding.dart';
import 'package:flutter_avanzado/ui/pages/home_page.dart';
import 'package:flutter_avanzado/ui/pages/status_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.STATUSPAGE,
      page: () => StatusPages(),
    ),
  ];
}
