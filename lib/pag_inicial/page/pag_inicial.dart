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
              controller: controller.tarefaEC,
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
                    controller.addAction();
                    controller.saveListButton();
                  },
                  child: Text('ADD'),
                )),
          ]),
          Expanded(
            child: RefreshIndicator(
              displacement: 100,
              onRefresh: controller.listRefresh,
              child: Obx(
                () => ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: controller.listAction.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Dismissible(
                          onDismissed: ((direction) {
                            controller.deleteAction(index, context);
                          }),
                          key: Key(controller.listAction[index]['title']),
                          direction: DismissDirection.startToEnd,
                          background: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            color: Colors.red,
                          ),
                          child: CheckboxListTile(
                            title: Text(controller.listAction[index]['title']),
                            value: controller.listAction[index]['check'],
                            onChanged: (check) {
                              controller.listAction[index]['check'] = check;
                              controller.listAction.refresh();

                              controller.saveListCheck();
                            },
                            secondary: CircleAvatar(
                              child: Icon(controller.listAction[index]['check']
                                  ? Icons.check
                                  : Icons.error),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
