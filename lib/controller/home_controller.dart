import 'package:flutter_avanzado/data/models/bands.dart';
import 'package:flutter_avanzado/data/services/sockets_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late RxList<Band> list = RxList<Band>();
  @override
  void onInit() {
    super.onInit();
    SocketsService.to.socket.on('active-bands', (data) {
      list.value = (data as List).map((e) => Band.fromMap(e)).toList();
    });
  }

  @override
  void onClose() {
    SocketsService.to.socket.off('active-bands');
    super.onClose();
  }
}
