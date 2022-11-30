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
  var controller = Get.find<PagInicialController>();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //     controller.readMsg();

  // }

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
              controller: controller.msgEC,
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
                    controller.saveMsg();
                  },
                  child: Text('ADD'),
                )),
          ]),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Obx((() => Text(controller.msgInicial.value)))],
            )),
          )
          // Expanded(
          //   child: ListView.builder(
          //       padding: EdgeInsets.only(top: 10),
          //       itemCount: list.length,
          //       itemBuilder: (context, index) {
          //         return CheckboxListTile(
          //           title: Text(list[index]),
          //           value: true,
          //           onChanged: (_) {},
          //           secondary: CircleAvatar(
          //             child: Icon(Icons.check),
          //           ),
          //         );
          //       }),
          // )
        ]),
      ),
    );
  }
}
