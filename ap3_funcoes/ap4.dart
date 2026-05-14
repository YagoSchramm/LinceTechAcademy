import 'dart:math';

void main(List<String> args) {
  final random = Random();
  List<int> listaTemp = List.filled(15, 0);
  for (var i = 0; i < listaTemp.length; i++) {
    listaTemp[i] = random.nextInt(5000) + 1;
  }
  printOrdenados(listaTemp);
}

void printOrdenados(List<int> nums) {
  final ordenados = List<int>.from(nums)..sort();
  for (var i = 0; i < ordenados.length; i++) {
    final decimal = ordenados[i].toString();
    final binario = ordenados[i].toRadixString(2);
    final octal = ordenados[i].toRadixString(8);
    final hex = ordenados[i].toRadixString(16);
    print("decimal: $decimal, binário: $binario, octal: $octal, hexadecimal: $hex");
  }
}
