import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

abstract class SessionRepository {
  Future<File> getFile();
  Future<File> saveListButton(List list);
  Future<File> saveListCheck(List list);
  Future readList();
  void deleteAction(Map mapDelete, List list, int index, BuildContext context);
  Future listRefresh(List list);
}
