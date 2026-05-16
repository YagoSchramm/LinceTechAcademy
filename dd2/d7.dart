import 'dart:collection';
import 'dart:math';
// Tempo 25:53 min
void main(List<String> args) {
  Fila fila = Fila();
  for (var i = 0; i < 10; i++) {
    fila.entrarNafila(GeradorNomes.geraNome());
  }
  for (var i = 0; i < 10; i++) {
    fila.atender();
  }
}

class Fila {
  Queue<String> fila = Queue<String>();
  void entrarNafila(String nome) {
    fila.addLast(nome);
    print("$nome entrou na fila");
  }

  void atender() {
    final String nome = fila.first;
    print("$nome foi atendido(a)");
    fila.removeFirst();
  }
}

class GeradorNomes {
  static const nomes = <String>[
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
  static const sobrenomes = <String>[
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

  static String geraNome() {
    final random = Random();
    final i = random.nextInt(nomes.length);
    final j = random.nextInt(sobrenomes.length);
    return "${nomes[i]} ${sobrenomes[j]}";
  }
}
