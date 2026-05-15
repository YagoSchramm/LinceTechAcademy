import 'dart:math';

enum GenerosMusicais { trap, rap, pagode, mpb, samba }

void main(List<String> args) {
  final random = Random();
  final genero = GenerosMusicais.values[random.nextInt(5)];
  switch (genero) {
    case GenerosMusicais.rap:
    case GenerosMusicais.mpb:
    case GenerosMusicais.pagode:
    case GenerosMusicais.trap:
    case GenerosMusicais.samba:
      print("Meu gênero musical preferido e o: ${genero.name}");
      break;
  }
}
