import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Random random = Random();
  final List<String> opcoes = ['A', 'B', 'C'];
  late String opcaoCorreta;
  String mensagem = 'Escolha uma opcao. Voce tem 2 chances.';
  int tentativasRestantes = 2;
  Color corDeFundo = Colors.white;
  bool rodadaEncerrada = false;

  @override
  void initState() {
    super.initState();
    opcaoCorreta = sortearOpcaoCorreta();
  }

  String sortearOpcaoCorreta() {
    return opcoes[random.nextInt(opcoes.length)];
  }

  void verificarResposta(String opcaoSelecionada) {
    if (rodadaEncerrada) {
      return;
    }

    setState(() {
      if (opcaoSelecionada == opcaoCorreta) {
        mensagem = 'Voce acertou!';
        corDeFundo = Colors.green;
        rodadaEncerrada = true;
      } else {
        tentativasRestantes--;

        if (tentativasRestantes == 0) {
          mensagem = 'Voce errou as 2 chances!';
          corDeFundo = Colors.red;
          rodadaEncerrada = true;
        } else {
          mensagem = 'Tente novamente. Voce ainda tem 1 chance.';
        }
      }
    });
  }

  void novaRodada() {
    setState(() {
      opcaoCorreta = sortearOpcaoCorreta();
      tentativasRestantes = 2;
      mensagem = 'Escolha uma opcao. Voce tem 2 chances.';
      corDeFundo = Colors.white;
      rodadaEncerrada = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sorteador de opcoes',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sorteador de opcoes')),
        backgroundColor: corDeFundo,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mensagem,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed:
                        rodadaEncerrada ? null : () => verificarResposta('A'),
                    child: const Text('Opcao A'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed:
                        rodadaEncerrada ? null : () => verificarResposta('B'),
                    child: const Text('Opcao B'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed:
                        rodadaEncerrada ? null : () => verificarResposta('C'),
                    child: const Text('Opcao C'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: novaRodada,
                child: const Text('Nova rodada'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
