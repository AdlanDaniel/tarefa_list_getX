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
    readMsg();
    super.onInit();
  }

  TextEditingController msgEC = TextEditingController();
  var msgInicial = 'Mensagem inicial'.obs;
  saveMsg() {
    msgInicial.value = msgEC.text;
    repository.saveMsgButton(msgEC.text);
  }

  readMsg() {
    repository.readMsg().then((value) => msgInicial.value = jsonDecode(value));
  }
}
