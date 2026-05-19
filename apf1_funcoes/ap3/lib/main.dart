import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

enum EstadoDoJogo {
  emAndamento,
  ganhou,
  perdeu,
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();

  var vitorias = 0;
  var derrotas = 0;
  var botaoCorreto = 0;
  var clicks = 0;
  var estadoDoJogo = EstadoDoJogo.emAndamento;

  @override
  void initState() {
    super.initState();
    iniciarJogo();
  }

  void tentativa(int opcao) {
    setState(() {
      if (opcao == botaoCorreto) {
        vitorias++;
        estadoDoJogo = EstadoDoJogo.ganhou;
      } else {
        clicks++;
      }

      if (clicks >= 2 && estadoDoJogo != EstadoDoJogo.ganhou) {
        derrotas++;
        estadoDoJogo = EstadoDoJogo.perdeu;
      }
    });
  }

  void iniciarJogo() {
    setState(() {
      botaoCorreto = random.nextInt(3);
      clicks = 0;
      estadoDoJogo = EstadoDoJogo.emAndamento;
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (estadoDoJogo) {
      EstadoDoJogo.ganhou => GanhouJogo(iniciarJogo),
      EstadoDoJogo.perdeu => PerdeuJogo(iniciarJogo),
      EstadoDoJogo.emAndamento => Jogo(vitorias, derrotas, tentativa),
    };
  }
}

class GanhouJogo extends StatelessWidget {
  const GanhouJogo(this.reiniciar, {super.key});

  final void Function() reiniciar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Voce ganhou!'),
          ElevatedButton(
            onPressed: reiniciar,
            child: const Text('Jogar novamente'),
          ),
        ],
      ),
    );
  }
}

class PerdeuJogo extends StatelessWidget {
  const PerdeuJogo(this.reiniciar, {super.key});

  final void Function() reiniciar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Voce perdeu!'),
          ElevatedButton(
            onPressed: reiniciar,
            child: const Text('Jogar novamente'),
          ),
        ],
      ),
    );
  }
}

class Jogo extends StatelessWidget {
  const Jogo(this.vitorias, this.derrotas, this.tentativa, {super.key});

  final int vitorias;
  final int derrotas;
  final void Function(int opcao) tentativa;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Vitorias: $vitorias'),
        Text('Derrotas: $derrotas'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => tentativa(0),
          child: const Text('Opcao 1'),
        ),
        ElevatedButton(
          onPressed: () => tentativa(1),
          child: const Text('Opcao 2'),
        ),
        ElevatedButton(
          onPressed: () => tentativa(2),
          child: const Text('Opcao 3'),
        ),
      ],
    );
  }
}
