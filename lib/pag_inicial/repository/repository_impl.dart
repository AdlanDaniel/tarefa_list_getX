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
  Future<File> saveMsgButton(String msg) async {
    String msgJson = jsonEncode(msg);
    File file = await getFile();

    return file.writeAsString(msgJson);
  }

  @override
  Future readMsg() async {
    try {
      File file = await getFile();

      return file.readAsString();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // @override
  // Future<File> saveListCheck(List list) async {
  //   String listJson = jsonEncode(list);
  //   File file = await getFile();
  //   return file.writeAsString(listJson);
  // }
}
