import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tarefa/pag_inicial/controller/controller_pag_inicial.dart';

class PagInicial extends StatefulWidget {
  const PagInicial({Key? key}) : super(key: key);

  @override
  State<PagInicial> createState() => _PagInicialState();
}

class _PagInicialState extends State<PagInicial> {
  @override
  void initState() {
    super.initState();

    Get.find<PagInicialController>().readList().then((value) {
      print(value);

      Get.find<PagInicialController>().listAction = json.decode(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Lista de Tarefas')),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child: Column(children: [
          Row(children: [
            Expanded(
                child: TextFormField(
              controller: Get.find<PagInicialController>().tarefaEC,
              decoration: InputDecoration(
                  labelText: 'Nova Tarefa :',
                  labelStyle: TextStyle(color: Colors.blueAccent)),
            )),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  onPressed: () {
                    Get.find<PagInicialController>().addAction();
                    Get.find<PagInicialController>().saveListButton();
                  },
                  child: Text('ADD'),
                )),
          ]),
          Expanded(
              child: Obx(
            () => ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: Get.find<PagInicialController>().listAction.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => CheckboxListTile(
                      title: Text(Get.find<PagInicialController>()
                          .listAction[index]['title']),
                      value: Get.find<PagInicialController>().listAction[index]
                          ['check'],
                      onChanged: (check) {
                        Get.find<PagInicialController>().listAction[index]
                            ['check'] = check;
                        Get.find<PagInicialController>().saveListCheck(
                            Get.find<PagInicialController>().listAction);
                      },
                      secondary: CircleAvatar(
                        child: Icon(Get.find<PagInicialController>()
                                .listAction[index]['check']
                            ? Icons.check
                            : Icons.error),
                      ),
                    ),
                  );
                }),
          ))
        ]),
      ),
    );
  }
}
