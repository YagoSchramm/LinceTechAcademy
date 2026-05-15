import 'dart:math';

class Pessoa {
  String _nome = "";
  int _idade = 0;
  double _altura = 0.0;

  int get idade => _idade;
  double get altura => _altura;
  String get nome => _nome;

  set idade(int valor) {
    if (valor >= 0) {
      _idade = valor;
    } else {
      print("A idade deve ser um valor maior do que zero.");
    }
  }

  set nome(String valor) {
    _nome = valor;
  }

  set altura(double valor) {
    _altura = valor;
  }
}

void main(List<String> args) {
  final pessoa = Pessoa();

  pessoa.nome = "Yago";
  pessoa.idade = 17;
  pessoa._altura = 1.81;

  print("Nome: ${pessoa.nome}");
  print("Idade: ${pessoa.idade}");
  print("Altura: ${pessoa.altura.toStringAsFixed(2)}");
}
