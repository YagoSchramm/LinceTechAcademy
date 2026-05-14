import 'dart:math';

void main(List<String> args) {
  final int Function(int Function(int) func) funcaoA = (func) {
    final random = Random();

    int n1 = random.nextInt(10) + 1;
    int n2 = random.nextInt(10) + 1;

    return func(n1) + func(n2);
  };

  final int Function(int n1) funcaoB = (n1) {
    return n1 * n1;
  };

  final int Function(int n1) funcaoC = (n1) {
    return n1 + n1;
  };

  print("A(B): ${funcaoA(funcaoB)}");
  print("A(C): ${funcaoA(funcaoC)}");
  
}
