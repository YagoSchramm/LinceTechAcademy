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
  late Color corAleatoria;

  @override
  void initState() {
    super.initState();
    corAleatoria = gerarCorAleatoria();
  }

  Color gerarCorAleatoria() {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cores aleatorias',
      home: Scaffold(
        appBar: AppBar(title: const Text('Cores aleatorias')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Toque no botao para mudar a cor do texto',
                style: TextStyle(color: corAleatoria),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    corAleatoria = gerarCorAleatoria();
                  });
                },
                child: const Text('Clique aqui'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
