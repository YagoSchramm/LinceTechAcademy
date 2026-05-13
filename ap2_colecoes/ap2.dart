import 'dart:math';

void main(List<String> args) {
  final random = Random();
  List<int> listaOriginal = [];
  for (var i = 0; i < 50; i++) {
    listaOriginal.add(random.nextInt(100));
  }
  List<int> listaAtualizada = List.from(listaOriginal);

  listaAtualizada.removeWhere((num) => num % 2 == 0);
  print("lista original: ${listaOriginal.join(" ; ")}");
  print("lista atualizada : ${listaAtualizada.join(" ; ")}");
}
