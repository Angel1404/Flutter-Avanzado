import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_avanzado/data/services/sockets_services.dart';

class StatusPages extends StatelessWidget {
  StatusPages({Key? key}) : super(key: key);

  final provider = SocketsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text('Server status : ${provider.serverStatus}'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.socket.emit('emit', 'Mandando mensaje');
              },
              child: const Text('Mandar mensaje'),
            ),
          ],
        ),
      ),
    );
  }
}
