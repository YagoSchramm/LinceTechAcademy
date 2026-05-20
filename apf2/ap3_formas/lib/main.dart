import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formas',
      home: FormasPage(),
    );
  }
}

class FormasPage extends StatefulWidget {
  const FormasPage({super.key});

  @override
  State<FormasPage> createState() => _FormasPageState();
}

class _FormasPageState extends State<FormasPage> {
  final Random _random = Random();
  bool _circulo = true;
  Color _cor = Colors.yellow;

  final List<Color> _cores = [
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
  ];

  void _alterarForma() {
    setState(() {
      _circulo = !_circulo;
    });
  }

  void _alterarCor() {
    setState(() {
      _cor = _cores[_random.nextInt(_cores.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1C2A),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _BotaoForma(
                  largura: 190,
                  texto: _circulo ? 'Alterar para quadrado' : 'Alterar para circulo',
                  onPressed: _alterarForma,
                ),
                const SizedBox(width: 10),
                _BotaoForma(
                  largura: 140,
                  texto: 'Cor aleatoria',
                  onPressed: _alterarCor,
                ),
              ],
            ),
            const SizedBox(height: 28),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: _cor,
                shape: _circulo ? BoxShape.circle : BoxShape.rectangle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotaoForma extends StatelessWidget {
  const _BotaoForma({
    required this.largura,
    required this.texto,
    required this.onPressed,
  });

  final double largura;
  final String texto;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura,
      height: 34,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1B1A24),
          foregroundColor: const Color(0xFFB9A3D9),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
