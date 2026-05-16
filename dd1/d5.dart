// Tempo 6:31 min
import 'dart:math';

void main(List<String> args) {
  final nomes = <String>[
    "Ana",
    "Francisco",
    "Joao",
    "Pedro",
    "Gabriel",
    "Rafaela",
    "Marcio",
    "Jose",
    "Carlos",
    "Patricia",
    "Helena",
    "Camila",
    "Mateus",
    "Gabriel",
    "Maria",
    "Samuel",
    "Karina",
    "Antonio",
    "Daniel",
    "Joel",
    "Cristiana",
    "Sebastião",
    "Paula",
  ];
  final sobrenomes = <String>[
    "Silva",
    "Ferreira",
    "Almeida",
    "Azevedo",
    "Braga",
    "Barros",
    "Campos",
    "Cardoso",
    "Teixeira",
    "Costa",
    "Santos",
    "Rodrigues",
    "Souza",
    "Alves",
    "Pereira",
    "Lima",
    "Gomes",
    "Ribeiro",
    "Carvalho",
    "Lopes",
    "Barbosa",
  ];
  final nome=geraNomeOuSobrenome(nomes);
  final sobrenome=geraNomeOuSobrenome(sobrenomes);
  print("$nome $sobrenome");
}

String geraNomeOuSobrenome(List<String> nomes) {
  final random = Random();
  final i = random.nextInt(nomes.length);
  return nomes[i];
}
