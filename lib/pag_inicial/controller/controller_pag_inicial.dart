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

  TextEditingController tarefaEC = TextEditingController();
  RxList listAction = [].obs;
  addAction() {
    RxMap task = {}.obs;
    task['title'] = tarefaEC.text;
    task['check'] = false;
    listAction.add(task);
    tarefaEC.clear();

    // repository.saveListButton(listAction);
  }

  Future saveListButton() async {
    await repository.saveListButton(listAction);
  }

  Future<void> saveListCheck(List list) async {
    await repository.saveListCheck(list);
  }

  Future readList() async {
    await repository.readList();
    print(repository.readList().runtimeType);
    print(repository.readList());
  }
}
