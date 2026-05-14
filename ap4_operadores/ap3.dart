void main(List<String> args) {
  final listaNomes = ["Yago", "Vitor", "Gustavo", "Gabriel", "Arthur", "Lucas"];
  final novaLista = removeElemento(elemento: "Yago", lista: listaNomes);
  for (var item in novaLista) {
    print('Item: $item');
  }
}

List<String> removeElemento({List<String>? lista, String? elemento}) {
  lista?.remove(elemento);
  return lista ?? [];
}
