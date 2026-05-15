import 'dart:math';

abstract class Forma {
  double calcularArea();
}

class Retangulo implements Forma {
  final double altura;
  final double largura;

  Retangulo(this.altura, this.largura) {
    if (altura <= 0 || largura <= 0) {
      throw Exception(
        "Dimensões inválidas, informe apenas valores positivos maiores que zero",
      );
    }
  }

  @override
  double calcularArea() {
    return this.altura * this.largura;
  }
}

void main(List<String> args) {
  final random = Random();
  
  try {
    final retangulo = Retangulo(
      random.nextDouble() * 99,
      random.nextDouble() * 99,
    );

    final area = retangulo.calcularArea();
    print("Area do retângulo: $area");
  } catch (e) {
    print(e);
  }
}
