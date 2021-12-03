import 'package:flutter/material.dart';
import 'package:flutter_avanzado/data/services/sockets_services.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() {
  Get.put(SocketsService());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.STATUSPAGE,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ),
  );
}
