import 'package:flutter/material.dart';
import 'package:listatrarefas_provider/Controller/tarefa_controller.dart';
import 'package:listatrarefas_provider/View/tarefas_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TarefaController(),
      child: const MaterialApp(home: TarefasPage()),
    );
  }
}
