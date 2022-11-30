import 'package:get/get.dart';
import 'package:list_tarefa/pag_inicial/controller/controller_pag_inicial.dart';
import 'package:list_tarefa/pag_inicial/repository/repository.dart';
import 'package:list_tarefa/pag_inicial/repository/repository_impl.dart';

class PagInicialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SessionRepository>(SessionRepositoryImpl());

    Get.put(
        PagInicialController(repository: Get.find<SessionRepository>()));
  }
}
