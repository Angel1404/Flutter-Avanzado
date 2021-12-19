import 'package:flutter/material.dart';
import 'package:flutter_avanzado/controller/gps_controller.dart';
import 'package:flutter_avanzado/data/services/sockets_services.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SocketsService());
  Get.put(GpsController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.GPSPERMISSION,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ),
  );
}
