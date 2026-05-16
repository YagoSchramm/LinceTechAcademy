// Tempo 9:11 min

import 'dart:math';

void main(List<String> args) {
  final random = Random();
  final n = random.nextInt(100);
  int somatorioFor = 0;
  for (var i = n; i >= 1; i--) {
    somatorioFor += i;
  }
  int contador = n;
  int somatorioWhile = 0;
  while (contador >= 1) {
    somatorioWhile += contador;
    contador--;
  }
  int somatorioRecursao = recursao(n);
  int somatorioColecao = colecao(n);
  print("for: $somatorioFor");
  print("while: $somatorioWhile");
  print("recursao: $somatorioRecursao");
  print("colecao: $somatorioColecao");
}

int recursao(int n) {
  if (n <= 1) {
    return n++;
  }
  return n + recursao(n - 1);
}

int colecao(int n) {
  List<int> numeros = List.generate(n, (index) => index + 1);
  return numeros.reduce((acumulador, elemento) => acumulador + elemento);
}
