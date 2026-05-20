import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class ItemCor {
  final Color cor;
  final String nome;

  ItemCor(this.cor, this.nome);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cores App',
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "/rotacor": (context) {
          return RotaCor(
            cor: ModalRoute.of(context)!.settings.arguments as Color,
          );
        },
      },
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final List<ItemCor> listaCores = [
    ItemCor(Colors.yellow, "Amarelo"),
    ItemCor(Colors.orange, "Laranja"),
    ItemCor(Colors.red, "Vermelho"),
    ItemCor(Colors.purple, "Roxo"),
    ItemCor(Colors.blue, "Azul"),
    ItemCor(Colors.green, "Verde"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista cores')),
      body: ListView.builder(
        itemCount: listaCores.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                "/rotacor",
                arguments: listaCores[index].cor,
              );
            },
            child: Container(
              height: 50,
              color: listaCores[index].cor,
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(8),
              child: Text(
                listaCores[index].nome,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RotaCor extends StatelessWidget {
  const RotaCor({super.key, required this.cor});
  final Color cor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cor,
      appBar: AppBar(
                backgroundColor: cor,
        title: Text("Cor selecionada", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
