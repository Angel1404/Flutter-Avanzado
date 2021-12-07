import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

//Conectando con el socket
class SocketsService extends GetxController {
  static SocketsService get to => Get.find<SocketsService>();
  final _serverstatus = 'Conectando'.obs;
  late io.Socket _socket;
  String get serverStatus => _serverstatus.value;
  io.Socket get socket => _socket;
  SocketsService() {
    _initConfig();
  }
  //Le creamos su constructor
//192.168.1.2
  void _initConfig() {
    _socket = io.io(
      'http://192.168.1.68:3000',
      io.OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
          .build(),
    );
    _socket.connect();
    _socket.on('connect', (data) {
      _serverstatus.value = 'Conectado';
    });
    _socket.on('disconnect', (data) {
      _serverstatus.value = 'desConectado';
    });

    _socket.on('messaje-ok', (payload) {});
  }
}
