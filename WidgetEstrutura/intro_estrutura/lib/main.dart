// tela para estudo dos widgets de exibição
//  text, image, icon entre outros

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
  //route = rotaas de navegação
  
  //home = pagina inicial 
  //themeapp = claro/escuro
  //colocar o materialApp no void main
    home: MyApp(),
  ));  
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //estrutura da tela 
  @override
  Widget build(BuildContext context) {
    return Scaffold(//elemento principal da tela 
    //appbar,drawer,bnBar,body,FAbutton,snakbar
  appBar: AppBar(title: Text("Exemplos de Widged de Exibição"),),
  body: Padding(
    padding: EdgeInsets.all(16),
    child: Text("Explorando o flutter",textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold
      ),
    ),
    ),    
    );
  }
}