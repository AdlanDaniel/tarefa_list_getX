// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:list_tarefa/pag_inicial/repository/repository.dart';
import 'package:list_tarefa/pag_inicial/repository/repository_impl.dart';

class PagInicialController extends GetxController {
  SessionRepository repository;

  PagInicialController({
    required this.repository,
  });
  @override
  void onInit() {
    readList();
    super.onInit();
  }

  TextEditingController tarefaEC = TextEditingController();
  RxList listAction = [].obs;

  addAction() {
    RxMap task = {}.obs;
    task['title'] = tarefaEC.text;
    task['check'] = false;
    listAction.add(task);
    tarefaEC.clear();
  }

  Future saveListButton() async {
    await repository.saveListButton(listAction);
  }

  Future<void> saveListCheck() async {
    await repository.saveListCheck(listAction.value);
  }

  Future readList() async {
    await repository.readList().then((value) {
      listAction.value = json.decode(value);
    });
  }

  deleteAction(int index, BuildContext context) {
    repository.deleteAction(listAction[index], listAction, index, context);
  }

  Future listRefresh() async {
    await repository.listRefresh(listAction.value);
    listAction.refresh();
  }
}
