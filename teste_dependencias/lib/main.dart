//arquivo princal da aplicação
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(
    MaterialApp(
      home: //estrutura maxima de janela
      Scaffold(
        appBar: AppBar(title: Text("Meu primeiro App")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Notificação enviada com sucesso!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
              );
            },
            child: Text("Clique aqui para enviar uma notificação"),
          ),
        ),
      ),
    ),
  );
}
