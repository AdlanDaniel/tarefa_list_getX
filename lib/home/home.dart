import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tarefa/Routes/Routes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.pagInicial);
              },
              child: Text('Ir para pagina Inicial'))
        ],
      )),
    );
  }
}
