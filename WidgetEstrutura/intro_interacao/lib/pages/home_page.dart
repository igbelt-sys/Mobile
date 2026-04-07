//tela inicial
//vai conter botoes de navegacao para outras telas

import 'package:flutter/material.dart';

//tela inicial -> logo do app e botoes de navegacao
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _rotationAnimation = Tween<double>(
      begin: -1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu aplicativo Interativo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _rotationAnimation,
                child: Image.network(
                  "https://pbs.twimg.com/media/FTIuycrUYBIq6KM.jpg",
                  width: 200,
                  height: 200,
                ),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value * 3.14159,
                    child: child,
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/form"),
                child: const Text("Formulario"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/contato"),
                child: const Text("Contato"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
