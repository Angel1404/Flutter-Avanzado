import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_avanzado/data/models/bands.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<Band> list = [
    Band(id: '1', name: 'Rock Lee', votes: 10),
    Band(id: '2', name: 'Metal fusion', votes: 2),
    Band(id: '3', name: 'Dynamoc Roc', votes: 5),
  ].obs;
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
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, i) => _ModelCard(band: list[i])),
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
      list.add(
        Band(name: name, id: DateTime.now().toString(), votes: 0),
      );
    }
    Get.back();
  }
}

class _ModelCard extends StatelessWidget {
  const _ModelCard({Key? key, required this.band}) : super(key: key);
  final Band band;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(band.name!.substring(0, 2)),
      ),
      title: Text('${band.name}'),
      trailing: Text('${band.votes} '),
    );
  }
}
