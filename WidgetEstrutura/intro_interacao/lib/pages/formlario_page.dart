// tela com elementos de formulario para interacao do usuario
// textField -> entrada de dados
// checkbox -> selecao de opcoes
// radio button -> uma unica opcao
// slider -> barra de selecao
//switch -> botao de alternancia
// dropdown => menu suspenso

// usar elemento form para validacao de campos

import 'package:flutter/material.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  //atributos (nome, email, senha, validacao de senha, termos de uso(switch), sexo(radio), idade(slider), interesses(checkbox), Cidade(dropdown) )
  String _nome = ""; //TextField
  String _email = ""; //TextField
  String _senha = ""; // TextField => obscureText
  String _confirmarSenha = ""; //Texfield => obscureText
  bool _aceitarTermos = false; // Switch
  String _sexo = "Feminino"; // Radio Button
  double _idade = 18; // Slider
  final List<String> _interesses = []; //CheckBox
  String _cidade = "Americana"; // DropDown

  //variavel booleana para ocultar senha
  bool _senhaOculta = true;

  //chave global de validacao do formulario
  final formKey = GlobalKey<FormState>(); // formulario somente sera enviado se a chave estiver validada

  Widget _buildInteresse(String interesse) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _interesses.contains(interesse),
          onChanged: (bool? value) => setState(() {
            if (value ?? false) {
              if (!_interesses.contains(interesse)) {
                _interesses.add(interesse);
              }
            } else {
              _interesses.remove(interesse);
            }
          }),
        ),
        Text(interesse),
      ],
    );
  }

  //metodo que contem a logica de construcao da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario de Cadastro"),
      ),
      body: Padding(
        //espacamento geral de 8px em toda a tela
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey, //chave de validacao
          child: SingleChildScrollView(
            // permite a rolagem/scroll da tela
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //campo do nome
                TextFormField(
                  //validacao do campo
                  validator: (value) =>
                      value!.isEmpty ? "Campo obrigatorio" : null,
                  onChanged: (value) => setState(() => _nome = value), // atribui para o _nome o valor do TextField
                  //labeltext => placeholder do campo // border => borda externa do campo
                  decoration: const InputDecoration(
                    labelText: "Digite seu nome...",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                //campo email
                TextFormField(
                  validator: (value) =>
                      value!.contains("@") ? null : "Email invalido",
                  onChanged: (value) => setState(() => _email = value),
                  decoration: const InputDecoration(
                    labelText: "Digite seu email...",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                //campo senha
                TextFormField(
                  validator: (value) => value!.length >= 6
                      ? null
                      : "A senha deve conter no minimo 6 caracteres",
                  onChanged: (value) => setState(() => _senha = value),
                  obscureText: _senhaOculta,
                  decoration: InputDecoration(
                    labelText: "Digite sua senha...",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      //icone dentro do input
                      //toda vez que apertar o botao, inverte o valor da booleana
                      onPressed: () =>
                          setState(() => _senhaOculta = !_senhaOculta),
                      icon: Icon(
                        _senhaOculta ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  //mecanismo para mostrar senha oculta
                ),
                const SizedBox(height: 10),

                //campo confirmar senha
                TextFormField(
                  validator: (value) =>
                      value == _senha ? null : "As senhas devem ser iguais",
                  onChanged: (value) =>
                      setState(() => _confirmarSenha = value),
                  obscureText: _senhaOculta,
                  decoration: InputDecoration(
                    labelText: "Digite a confirmacao da senha...",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      //icone dentro do input
                      onPressed: () =>
                          setState(() => _senhaOculta = !_senhaOculta),
                      icon: Icon(
                        _senhaOculta ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  //mecanismo para mostrar senha oculta
                ),

                //radio button para selecao de sexo
                const SizedBox(height: 10),
                const Text("Sexo:"),
                RadioGroup<String>(
                  groupValue: _sexo,
                  onChanged: (String? value) => setState(() {
                    _sexo = value ?? _sexo;
                  }),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(value: "Feminino"),
                          Text("Feminino"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(value: "Masculino"),
                          Text("Masculino"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(value: "Outro"),
                          Text("Outro"),
                        ],
                      ),
                    ],
                  ),
                ),

                //Slider para Selecionar a Idade
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("Idade: ${_idade.toInt()}"), //exibir a idade selecionada
                    Expanded(
                      child: Slider(
                        value: _idade,
                        onChanged: (value) => setState(() {
                          _idade = value;
                        }),
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: _idade.toInt().toString(),
                      ),
                    ),
                  ],
                ),

                // CheckBox para selecionar interesses
                const SizedBox(height: 10),
                const Text("Interesses Pessoais:"),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildInteresse("Cinema"),
                    _buildInteresse("Teatro"),
                    _buildInteresse("RPG"),
                    _buildInteresse("Esporte"),
                    _buildInteresse("Musica"),
                    _buildInteresse("Viagem"),
                  ],
                ),

                // Dropdown para selecionar a Cidade
                const SizedBox(height: 20),
                const Text("Cidade:"),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  initialValue: _cidade,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: "Americana",
                      child: Text("Americana"),
                    ),
                    DropdownMenuItem(
                      value: "Nova Odessa",
                      child: Text("Nova Odessa"),
                    ),
                    DropdownMenuItem(
                      value: "Sumare",
                      child: Text("Sumare"),
                    ),
                    DropdownMenuItem(
                      value: "Campinas",
                      child: Text("Campinas"),
                    ),
                    DropdownMenuItem(
                      value: "Santa Barbara d'Oeste",
                      child: Text("Santa Barbara d'Oeste"),
                    ),
                    DropdownMenuItem(
                      value: "Outra",
                      child: Text("Outra"),
                    ),
                  ],
                  onChanged: (String? value) => setState(() {
                    _cidade = value ?? _cidade;
                  }),
                ),
                const SizedBox(height: 20),

                // switch para aceitar os termos de uso
                Row(
                  children: [
                    Switch(
                      value: _aceitarTermos,
                      onChanged: (bool value) => setState(() {
                        _aceitarTermos = value;
                      }),
                    ),
                    const Text("Aceitar os Termos de Uso"),
                  ],
                ),
                const SizedBox(height: 20),

                //botao de envio do formulario
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _enviarFormulario,
                    child: const Text("Enviar Formulario"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _enviarFormulario() {
    //verificacao do formulario
    // mostrar os dados em dialog
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (!_aceitarTermos) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Voce precisa aceitar os termos de uso"),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Dados do Formulario"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Nome: $_nome"),
              Text("Email: $_email"),
              Text("Senha: $_senha"),
              Text("Confirmacao: $_confirmarSenha"),
              Text("Sexo: $_sexo"),
              Text("Idade: ${_idade.toInt()}"),
              Text("Interesses: ${_interesses.join(", ")}"),
              Text("Cidade: $_cidade"),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Fechar"),
          ),
        ],
      ),
    );
  }
}
