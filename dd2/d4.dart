import 'dart:math' as math;
// Tempo 1:14:34 hrs
void main() {
    final comparador =
      ComparadorFormasGeometricas();

  final circulo =
      Circulo(nome:"Circulo",raio: 3);

  final retangulo =
      Retangulo(nome: "Retângulo", altura: 4, largura: 3);

  final triangulo =
      TrianguloEquilatero(nome:
          "Triângulo",lado:5);

  final maiorArea =
      comparador.maiorArea(
          circulo,
          triangulo);

  print(
    "Maior área:"
    "${maiorArea.nome}"
    " ${maiorArea.area.toStringAsFixed(2)}"
  );

  final maiorPerimetro =
      comparador.maiorPerimetro(
          retangulo,
          triangulo);

  print(
    "Maior perímetro:"
    "${maiorPerimetro.nome}"
    " ${maiorPerimetro.perimetro.toStringAsFixed(2)}"
  );
}

/// Classe abstrata para representar forma
abstract class Forma {
  Forma({required this.nome});
  final String nome;
  double get area;
  double get perimetro;
}

/// Representa a forma geometrica "círculo" REQ 1 padronizando métodos a partir da interface
class Circulo extends Forma {
  Circulo({required super.nome, required this.raio});

  final double raio;

  /// Retorna a area desse círculo
  @override
  double get area => math.pi * math.pow(raio, 2);

  /// Retorna o perímetro desse círculo
  @override
  double get perimetro => 2 * math.pi * raio;
}

/// Representa a forma geometrica "retângulo", forma geometrica de quatro lados
/// e angulos retos (90 graus).
class Retangulo extends Forma {
  Retangulo({required super.nome, required this.altura, required this.largura});

  final double altura;
  final double largura;

  @override
  double get area => altura * largura;

  @override
  double get perimetro => 2 * (altura + largura);
}

/// Representa a forma geometrica "quadrado", que e um formato especial de
/// retângulo, onde todos os lados possuem o mesmo tamanho.
class Quadrado extends Forma {
  /// Construtor padrao, recebe o [lado] do quadrado
  Quadrado({required super.nome, required this.lado});

  final double lado;

  /// Retorna a area desse quadrado
  @override
  double get area => lado * lado;

  /// Retorna o perímetro desse quadrado
  @override
  double get perimetro => lado * 4;
}

/// NOVAS FORMAS

class TrianguloEquilatero extends Forma {
  TrianguloEquilatero({required super.nome, required this.lado});

  final double lado;

  @override
  double get area => (math.sqrt(3) / 4) * lado * lado;

  @override
  double get perimetro => lado * 3;
}

class TrianguloRetangulo extends Forma {
  TrianguloRetangulo({
    required super.nome,
    required this.altura,
    required this.base,
  });

  final double base;
  final double altura;

  double get hipotenusa => math.sqrt(math.pow(base, 2) + math.pow(altura, 2));

  @override
  double get area => (base * altura) / 2;

  @override
  double get perimetro => base + altura + hipotenusa;
}

class PentagonoRegular extends Forma {
  PentagonoRegular({required super.nome, required this.lado});

  final double lado;

  @override
  double get area => (5 * lado * lado) / (4 * math.tan(math.pi / 5));

  @override
  double get perimetro => lado * 5;
}

class HexagonoRegular extends Forma {
  HexagonoRegular({required super.nome, required this.lado});

  final double lado;

  @override
  double get area => ((3 * math.sqrt(3)) / 2) * lado * lado;

  @override
  double get perimetro => lado * 6;
}

/// Compara caracteristicas de formas geometricas
class ComparadorFormasGeometricas {
  Forma maiorArea(Forma a, Forma b) {
    if (a.area > b.area) {
      return a;
    }
    return b;
  }

  Forma maiorPerimetro(Forma a, Forma b) {
    if (a.perimetro > b.perimetro) {
      return a;
    }
    return b;
  }
}
