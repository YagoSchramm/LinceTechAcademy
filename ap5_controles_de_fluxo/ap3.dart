// A soma dos números pares entre 0 e XX e YYYY
import 'dart:math';

void main(List<String> args) {
  final random = Random();
  final int n = random.nextInt(900) + 100;
  final int soma = somaPar(n);
  print("A soma dos números pares entre 0 e $n e $soma");
}

int somaPar(int n) {
  int soma = 0;
  for (var i = 0; i <= n; i++) {
    if (i % 2 == 0) {
      soma += i;
    }
  }
  return soma;
}
