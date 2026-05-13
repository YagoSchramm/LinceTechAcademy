void main() {
  const int a = 25;
  const int b = 4;

  const double resultado = a / b;
  final int resultadoInteiro = resultado.floor();
  final double resultadoDecimal = (resultado.floor() - resultado).abs();

  print('a: $a');
  print('b: $b');
  print('resultado: $resultado');
  print('parte inteira do resultado: $resultadoInteiro');
  print('parte decimal do resultado: $resultadoDecimal');
}
