import 'package:flutter/material.dart';
import 'package:listatrarefas_provider/Controller/tarefa_controller.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dash de Tarefas"), centerTitle: true),
      body: Consumer<TarefaController>(
        builder: (context, controller, child) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _construtorCard(
                  titulo: "Total de Tarefas",
                  value: controller.totalTarefas.toString(),
                  icon: Icons.list_alt,
                  color: Colors.blue,
                ),
                _construtorCard(
                  titulo: "Tarefas Concluidas",
                  value: controller.totalTarefasConcluidas.toString(),
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
                _construtorCard(
                  titulo: "Tarefas Pendentes",
                  value: controller.totalTarefasPendente.toString(),
                  icon: Icons.pending_actions,
                  color: Colors.orange,
                ),
                _construtorCard(
                  titulo: "Porcentagem de Tarefas Concluidas",
                  value:
                      "${controller.porcentagemTarefasConcluidas.toStringAsFixed(2)}%",
                  icon: Icons.bar_chart,
                  color: Colors.yellow,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _construtorCard({
  required String titulo,
  required String value,
  required IconData icon,
  required Color color,
}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.15),
        child: Icon(icon, color: color),
      ),
      title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: Text(
        value,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    ),
  );
}
