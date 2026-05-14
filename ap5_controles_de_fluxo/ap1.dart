void main(List<String> args) {
  final lista = listaImpar(10);
  for (var i = 0; i < lista.length; i++) {
    print("Impar: ${lista[i]}");
  }
}

List<int> listaImpar(int n) {
  List<int> listaImpar = [];
  for (var i = 0; i < n; i++) {
    if (i % 2 != 0) {
      listaImpar.add(i);
    } else {
      continue;
    }
  }
  return listaImpar;
}
