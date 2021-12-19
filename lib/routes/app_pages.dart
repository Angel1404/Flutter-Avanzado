import 'package:flutter_avanzado/binding/home_binding.dart';
import 'package:flutter_avanzado/ui/pages/home_page.dart';
import 'package:flutter_avanzado/ui/pages/map/gps_permission.dart';
import 'package:flutter_avanzado/ui/pages/map/loading.dart';
import 'package:flutter_avanzado/ui/pages/map/maps_screen.dart';
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
    GetPage(
      name: Routes.LOADING,
      page: () => const LoadingPage(),
    ),
    GetPage(
      name: Routes.GPSPERMISSION,
      page: () => const GpsPermission(),
    ),
    GetPage(
      name: Routes.MAPSPAGE,
      page: () => const MapsPage(),
    ),
  ];
}
