import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // remove a faixa de debug do canto
      title: 'Perfil',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3F3F3F),

      body: SafeArea(
        // evita que o conteúdo fique embaixo da barra do celular

        child: Column(
          // Column organiza widgets um embaixo do outro

          children: [
            // topo
            Container(
              width: double.infinity,
              // faz ocupar toda a largura

              padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
              // espaçamento interno

              decoration: const BoxDecoration(
                color: Color(0xFF83A4F3),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // alinha os itens à esquerda

                children: [
                  const Text(
                    'Olá, Igor',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 16),
                  // espaço entre elementosko

                  Row(
                    // Row coloca widgets lado a lado

                    children: [
                      const CircleAvatar(
                        radius: 38,
                        // cria uma imagem redonda

                        backgroundImage: AssetImage('imagens/perfil.png'),
                        // imagem que vem da pasta do projeto
                      ),

                      const SizedBox(width: 38),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Igor Beltramo',
                            style: TextStyle(fontSize: 16),
                          ),

                          Container(
                            width: 102,
                            height: 2,
                            color: const Color(0xFF4567E8),
                            // pequena linha decorativa
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // corpo da tela
            Expanded(
              // faz o conteúdo ocupar o resto da tela

              child: Column(
                children: [
                  const SizedBox(height: 8),

                  //card do cartao
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: Container(
                      height: 160,
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: const Color(0xFF1D225A),
                        borderRadius: BorderRadius.circular(12),
                        // bordas arredondadas
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'R\$ 100,22',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),

                              const SizedBox(width: 10),

                              const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.white,
                              ),
                              // ícone de olho

                              const Spacer(),
                              // empurra o próximo ícone para a direita

                              const Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                            ],
                          ),

                          const Spacer(),

                          const Text(
                            '551  x x x x x x x x x x x  12',
                            style: TextStyle(color: Colors.white),
                          ),

                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Visa',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  //bolinhas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      _dot(const Color(0xFF82A8FF)),
                      const SizedBox(width: 6),
                      _dot(Colors.white),
                      const SizedBox(width: 6),
                      _dot(Colors.white70),
                    ],
                  ),

                  const SizedBox(height: 22),

                  const Text(
                    'Atividade',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),

                  const SizedBox(height: 12),

                  // atividades
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),

                      child: Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: const Color(0xFFB9C8E9),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: Column(
                          children: const [
                            ActivityCard(
                              icon: Icons.arrow_upward,
                              iconColor: Color(0xFF4BE26A),
                              nome: 'Nome sobrenome',
                              data: 'Ontem 12:20',
                              valor: 'R\$ 28,60',
                            ),

                            SizedBox(height: 28),

                            ActivityCard(
                              icon: Icons.arrow_downward,
                              iconColor: Colors.red,
                              nome: 'Nome sobrenome',
                              data: '09/02 14:22',
                              valor: 'R\$ 59,30',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // menu inferior
                  Container(
                    height: 62,

                    decoration: BoxDecoration(
                      color: const Color(0xFF83A4F3),
                      borderRadius: BorderRadius.circular(22),
                    ),

                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Icon(Icons.home_outlined),
                        Icon(Icons.smartphone_outlined),
                        Icon(Icons.account_balance_wallet_outlined),
                        Icon(Icons.chat_bubble_outline),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _dot(Color color) {
    // função que cria as bolinhas 

    return Container(
      width: 10,
      height: 10,

      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  // widget reutilizável para mostrar uma atividade

  final IconData icon;
  final Color iconColor;
  final String nome;
  final String data;
  final String valor;

  const ActivityCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.nome,
    required this.data,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),

      decoration: BoxDecoration(
        color: const Color(0xFF5E68D4),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [
          Icon(icon, color: iconColor),

          const SizedBox(width: 12),

          Expanded(
            // ocupa o espaço do meio

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(nome, style: const TextStyle(color: Colors.white)),

                Text(
                  data,
                  style: const TextStyle(
                    color: Color(0xFFB8B8FF),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          Text(valor),
        ],
      ),
    );
  }
}