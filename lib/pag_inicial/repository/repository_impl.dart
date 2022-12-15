import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:list_tarefa/pag_inicial/repository/repository.dart';
import 'package:path_provider/path_provider.dart';

class SessionRepositoryImpl implements SessionRepository {
  @override
  Future<File> getFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String file = directory.path;
    return File('${file}/data.json');
  }

  @override
  Future<File> saveListButton(List list) async {
    String listJson = jsonEncode(list);
    File file = await getFile();

    return file.writeAsString(listJson);
  }

  @override
  Future readList() async {
    try {
      File file = await getFile();

      return file.readAsString();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<File> saveListCheck(List list) async {
    String listJson = jsonEncode(list);
    File file = await getFile();
    return file.writeAsString(listJson);
  }

  @override
  void deleteAction(Map mapDelete, List list, int index, BuildContext context) {
    var duplicateAction = Map.from(mapDelete);

    String title = list[index]['title'];
    list.removeAt(index);
    saveListButton(list);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('A tarefa ${title} foi excluída'),
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: () {
          list.insert(index, duplicateAction);
          saveListButton(list);
        },
      ),
      duration: Duration(seconds: 5),
    ));
  }

  @override
  Future listRefresh(List list) async {
    await Future.delayed(Duration(seconds: 1));
    list.sort(((a, b) {
      if (a['check'] && !b['check']) {
        return 1;
      } else if (!a['check'] && b['check']) {
        return -1;
      } else {
        return 0;
      }
    }));
    // saveListButton(list);
    // return null;
  }
}
