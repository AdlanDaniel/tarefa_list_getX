import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tarefa/Routes/Routes.dart';
import 'package:list_tarefa/home/home.dart';
import 'package:list_tarefa/pag_inicial/binding/binding_pag_inicial.dart';
import 'package:list_tarefa/pag_inicial/page/pag_inicial.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    getPages: [
      GetPage(
          name: Routes.pagInicial,
          page: () => PagInicial(),
          binding: PagInicialBinding())
    ],
  ));
}
