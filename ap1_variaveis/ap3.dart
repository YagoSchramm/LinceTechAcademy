import 'dart:math';

void main(List<String> args) {
  final random = Random();
  int a = random.nextInt(100) * 2;
  int b = random.nextInt(100) * 2;
  print("a = $a b = $b");
  a = a + b;
  b = a - b;
  a = a - b;
  print("a = $a b = $b");
}
