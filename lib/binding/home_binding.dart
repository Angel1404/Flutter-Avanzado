import 'package:flutter_avanzado/controller/gps_controller.dart';
import 'package:flutter_avanzado/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class GpsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GpsController>(GpsController());
  }
}
