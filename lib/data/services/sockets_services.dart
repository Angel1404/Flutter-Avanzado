import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

//Recibir los estados del socket
enum ServerStatus {
  Online,
  Offline,
  Connecting,
}

//Conectando con el socket
class SocketsService extends GetxController {
  static SocketsService get to => Get.find<SocketsService>();
  final _serverstatus = 'Conectando'.obs;

  get serverStatus => _serverstatus.value;
  SocketsService() {
    _initConfig();
  }
  //Le creamos su constructor
//192.168.1.2
  void _initConfig() {
    io.Socket socket = io.io(
      'http://127.0.0.1:3000',
      io.OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
          .build(),
    );
    socket.connect();
    socket.on('connect', (data) {
      print('Conectado');
      _serverstatus.value = 'Conectado';
    });
    socket.on('disconnect', (data) {
      print('desConectado');
      _serverstatus.value = 'desConectado';
    });
  }
}
