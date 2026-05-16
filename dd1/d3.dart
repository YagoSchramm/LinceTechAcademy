// Tempo 29:04 min
void main(List<String> args) {
  final texto =
      """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.""";

  print("Parágrafo: \n" + texto);
  print("Numero de palavras: " + calculaPalavras(texto).toString());
  print("Tamanho do texto: ${calculaTamanho(texto)}");
  print("Numero de frases: ${calculaFrases(texto)}");
  print("Numero de vogais: ${calculaVogais(texto)}");
  print("Consoantes encontradas: ${encontrarConsoante(texto).join(" , ")}");
}

int calculaPalavras(String texto) {
  final palavras = texto.split(" ");
  return palavras.length;
}

int calculaTamanho(String texto) {
  final caracteres = texto.split("");
  return caracteres.length;
}

int calculaFrases(String texto) {
  final frases = texto.split(RegExp(r'[.!?]'));
  return frases.length - 1;
}

int calculaVogais(String texto) {
  int contador = 0;
  final caracteres = texto.split("");
  caracteres.removeWhere((element) => element == RegExp(r'[,.!?]'));
  for (var caractere in caracteres) {
    switch (caractere) {
      case "a":
      case "e":
      case "i":
      case "o":
      case "u":
        contador++;
        break;
      case "A":
      case "E":
      case "I":
      case "O":
      case "U":
        contador++;
        break;
    }
  }
  return contador;
}

Set<String> encontrarConsoante(String texto) {
  List<String> caracteres = texto.split("");
  final filtro = RegExp(r'[,.!?aeiou ]', caseSensitive: false);
  caracteres.removeWhere((element) => filtro.hasMatch(element));
  caracteres = caracteres.map((item) => item.toLowerCase()).toList();
  caracteres.sort();
  final consoantes = caracteres.toSet();
  return consoantes;
}
