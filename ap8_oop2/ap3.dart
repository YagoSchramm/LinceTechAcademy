abstract class Pessoa {
  void apresentar();
}

abstract class Programador {
  void profissao();
}

class ProgramadorDart implements Pessoa, Programador {
  @override
  void apresentar() {
    print("Olá eu sou uma pessoa");
  }

  @override
  void profissao() {
    print("Eu trabalho com programação e utilizo a linguagem Dart");
  }
}

void main(List<String> args) {
  final programadorDart=ProgramadorDart();
  programadorDart.apresentar();
  programadorDart.profissao();
}
