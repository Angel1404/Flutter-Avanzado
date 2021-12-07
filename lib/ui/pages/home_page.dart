import 'package:flutter/material.dart';
import 'package:flutter_avanzado/controller/home_controller.dart';
import 'package:flutter_avanzado/data/services/sockets_services.dart';
import 'package:get/get.dart';
import 'package:flutter_avanzado/data/models/bands.dart';
import 'package:pie_chart/pie_chart.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Band Names',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          Obx(
            () => Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: (SocketsService.to.serverStatus == 'Conectado')
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.offline_bolt,
                      color: Colors.red,
                    ),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Obx(() => grafica()),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (_, i) => _ModelCard(band: controller.list[i]),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewBand(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  addNewBand(BuildContext _) {
    final textController = TextEditingController();
    //El plataform es para saber en que plataforma estas
    //y mostrar su diseño conrrespondiente
    // if (Platform.isAndroid) {
    showDialog(
      context: _,
      builder: (_) {
        return AlertDialog(
          title: const Text('New Band Name: ', textAlign: TextAlign.center),
          content: TextField(controller: textController),
          actions: [
            MaterialButton(
              onPressed: () {
                addBandToList(textController.text);
              },
              child: const Text('Add'),
              textColor: Colors.blueAccent,
            )
          ],
        );
      },
    );
//    }
  }

  addBandToList(String name) {
    if (name.length > 1) {
      SocketsService.to.socket.emit('add-band', {"name": name});
    }
    Get.back();
  }

  Widget grafica() {
    Map<String, double> myMap = {};
    controller.list.forEach((band) {
      myMap.putIfAbsent(band.name.toString(), () => band.votes.toDouble());
    });
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: PieChart(dataMap: myMap),
    );
  }
}

class _ModelCard extends StatelessWidget {
  const _ModelCard({Key? key, required this.band}) : super(key: key);
  final Band band;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(band.id.toString()),
      onDismissed: (value) {
        SocketsService.to.socket.emit('delete-band', {"id": band.id});
      },
      direction: DismissDirection.startToEnd,
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20.0),
        color: Colors.red,
        child: const Text(
          'Borrar Banda',
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}'),
        onTap: () {
          //Votar por una banda
          SocketsService.to.socket.emit('votes-band', {"id": band.id});
        },
      ),
    );
  }
}
