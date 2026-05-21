import 'package:ap1/pessoa_state.dart';
import 'package:ap1/screens/tela_criar.dart';
import 'package:ap1/screens/tela_lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EstadoListaDePessoas(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomeWidget(),
        "/telaLista": (context) => TelaLista(),
        "/telaCriar": (context)=> TelaCriar(),
      },
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela inicial")),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/telaLista");
              },
              child: Text(
                "Tela de Pessoas",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/telaCriar");
              },
              child: Text(
                "Adicionar/Editar Pessoas",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
