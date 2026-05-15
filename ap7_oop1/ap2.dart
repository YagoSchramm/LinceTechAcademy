class Retangulo {
  Retangulo(this.altura, this.largura);

  final double altura;
  final double largura;

  double calcularArea() {
    return this.altura * this.largura;
  }
}

void main(List<String> args) {
  final retangulo = Retangulo(10, 5);
  final area = retangulo.calcularArea();
  print("Área do retângulo: $area");
}
