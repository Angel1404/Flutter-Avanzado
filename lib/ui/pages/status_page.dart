import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_avanzado/data/services/sockets_services.dart';

class StatusPages extends StatelessWidget {
  const StatusPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = SocketsService();
    print(SocketsService.to);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Obx(() => Text('Server status : ${provider.serverStatus}'))],
      ),
    );
  }
}
