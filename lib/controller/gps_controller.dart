import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class GpsController extends GetxService {
  static GpsController get to => Get.find<GpsController>();

  late StreamSubscription<ServiceStatus> serviceStatusStream;

  //Este es para cuando
  final isGpsEnabled = false.obs;
  bool isGpsPermissionGranted = false;
  bool isDialog = false;

  @override
  void onInit() {
    super.onInit();
    proceso();
  }

  proceso() async {
    //ESTO VERIFICA SI TIENE PERMISO  LA APP DE ACCEDER A LA LOCALIZACION
    LocationPermission lp = await Geolocator.checkPermission();
    isGpsPermissionGranted = (lp == LocationPermission.always ||
        lp == LocationPermission.whileInUse);

    Geolocator.getServiceStatusStream().listen((ServiceStatus status) async {
      //Esto verifica si esta o no activada la localizacion
      isGpsEnabled.value = (status == ServiceStatus.enabled);
      if (!isGpsEnabled.value) {
        openDialog();
      } else {
        closeDialog();
      }
    });
    isGpsEnabled.value = await Geolocator.isLocationServiceEnabled();
    if (!isGpsEnabled.value) {
      openDialog();
    }
    var status;
    while (true) {
      if (!isGpsPermissionGranted) {
        status = await ph.Permission.location.request();
        if (status == ph.PermissionStatus.granted) {
          break;
        }
        if (status == ph.PermissionStatus.permanentlyDenied) {
          break;
        }
      }
    }
    if (status == ph.PermissionStatus.permanentlyDenied) {
      Get.defaultDialog(
        title: 'Vaya a configuraciones y permita la location',
        content: TextButton(
          onPressed: () {
            SystemNavigator.pop();
            exit(0);
          },
          child: Text('Salir de la app'),
        ),
      );
    }
  }

  openDialog() {
    isDialog = true;
    Get.defaultDialog(
      title: 'NECESARIO ACTIVAR EL GPS O LOCATION',
    );
  }

  closeDialog() {
    if (isDialog) {
      Get.back();
    }
  }
}
