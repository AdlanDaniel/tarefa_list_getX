import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

abstract class SessionRepository {
  Future<File> getFile();
  Future<File> saveMsgButton(String msg);
  // Future<File> saveListCheck(String);
  Future readMsg();
}
