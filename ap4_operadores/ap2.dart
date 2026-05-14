void main(List<String> args) {
  final textos = [
    '10',
    '2XXL7',
    'JOJ0',
    '99',
    '381',
    'AD44',
    '47',
    '2B',
    '123',
    '78',
  ];

  final listaConvertida= converterListaString(textos);
  print("Lista convertida: ${listaConvertida.join(", ")}");
}

List<int> converterListaString(List<String> textos) {
  List<int> listaConvertida = [];
  for (var texto in textos) {
    int? n = int.tryParse(texto);
    n ??= 0;
    listaConvertida.add(n);
  }
  return listaConvertida;
}
