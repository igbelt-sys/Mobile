//pagina de contato
//campo para nome, email, telefone e mensagem
//botao para enviar

import 'package:flutter/material.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({super.key});

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  //atributos
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _mensagemController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _telefoneController.dispose();
    _mensagemController.dispose();
    super.dispose();
  }

  //metodos
  //build da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contato"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // nao usaremos form
              TextField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: "Nome"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _telefoneController,
                //mascara de telefone (XX) XXXXX-XXXX
                decoration: const InputDecoration(
                  labelText: "Telefone",
                  hintText: "(XX) XXXXX-XXXX",
                ),
              ),
              const SizedBox(height: 20),
              //campo para mensagem com multiplas linhas
              TextField(
                controller: _mensagemController,
                decoration: const InputDecoration(labelText: "Mensagem"),
                maxLines: 5, //Limita o Campo a 5 Linhas
              ),
              const SizedBox(height: 20),
              //enviar mensagem
              ElevatedButton(
                onPressed: _enviarMensagem,
                child: const Text("Enviar Mensagem"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _enviarMensagem() {
    //exibir um dialogo de confirmacao
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmacao de Envio"),
        content: ListBody(
          children: [
            const Text("Voce tem certeza que deseja enviar a mensagem?"),
            const SizedBox(height: 20),
            Text("Nome: ${_nomeController.text}"),
            Text("Email: ${_emailController.text}"),
            Text("Telefone: ${_telefoneController.text}"),
            Text("Mensagem: ${_mensagemController.text}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              _nomeController.clear();
              _emailController.clear();
              _telefoneController.clear();
              _mensagemController.clear();
              Navigator.pop(context);
            },
            child: const Text("Enviar"),
          ),
        ],
      ),
    );
  }
}
