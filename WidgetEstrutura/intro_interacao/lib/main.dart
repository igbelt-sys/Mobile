import 'package:flutter/material.dart';

import 'pages/contato_page.dart';
import 'pages/formlario_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //sistema de rotas para navegacao entre telas
      //home: -> tela inicial
      //form: -> tela de formulario
      //contato: -> tela de contato
      routes: {
        "/": (context) => const HomePage(),
        "/form": (context) => const FormularioPage(),
        "/contato": (context) => const ContatoPage(),
      },
      initialRoute: "/", //direciona o aplicativo para a homepage ao abrir
    );
  }
}
