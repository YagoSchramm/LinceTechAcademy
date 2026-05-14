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
    final decimal = ordenados[i];
    final binario =converterParaBinario(ordenados[i]);
    final octal = converterParaOctal(ordenados[i]);
    final hex = converterParaHexadecimal(ordenados[i]);
    print("decimal: $decimal, binário: $binario, octal: $octal, hexadecimal: $hex");
  }
}

String converterParaBinario(int n) => n.toRadixString(2);

String converterParaOctal(int n) => n.toRadixString(8);

String converterParaHexadecimal(int n) => n.toRadixString(8);
