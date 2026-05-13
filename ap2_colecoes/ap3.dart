import 'dart:math';

void main(List<String> args) {
  final random = Random();
  List<int> listaOriginal = [];
  for (var i = 0; i < 50; i++) {
    listaOriginal.add(random.nextInt(12)+10);
  }
  List<int> itensUnicos= listaOriginal.toSet().toList();
  print("lista original: ${listaOriginal.join(" ; ")}");
  print("Itens únicos: ${itensUnicos.join(" ; ")}");
}