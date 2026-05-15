void main() async {
  print('Iniciando lançamento');

 await contagem(10);

  print('Foguete lançado!');
}

Future<void> contagem(int val) async {
  for (var i = val; i > 0; i--) {
    print(i);
    await Future.delayed(Duration(seconds: 1));
  }
}
