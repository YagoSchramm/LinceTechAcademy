import 'dart:math';

abstract class Calculadora {
  static int dobro(int n) {
    return n * 2;
  }
}

void main(List<String> args) {
  final random = Random();
  final n= random.nextInt(200);
  final dobro= Calculadora.dobro(n);
  print(" O dobro do número $n e: $dobro");
}
