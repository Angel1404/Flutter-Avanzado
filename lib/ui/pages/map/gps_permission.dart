import 'package:flutter/material.dart';
import 'package:flutter_avanzado/controller/gps_controller.dart';
import 'package:get/get.dart';

class GpsPermission extends StatelessWidget {
  const GpsPermission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: GpsController.to.isGpsEnabled.value
              ? _EnableGpsMessage()
              : _AcessBotton(),
        ),
      ),
    );
  }
}

class _AcessBotton extends StatelessWidget {
  const _AcessBotton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Es necesario el acceso al Gps'),
        TextButton(onPressed: () {}, child: Text('Permitir'))
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Debe habilitar el Gps');
  }
}
