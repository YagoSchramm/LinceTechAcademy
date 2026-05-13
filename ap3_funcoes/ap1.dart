import 'dart:math';

void main(List<String> args) {
  final random = Random();

  final List<int> lista1 = List.filled(5, 0);
  final List<int> lista2 = List.filled(5, 0);
  for (var i = 0; i < lista1.length; i++) {
    lista1[i] = random.nextInt(100);
    lista2[i] = random.nextInt(100);
  }
  void printLista(List<int> Lista1) {
    print("Lista: ${Lista1.join(" , ")}");
  }

  List<int> funcSoma(List<int> Lista1, List<int> Lista2) {
    List<int> listaSoma = [];
    for (var i = 0; i < Lista1.length; i++) {
      listaSoma.add(lista1[i] + lista2[i]);
      print("${lista1[i]}+${lista2[i]}");
    }
    return listaSoma;
  }

  printLista(lista1);
  printLista(lista2);
  final listaSoma = funcSoma(lista1, lista2);
  printLista(listaSoma);
}
