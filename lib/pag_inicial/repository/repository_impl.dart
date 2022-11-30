import 'dart:convert';
import 'dart:io';

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
      print(file.exists());
      print(file.readAsString().toString());
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
}
